
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

    if(eu.cartaSelecionada.score > oponente.cartaSelecionada.score){
      return venceu();
    } else if(eu.cartaSelecionada.score < oponente.cartaSelecionada.score){
      return perdeu();
    } 
    throw Exception('Empate não deveria ocorrer verifique as cartas');
  }

  String venceu() {
    print('venceu');
    tirarCartaDaMao();
    eu.pontuacao++;

    return 'Você venceu!';
  }

  void tirarCartaDaMao() {
    eu.cartasNaMao.removeWhere(
      (element) => element.score == eu.cartaSelecionada.score
    );
    oponente.cartasNaMao.removeWhere(
      (element) => element.score == oponente.cartaSelecionada.score
    );
  }

  String perdeu() {
    print('venceu');
    tirarCartaDaMao();
    oponente.pontuacao++;  

    return 'Você perdeu!';
  }
}
