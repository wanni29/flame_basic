import 'dart:developer';
import 'dart:math';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameLoop extends FlameGame {
  // #1
  double angle = 0; // 회전 각도
  double radius = 200; // 원의 반지름
  double centerX = 0; // 배경의 중심 X
  double centerY = 0; // 배경의 중심 Y
  bool redCircle = false;

  // #2
  double circleX = 0;
  double circleY = 0;
  bool isMovingX = true;
  bool isMovingY = true;
  bool blueCircles = true;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    centerX = 735 / 2; // 화면의 가로 중앙
    centerY = 735 / 2; // 화면의 세로 중앙
  }

// update의 값이 변함에 따라서
// render함수가 호출이 된다.
// 그에 따라서 그림이 이동하는것처럼 보인다.
  @override
  void update(double dt) {
    angle += 1 * dt; //각도를 조금씩 증가 (1도를 더함)
    if (angle >= 2 * pi) {
      angle = 0; // 360도 돌면 다시 0으로
    }

    // X축에 관하여
    if (isMovingX) {
      circleX += 300 * dt; // 원을 오른쪽으로 이동 (100px / sec)
    }
    if (circleX > 735) {
      circleX = 0;
    }

    // Y축에 관하여
    if (isMovingY) {
      circleY += 300 * dt;
    }
    if (circleY > 735) {
      circleY = 0;
    }
  }

  @override
  void render(Canvas canvas) {
    if (blueCircles) {
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
    }

    if (redCircle) {
      // -- 회전하는 원 만들기 --
      final redPaint = Paint()..color = Colors.red.withOpacity(0.8);
      final trailLength = 10; // 꼬리 길이
      final speed = 0.5; // 꼬리의 점차적인 투명도 변화

      for (int i = 0; i < trailLength; i++) {
        // 각 원의 위치를 조금씩 달리하여 그립니다.
        double x =
            centerX + radius * cos(angle - i * speed); // 각도에 따라 조금씨 다르게 설정
        double y = centerY + radius * sin(angle - i * speed);

        // 점점 투명해지는 효과를 위해 각 원의 투명도 조절
        redPaint.color = Colors.red.withOpacity(1 - (i * 0.05)); // 점점 투명해짐

        canvas.save(); // 현재 상태 저장
        canvas.translate(centerX, centerY); // 화면 중앙으로 이동
        canvas.rotate(angle); // 현재 각도만큼 회전
        canvas.translate(-centerX, -centerY); //원래 위치로 되돌리기
        canvas.drawCircle(Offset(x, y), 30, redPaint); // 원을 다시 그리고
        canvas.restore(); // 이전 상태로 복원
      }
    }

    // 사각형
    // paint.color = Colors.red;
    // canvas.drawRect(Rect.fromLTWH(200, 50, 100, 100), paint);

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

  void activeBlueCircle() {
    blueCircles = !blueCircles;
  }

  void activeRedCircle() {
    redCircle = !redCircle;
  }

  void stopMovingX() {
    isMovingX = !isMovingX;
  }

  void stopMovingY() {
    isMovingY = !isMovingY;
  }
}
