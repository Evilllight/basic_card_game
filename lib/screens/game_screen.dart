import 'package:basic_card_game/components/game_board.dart';
import 'package:basic_card_game/models/player_model.dart';
import 'package:basic_card_game/providers/rule_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final RuleProvider _gameProvider;

  @override
  void initState() {
    _gameProvider = Provider.of<RuleProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Game"),
        actions: [
          TextButton(
              onPressed: () async {
                final players = [
                  PlayerModel(name: "Player1"),
                  PlayerModel(name: "Player2"),
                ];

                await _gameProvider.newGame(players);
              },
              child: const Text(
                "New Game",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: const GameBoard(),
    );
  }
}
