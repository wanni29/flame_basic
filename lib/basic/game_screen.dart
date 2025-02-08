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
            top: 50,
            left: 1000.0,
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 60),
                      ),
                      onPressed: () {
                        gameLoop.stopMovingX(); // 버튼을 누르면 X축이 멈춘다.
                      },
                      child: Text('Stop X'),
                    ),
                    SizedBox(width: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 60),
                      ),
                      onPressed: () {
                        gameLoop.stopMovingY(); // 버튼을 누르면 Y축이 멈춘다.
                      },
                      child: Text('Stop Y'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
