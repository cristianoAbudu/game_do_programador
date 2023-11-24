import 'package:game_do_programador/src/model/carta.dart';

class Truco extends Carta {
  Truco(
    this.nome, // A 2 3 4 5 6 7 Q J K
    this.naipe, // ouro copas espada paus
    this.score 
    // 4 ouro 0 4 espada 1 4 copas 2 4 paus 
    // 5 ouro 5 espada 5 copas 5 paus
    // 6 ouro 6 espada 6 copas 6 paus
    // 7 ouro 7 espada 7 copas 7 paus
    // Q ouro Q espada Q copas Q paus
    // J ouro J espada J copas J paus
    // K ouro K espada K copas K paus
    // A ouro A espada A copas A paus
    // 2 ouro 2 espada 2 copas 2 paus
    // 3 ouro 3 espada 3 copas 3 paus
  ) : super();
  
  final String nome;
  final String naipe;
  final int score;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'naipe': naipe,
      'score': score,
    };
  }
  
  factory Truco.fromMap(Map<String, dynamic> map) {
    return Truco(
      map['nome'] as String,
      map['naipe'] as String,
      map['score'] as int
    );
  }

}