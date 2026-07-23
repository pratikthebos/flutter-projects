import 'package:flutter/material.dart';

import '../model/alphabet_model.dart';

class AlphabetViewModel extends ChangeNotifier {
  final List<AlphabetModel> alphabets = const [
    AlphabetModel(letter: "A", word: "Apple"),
    AlphabetModel(letter: "B", word: "Ball"),
    AlphabetModel(letter: "C", word: "Cat"),
    AlphabetModel(letter: "D", word: "Dog"),
    AlphabetModel(letter: "E", word: "Elephant"),
    AlphabetModel(letter: "F", word: "Fish"),
    AlphabetModel(letter: "G", word: "Grapes"),
    AlphabetModel(letter: "H", word: "Hen"),
    AlphabetModel(letter: "I", word: "Ice Cream"),
    AlphabetModel(letter: "J", word: "Jug"),
    AlphabetModel(letter: "K", word: "Kite"),
    AlphabetModel(letter: "L", word: "Lion"),
    AlphabetModel(letter: "M", word: "Mango"),
    AlphabetModel(letter: "N", word: "Nest"),
    AlphabetModel(letter: "O", word: "Orange"),
    AlphabetModel(letter: "P", word: "Parrot"),
    AlphabetModel(letter: "Q", word: "Queen"),
    AlphabetModel(letter: "R", word: "Rabbit"),
    AlphabetModel(letter: "S", word: "Sun"),
    AlphabetModel(letter: "T", word: "Tiger"),
    AlphabetModel(letter: "U", word: "Umbrella"),
    AlphabetModel(letter: "V", word: "Van"),
    AlphabetModel(letter: "W", word: "Watch"),
    AlphabetModel(letter: "X", word: "Xylophone"),
    AlphabetModel(letter: "Y", word: "Yak"),
    AlphabetModel(letter: "Z", word: "Zebra"),
  ];
}