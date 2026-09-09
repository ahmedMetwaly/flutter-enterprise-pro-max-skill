# 🔒 Enterprise Flutter Security Architecture Guide

Enterprise applications require rigorous security guidelines across credential management, local storage encryption, privacy protection, and network safety.

---

## 1. 🔑 Configuration vs Secrets Principle

> [!IMPORTANT]
> **Configuration $\neq$ Secret!**
> - **Configuration**: Base URLs, API endpoints, feature flags, public identifiers. (Safe in `.env` / `--dart-define`).
> - **Secret**: Private keys, database passwords, payment gateway secret keys. (MUST NEVER be embedded in client app binaries, because reverse engineering can extract `--dart-define` constants from compiled binaries). Secrets belong strictly on the backend / BFF (Backend-For-Frontend).

---

## 2. 🛡️ Hardware-Backed Secure Storage

Always configure `FlutterSecureStorage` with hardware encryption parameters:

```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: _androidOptions,
    iOptions: _iosOptions,
  );

  Future<void> saveAccessToken(String token) => _storage.write(key: 'access_token', value: token);
  Future<String?> getAccessToken() => _storage.read(key: 'access_token');
  Future<void> saveRefreshToken(String token) => _storage.write(key: 'refresh_token', value: token);
  Future<String?> getRefreshToken() => _storage.read(key: 'refresh_token');
  Future<void> clearAll() => _storage.deleteAll();
}
```

---

## 3. 🙈 App Switcher Privacy Screen Overlay

Prevent sensitive screen data leakage in task switchers:

```dart
class PrivacyScreenOverlay extends StatefulWidget {
  const PrivacyScreenOverlay({super.key, required this.child});
  final Widget child;

  @override
  State<PrivacyScreenOverlay> createState() => _PrivacyScreenOverlayState();
}

class _PrivacyScreenOverlayState extends State<PrivacyScreenOverlay> with WidgetsBindingObserver {
  bool _isBackgrounded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _isBackgrounded = (state == AppLifecycleState.inactive || state == AppLifecycleState.paused);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isBackgrounded)
          Positioned.fill(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: const Center(child: Icon(Icons.lock_outline, size: 64)),
            ),
          ),
      ],
    );
  }
}
```

---

## 4. 🚪 Inactivity Auto-Logout Timer

Automatically lock or logout users after a period of no touch interaction:

```dart
class InactivityDetector extends StatefulWidget {
  const InactivityDetector({
    super.key,
    required this.child,
    required this.onTimeout,
    this.timeout = const Duration(minutes: 5),
  });

  final Widget child;
  final VoidCallback onTimeout;
  final Duration timeout;

  @override
  State<InactivityDetector> createState() => _InactivityDetectorState();
}

class _InactivityDetectorState extends State<InactivityDetector> {
  Timer? _timer;

  void _resetTimer() {
    _timer?.cancel();
    _timer = Timer(widget.timeout, widget.onTimeout);
  }

  @override
  void initState() {
    super.initState();
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _resetTimer(),
      onPointerMove: (_) => _resetTimer(),
      child: widget.child,
    );
  }
}
```
