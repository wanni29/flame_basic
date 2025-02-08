import 'package:flame/game.dart';
import 'package:flame_basic/basic/game_loop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameScreen extends StatelessWidget {
  final GameLoop gameLoop = GameLoop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: gameLoop), // FlameGame  클래스를 넣어야 한다.
          Positioned(
            child: ElevatedButton(
              onPressed: () {
                gameLoop.stopMoving(); // 버튼을 누르면 멈춘다.
              },
              child: Text('Time Magic'),
            ),
          )
        ],
      ),
    );
  }
}
