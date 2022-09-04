import 'package:basic_card_game/components/card_list.dart';
import 'package:basic_card_game/components/deck_pile.dart';
import 'package:basic_card_game/components/discard_pile.dart';
import 'package:basic_card_game/models/card_model.dart';
import 'package:basic_card_game/providers/rule_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player_model.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RuleProvider>(builder: (context, model, child) {
      if (model.currentDeck != null) {
        return Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await model.drawCards(model.turn.currentPlayer);
                      },
                      child: DeckPile(
                        remaining: model.currentDeck!.remaining,
                      ),
                    ),
                    const SizedBox(width: 8),
                    DiscardPile(cards: model.discards),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (model.turn.currentPlayer == model.players[0])
                          ElevatedButton(
                              onPressed: model.canEndTurn
                                  ? () {
                                      model.endTurn();
                                    }
                                  : null,
                              child: const Text("End Turn")),
                      ],
                    ),
                  ),
                  CardList(
                    player: model.players[0],
                    onPlayCard: (CardModel card) {
                      model.playCard(player: model.players[0], card: card);
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (model.turn.currentPlayer == model.players[1])
                          ElevatedButton(
                            onPressed: model.canEndTurn
                                ? () {
                                    model.endTurn();
                                  }
                                : null,
                            child: const Text("End Turn"),
                          ),
                      ],
                    ),
                  ),
                  CardList(
                    player: model.players[1],
                    onPlayCard: (CardModel card) {
                      model.playCard(player: model.players[1], card: card);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      } else {
        return Center(
          child: TextButton(
            child: const Text("New Game ?"),
            onPressed: () {
              final players = [
                PlayerModel(name: "Player1"),
                PlayerModel(name: "Player2"),
              ];
              model.newGame(players);
            },
          ),
        );
      }
    });
  }
}
