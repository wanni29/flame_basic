import 'dart:developer';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameLoop extends FlameGame {
  double circleX = 0;
  double circleY = 0;
  bool isMoving = true;

// update의 값이 변함에 따라서
// render함수가 호출이 된다.
// 그에 따라서 그림이 이동하는것처럼 보인다.
  @override
  void update(double dt) {
    if (isMoving) {
      circleX += 300 * dt; // 원을 오른쪽으로 이동 (100px / sec)
    }
    log('circleX : ${circleX.toString()}');
    if (circleX > 735) {
      circleX = 0;
    }

    circleY += 300 * dt;
    if (circleY > size.y) {
      circleY = 0;
    }
  }

  @override
  void render(Canvas canvas) {
    // 다양한 도형 그리기

    // 원
    final paint = Paint()..color = Colors.blue;
    // 수평적 이동
    canvas.drawCircle(Offset(100, circleY), 50, paint);
    canvas.drawCircle(Offset(300, circleY), 50, paint);
    canvas.drawCircle(Offset(500, circleY), 50, paint);
    canvas.drawCircle(Offset(700, circleY), 50, paint);

    // 수직적 이동
    canvas.drawCircle(Offset(circleX, 100), 50, paint);
    canvas.drawCircle(Offset(circleX, 300), 50, paint);
    canvas.drawCircle(Offset(circleX, 500), 50, paint);
    canvas.drawCircle(Offset(circleX, 700), 50, paint);

    // 대각선 이동
    canvas.drawCircle(Offset(circleX, circleY), 50, paint);

    // 사각형
    // paint.color = Colors.red;
    // canvas.drawRect(Rect.fromLTWH(200, 50, 100, 100), paint);

    // 선
    // paint.color = Colors.green;
    // paint.strokeWidth = 5;
    // canvas.drawLine(Offset(50, 200), Offset(250, 200), paint);

    // 타원
    // paint.color = Colors.orange;
    // canvas.drawOval(Rect.fromLTWH(100, 250, 150, 80), paint);

    // 삼각형
    // paint.color = Colors.purple;
    // Path path = Path()
    //   ..moveTo(300, 50)
    //   ..lineTo(350, 150)
    //   ..lineTo(350, 150)
    //   ..lineTo(250, 150)
    //   ..close();
    // canvas.drawPath(path, paint);
  }

  void stopMoving() {
    isMoving = !isMoving;
  }
}
