import 'package:flutter/material.dart';
import 'package:game_do_programador/src/controller/truco_controller.dart';
import 'package:game_do_programador/src/model/jogador.dart';
import 'package:game_do_programador/src/view/baralho.dart';

import '../model/carta_truco.dart';

/// Displays detailed information about a Truco.
class TrucoDetailsView extends StatefulWidget {
  const TrucoDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  _TrucoDetailsViewState createState() => _TrucoDetailsViewState();
}

class _TrucoDetailsViewState extends State<TrucoDetailsView> {
  late TrucoController controller;

  @override
  Widget build(BuildContext context) {
    var minhaVez;

    late Jogador<Truco> eu;
    late Jogador<Truco> oponente;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var minhaCarta = Truco.fromMap(arguments['item'] as Map<String, dynamic>);
    var minhasCartas = (arguments['items'] as List<dynamic>).map((item) => Truco.fromMap(item as Map<String, dynamic>)).toList();
    var pontuacaoMinha = (arguments['pontuacaoMinha'] as int);
    eu = Jogador(minhaCarta, minhasCartas, pontuacaoMinha);

    var cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => Truco.fromMap(item as Map<String, dynamic>)).toList();
    minhaVez = (arguments['minhaVez'] as bool);

    final cartasDoOponenteEmbaralhadas = List.from(cartasDoOponente);
    cartasDoOponenteEmbaralhadas.shuffle();
    var cartaDoOponente = cartasDoOponenteEmbaralhadas.first;

    var pontuacaoOponente = (arguments['pontuacaoOponente'] as int);
    oponente = Jogador(cartaDoOponente, cartasDoOponente, pontuacaoOponente);

    controller = TrucoController(
      eu: eu,
      oponente: oponente,
      minhaVez: minhaVez,
    ); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Carta selecionada'),
      ),
      body: Column(
        children: [
          Text(minhaVez ? 'Minha vez' : 'Vez do oponente'),
          Text(
            '${minhaCarta.nome}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 200, // Increase the font size to make the text bigger
              color: (minhaCarta.naipe == 'ouro' || minhaCarta.naipe == 'copas') ? Colors.red : Colors.black,
            ),
          ),
          Image.asset(
            'assets/images/${minhaCarta.naipe}.jpeg',
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () {
              String mensagem = controller.jogar();

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mensagem),
                ),
              );

              Navigator.restorablePushNamed(
                context,
                TrucoListView.routeName,
                arguments: {
                  'items': minhasCartas.map((item) => item.toMap()).toList(),
                  'cartasDoOponente': cartasDoOponente.map((item) => item.toMap()).toList(),
                  'minhaVez': !minhaVez,
                  'pontuacaoMinha': eu.pontuacao,
                  'pontuacaoOponente': oponente.pontuacao,
                },
              );

            },
            child: Text('Jogar!'),
          ),
        ],
      ),
    );
  }
}
