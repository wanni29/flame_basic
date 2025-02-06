import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Player extends SpriteComponent with TapCallbacks {
  Player({super.position})
      : super(size: Vector2.all(200), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad(); // 자기보다 상위 위젯 부모 위젯이 로드가  되는것을 기다림
    sprite = await Sprite.load('player.png');
  }
}
