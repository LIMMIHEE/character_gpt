import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class RiveProvider extends ChangeNotifier {
  final RiveAnimationController winkController = OneShotAnimation(
    'Wink',
  );
  final RiveAnimationController waveController =
      OneShotAnimation('Wave', autoplay: false);
  final RiveAnimationController joyController =
      OneShotAnimation('Joy', autoplay: false);
  final RiveAnimationController sadController =
      OneShotAnimation('Sad', autoplay: false);
  final RiveAnimationController surprisedController =
      OneShotAnimation('Surprised', autoplay: false);

  bool isAnimationPlaying = false;
  Future<void> animationPlay({String playType = ''}) async {
    if (isAnimationPlaying) return;
    isAnimationPlaying = true;

    RiveAnimationController controller = waveController;
    switch (playType) {
      case "기쁨":
        {
          controller = joyController;
          break;
        }
      case "슬픔":
        {
          controller = sadController;
          break;
        }
      case "놀람":
        {
          controller = surprisedController;
          break;
        }
    }
    winkController.isActive = false;
    controller.isActive = true;

    await Future.delayed(
      const Duration(seconds: 1),
    );

    controller.isActive = false;
    isAnimationPlaying = false;
    winkController.isActive = true;
  }
}
