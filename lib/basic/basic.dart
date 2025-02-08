// 게임의 세계 (모든 컴포넌트를 추가하는 곳)
import 'dart:ui';

import 'package:flame/components.dart';

class MyWorld extends World {
  @override
  Future<void> onLoad() async {
    await add(MyCreate());
  }
}

class MyCreate extends SpriteComponent {
  // A component that renders the create sprite, with a 16 x 16 size.
  MyCreate() : super(size: Vector2.all(16));

  // 배경화면 변경
  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('player.png');
  }
}
