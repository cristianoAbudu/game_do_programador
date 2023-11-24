
import '../model/carta_truco.dart';
import '../model/jogador.dart';

class TrucoController {
  Jogador<Truco> eu;
  Jogador<Truco> oponente;
  bool minhaVez;

  TrucoController({
    required this.eu,
    required this.oponente,
    required this.minhaVez,
  });

  String jogar() {
    print(oponente.cartaSelecionada.toMap());

    
    throw Exception('Poder selecionado inválido');
  }

  String venceu() {
    print('venceu');
    oponente.cartasNaMao.remove(oponente.cartaSelecionada);
    eu.cartasNaMao.add(oponente.cartaSelecionada);

    print(eu.cartasNaMao.length);
    print(oponente.cartasNaMao.length);

    return 'Você venceu!';

  }

  String perdeu() {
    print('perdeu');
    oponente.cartasNaMao.add(eu.cartaSelecionada);
    eu.cartasNaMao.removeWhere((element) => element.nome == eu.cartaSelecionada.nome);

    print(eu.cartasNaMao.length);
    print(oponente.cartasNaMao.length);

    return 'Você perdeu!';
  }
}
