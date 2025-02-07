import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/components.dart';

void main() {
  final myGame = FlameGame(world: MyWorld());
  runApp(
    GameWidget(game: myGame),
  );
}

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    await add(MyCreate());
  }
}

class MyCreate extends SpriteComponent {
  // A component that renders the create sprite, with a 16 x 16 size.
  MyCreate() : super(size: Vector2.all(16));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.png');
  }
}
