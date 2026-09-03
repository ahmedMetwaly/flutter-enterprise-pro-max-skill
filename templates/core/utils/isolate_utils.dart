import 'dart:async';
import 'dart:isolate';
import 'package:flutter/foundation.dart';

/// Enterprise Concurrency Utility for Flutter
/// Offloads heavy computation from the UI thread (Main Isolate) to background isolates
/// to maintain a strict 60/120 FPS without frame drops (zero UI jank).
class IsolateUtils {
  const IsolateUtils._();

  /// Executes a CPU-intensive task in a dedicated background isolate.
  /// Use this for:
  /// - Heavy JSON parsing (large API payloads)
  /// - Cryptography (hashing, encryption/decryption)
  /// - Image processing, compression, or decoding
  /// - Complex filtering/sorting over thousands of items
  static Future<R> run<M, R>(FutureOr<R> Function(M message) computation, M message) async {
    if (kIsWeb) {
      // Isolates are not supported on Web; fallback to standard execution
      return await computation(message);
    }
    return await Isolate.run(() => computation(message));
  }

  /// Runs a zero-parameter computation in a background isolate.
  static Future<R> runCompute<R>(FutureOr<R> Function() computation) async {
    if (kIsWeb) {
      return await computation();
    }
    return await Isolate.run(computation);
  }
}
