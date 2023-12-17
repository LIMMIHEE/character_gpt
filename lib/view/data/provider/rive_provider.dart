import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class RiveProvider extends ChangeNotifier {
  final RiveAnimationController winkController = OneShotAnimation(
    'Wink',
    autoplay: true,
  );
  final RiveAnimationController waveController = OneShotAnimation(
    'Wave',
    autoplay: false,
  );

  bool get isWavePlaying => waveController.isActive;
  Future<void> wavePlay() async {
    if (isWavePlaying) return;

    waveController.isActive = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    waveController.isActive = false;
  }
}
