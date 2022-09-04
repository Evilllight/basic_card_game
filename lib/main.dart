import 'package:basic_card_game/providers/rule_provider.dart';
import 'package:basic_card_game/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => RuleProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Game',
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const GameScreen(),
    );
  }
}
