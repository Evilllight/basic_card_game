// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum Suit {
  Hearts,
  Clubs,
  Diamonds,
  Spades,
  Other,
}

class CardModel {
  final String image;
  final Suit suit;
  final String value;
  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });
  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      image: json["image"],
      suit: stringToSuit(json["suit"]),
      value: json["value"],
    );
  }
  static String suitToString(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
        return "HEARTS";
      case Suit.Clubs:
        return "CLUBS";
      case Suit.Diamonds:
        return "DIAMONDS";
      case Suit.Spades:
        return "SPADES";
      case Suit.Other:
        return "OTHER";
    }
  }

  static Suit stringToSuit(String suit) {
    switch (suit.toUpperCase().trim()) {
      case "HEARTS":
        return Suit.Hearts;
      case "CLUBS":
        return Suit.Clubs;
      case "DIAMONDS":
        return Suit.Diamonds;
      case "SPADES":
        return Suit.Spades;
      default:
        return Suit.Other;
    }
  }

  static Color suitToColor(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
      case Suit.Clubs:
        return Colors.red;
      case Suit.Diamonds:
      case Suit.Spades:
      case Suit.Other:
        return Colors.black;
    }
  }
}
