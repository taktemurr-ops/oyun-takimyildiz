import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_takimyildiz/oyun_takimyildiz.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(takimyildizConfig.title.length, 33);
    expect(takimyildizConfig.tagline.length, 33);
    for (final s in takimyildizConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(takimyildizConfig.gameId, takimyildizId);
    expect(takimyildizRules.gameId, takimyildizId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(takimyildizRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: takimyildizId, optionalMechanics: takimyildizRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(takimyildizRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
