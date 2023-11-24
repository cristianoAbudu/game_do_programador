
import 'dart:math';

import '../model/carta_profissional_ti.dart';
import '../model/jogador.dart';

class ProfissionalTiController {
  Jogador<ProfissionalTI> eu;
  Jogador<ProfissionalTI> oponente;
  bool minhaVez;

  ProfissionalTiController({
    required this.eu,
    required this.oponente,
    required this.minhaVez,
  });

  String jogar(String poderSelecionado) {
    print(oponente.cartaSelecionada.toMap());
    print(poderSelecionado) ;

    if(!minhaVez){
      final _selectedPropertyControllerPossibilities = ['dificuldadeDeAprender', 'dificuldadeDeArranjarEmprego', 'salario', 'stress', 'vagasInternacionais'];
      poderSelecionado = _selectedPropertyControllerPossibilities[Random().nextInt(_selectedPropertyControllerPossibilities.length)];
    }

    if(poderSelecionado == 'dificuldadeDeAprender'){
      if(eu.cartaSelecionada.dificuldadeDeAprender < oponente.cartaSelecionada.dificuldadeDeAprender){
        return venceu();
      }else{
        return perdeu();
      }
    }else if(poderSelecionado == 'dificuldadeDeArranjarEmprego'){
      if(eu.cartaSelecionada.dificuldadeDeArranjarEmprego < oponente.cartaSelecionada.dificuldadeDeArranjarEmprego){
        return venceu();
      }else{
        return perdeu();
      }
    } else if (poderSelecionado == 'salario') {
      if (eu.cartaSelecionada.salario > oponente.cartaSelecionada.salario) {
        return venceu();
      } else {
        return perdeu();
      }
    } else if (poderSelecionado == 'stress') {
      if (eu.cartaSelecionada.stress < oponente.cartaSelecionada.stress) {
        return venceu();
      } else {
        return perdeu();
      }
    } else if (poderSelecionado == 'vagasInternacionais') {
      if (eu.cartaSelecionada.vagasInternacionais > oponente.cartaSelecionada.vagasInternacionais) {
        return venceu();
      } else {
        return perdeu();
      }
    }
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
