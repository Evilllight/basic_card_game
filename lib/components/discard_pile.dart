import 'package:basic_card_game/components/playing_card.dart';
import 'package:basic_card_game/constants.dart';
import 'package:basic_card_game/models/card_model.dart';
import 'package:flutter/material.dart';

class DiscardPile extends StatelessWidget {
  final List<CardModel> cards;
  final double size;

  const DiscardPile({
    Key? key,
    required this.cards,
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: card_width * size * 5.06,
      height: card_height * size,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2),
      ),
      child: Row(
        children: cards
            .map((card) => PlayingCard(
                  card: card,
                  visible: true,
                ))
            .toList(),
      ),
    );
  }
}
