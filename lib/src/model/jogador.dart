import 'package:game_do_programador/src/model/carta.dart';

class Jogador<T extends Carta> {
  Jogador(
    this.cartaSelecionada,
    this.cartasNaMao,
    this.pontuacao
  );
  
  final T cartaSelecionada;
  final List<T> cartasNaMao;
 int pontuacao;
  
  Map<String, dynamic> toMap() {
    return {
      'cartaSelecionada': cartaSelecionada.toMap(),
      'cartasNaMao': cartasNaMao.map((item) => item.toMap()).toList(),
      'pontuacao': pontuacao,
    };
  }
  
  factory Jogador.fromMap(Map<String, dynamic> map) {
    return Jogador(
      map['cartaSelecionada'] as T,
      map['cartasNaMao'] as List<T>,
      map['pontuacao'] as int,
    );
  }
}