// 사과 클래스 (화면에 떨어지는 사과)
import 'package:flame/components.dart';

class Apple extends SpriteComponent {
  Apple({required Vector2 position})
      : super(
          size: Vector2.all(200), // 사과의 킈기
          position: position, // 어디서 생길지
          anchor: Anchor.topLeft, // 첫 시작점은 어디인지
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('apple.png'); // 사과 이미지 불러오기
  }

  @override
  void update(double dt) {
    position.y += 100 * dt; //사과를 아래로 떨어지게 하기
  }
}

// 게임 세계 (사과를 추가할 공간)
class AppleWorld extends World {
  @override
  Future<void> onLoad() async {
    for (var i = 0; i < 5; i++) {
      await add(Apple(position: Vector2(i * 100, 0))); // 사과 추가 (위에서 시작)
    }
  }
}
