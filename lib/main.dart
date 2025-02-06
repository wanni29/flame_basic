import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_basic/player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    // Flame을 실행하려면, GameWidget을 사용하여야 한다.
    GameWidget(
      game: FlameGame(world: MyWorld()),
    ),
  );
}

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    add(Player(position: Vector2(0, 0)));
  }
}
