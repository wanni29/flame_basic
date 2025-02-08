import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_basic/basic/apple_world.dart';
import 'package:flutter/widgets.dart';

void main() {
  final myGame = FlameGame(
    world: AppleWorld(),
    camera: CameraComponent.withFixedResolution(
      width: 800,
      height: 600,
    )..viewfinder.anchor = Anchor.topLeft,
  );
  runApp(
    GameWidget(game: myGame), // Flutter 에서 실행
  );
}
