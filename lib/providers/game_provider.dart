import 'package:basic_card_game/main.dart';
import 'package:basic_card_game/models/card_model.dart';
import 'package:basic_card_game/models/deck_model.dart';
import 'package:basic_card_game/models/player_model.dart';
import 'package:basic_card_game/models/turn_model.dart';
import 'package:basic_card_game/services/deck_service.dart';
import 'package:flutter/material.dart';

abstract class GameProvider with ChangeNotifier {
  GameProvider() {
    _service = DeckService();
  }
  late DeckService _service;
  late Turn _turn;
  Turn get turn => _turn;

  DeckModel? _currentDeck;
  DeckModel? get currentDeck => _currentDeck;

  List<PlayerModel> _players = [];
  List<PlayerModel> get players => _players;
  List<CardModel> _discards = [];
  List<CardModel> get discards => _discards;

  CardModel? get discardTop => discards.isEmpty ? null : _discards.last;

  Map<String, dynamic> gameState = {};

  newGame(List<PlayerModel> players) async {
    final deck = await _service.newDeck();
    _currentDeck = deck;
    _players = players;
    _discards = [];
    _turn = Turn(
      players: players,
      currentPlayer: players.first,
    );
    setupBoard();

    turn.otherPlayer.isHuman = false;

    notifyListeners();
  }

  Future<void> setupBoard() async {}

  Future<void> drawCardToPile({int count = 5}) async {
    final draw = await _service.drawCards(_currentDeck!, count: count);

    _discards.addAll(draw.cards);

    _currentDeck!.remaining = draw.remaining;
    notifyListeners();
  }

  Future<void> drawCards(PlayerModel player,
      {int count = 1, bool allowAnyTime = false}) async {
    if (currentDeck == null) return;

    final draw = await _service.drawCards(_currentDeck!, count: count);

    player.addCards(draw.cards);

    _currentDeck!.remaining = draw.remaining;

    notifyListeners();
  }

  Future<void> playCard(
      {required PlayerModel player,
      required CardModel card,
      int counts = 1}) async {
    if (!canPlayCard(card)) return;
    player.removeCards(card);
    turn.discardCount += 1;
    final draw = await _service.drawCards(_currentDeck!, count: counts);
    player.addCards(draw.cards);
    _currentDeck!.remaining = draw.remaining;
    _turn.actionCount += 1;
    if (gameIsOver) {
      finishGame();
    }
    notifyListeners();
  }

  void finishGame() {
    showToast("Game Finished");
    notifyListeners();
  }

  bool canPlayCard(CardModel card) {
    if (gameIsOver) return false;
    return _turn.actionCount < 5;
  }

  bool get canEndTurn {
    return turn.drawCount > 0;
  }

  bool get gameIsOver {
    return turn.discardCount > 10 || turn.endCount > 4;
  }

  void endTurn() {
    _turn.endCount += 1;
    _turn.nextTurn();
    notifyListeners();
  }

  void showToast(String message, {int seconds = 3, SnackBarAction? action}) {
    rootScaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: seconds),
        action: action,
      ),
    );
  }
}
