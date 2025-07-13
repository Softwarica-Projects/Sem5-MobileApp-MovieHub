import 'package:shake/shake.dart';
import 'package:flutter/material.dart';

mixin ShakeDetectorMixin<T extends StatefulWidget> on State<T> {
  late final ShakeDetector _detector;
  @mustCallSuper
  void onShakeDetected(ShakeEvent event) {
    debugPrint('Shake detected!');
  }

  @override
  void initState() {
    super.initState();
    _detector = ShakeDetector.autoStart(
      onPhoneShake: onShakeDetected,
    );
  }

  @override
  void dispose() {
    _detector.stopListening();
    super.dispose();
  }
}
