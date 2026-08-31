import 'package:flutter/material.dart';

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
              child: const Center(
                child: Icon(Icons.lock_outline, size: 64),
              ),
            ),
          ),
      ],
    );
  }
}
