import 'package:game_do_programador/src/model/carta.dart';

class Jogador<T extends Carta> {
  const Jogador(
    this.cartaSelecionada,
    this.cartasNaMao,
  );
  
  final T cartaSelecionada;
  final List<T> cartasNaMao;
  
  Map<String, dynamic> toMap() {
    return {
      'cartaSelecionada': cartaSelecionada.toMap(),
      'cartasNaMao': cartasNaMao.map((item) => item.toMap()).toList(),
    };
  }
  
  factory Jogador.fromMap(Map<String, dynamic> map) {
    return Jogador(
      map['cartaSelecionada'] as T,
      map['cartasNaMao'] as List<T>,
    );
  }
}