import 'package:basic_card_game/providers/game_provider.dart';

class RuleProvider extends GameProvider {
  @override
  Future<void> setupBoard() async {
    for (var p in players) {
      await drawCards(p, count: 5, allowAnyTime: true);
    }

    await drawCardToPile();
    turn.actionCount = 0;
    turn.drawCount = 0;
  }

  @override
  bool get canEndTurn {
    return true;
  }

  @override
  void finishGame() {
    notifyListeners();
  }

  @override
  bool get gameIsOver {
    if (turn.discardCount > 10 || turn.endCount > 4) {
      print("finished");
      return true;
    }
    return false;
  }
}
