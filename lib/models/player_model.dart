import 'package:basic_card_game/models/card_model.dart';

class PlayerModel {
  final String name;
  dynamic isHuman;
  List<CardModel> cards;

  PlayerModel({
    required this.name,
    this.cards = const [],
    this.isHuman = true,
  });

  addCards(List<CardModel> newCards) {
    cards = [...cards, ...newCards];
  }

  removeCards(CardModel card) {
    cards.removeWhere((c) => c.value == card.value && c.suit == card.suit);
  }
}
