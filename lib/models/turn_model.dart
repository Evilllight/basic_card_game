import 'package:basic_card_game/models/player_model.dart';

class Turn {
  final List<PlayerModel> players;
  int index;
  PlayerModel currentPlayer;
  int drawCount;
  int actionCount;
  int endCount;
  int discardCount;

  Turn({
    required this.players,
    required this.currentPlayer,
    this.index = 0,
    this.drawCount = 0,
    this.actionCount = 0,
    this.discardCount = 0,
    this.endCount = 0,
  });

  void nextTurn() {
    index += 1;
    currentPlayer = index % 2 == 0 ? players[0] : players[1];
    drawCount = 0;
    actionCount = 0;
    otherPlayer.isHuman = false;
    currentPlayer.isHuman = true;
  }

  PlayerModel get otherPlayer {
    return players.firstWhere((p) => p != currentPlayer);
  }
}
