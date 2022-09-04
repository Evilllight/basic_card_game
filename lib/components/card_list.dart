import 'package:basic_card_game/components/playing_card.dart';
import 'package:basic_card_game/constants.dart';
import 'package:basic_card_game/models/card_model.dart';
import 'package:basic_card_game/models/player_model.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final double size;
  final PlayerModel player;
  final Function(CardModel)? onPlayCard;

  const CardList({
    Key? key,
    required this.player,
    this.size = 1,
    this.onPlayCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: card_height * size,
      width: card_width * size * 5.06,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent, width: 2),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: player.cards.length,
        itemBuilder: (context, index) {
          final card = player.cards[index];

          return PlayingCard(
            card: card,
            size: size,
            visible: player.isHuman,
            onPlayCard: onPlayCard,
          );
        },
      ),
    );
  }
}
