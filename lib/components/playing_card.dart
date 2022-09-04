import 'package:basic_card_game/components/card_back.dart';
import 'package:basic_card_game/constants.dart';
import 'package:basic_card_game/models/card_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PlayingCard extends StatelessWidget {
  final CardModel card;
  final double size;
  final bool visible;
  final Function(CardModel)? onPlayCard;

  const PlayingCard(
      {Key? key,
      required this.card,
      this.size = 1,
      this.visible = true,
      this.onPlayCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPlayCard != null) onPlayCard!(card);
      },
      child: Container(
          width: card_width * size,
          height: card_height * size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: visible
              ? CachedNetworkImage(
                  imageUrl: card.image,
                  width: card_width * size,
                  height: card_height * size,
                )
              : CardBack(
                  size: size,
                )),
    );
  }
}
