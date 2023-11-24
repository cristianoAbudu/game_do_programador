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
    eu = Jogador(minhaCarta, minhasCartas);

    var cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => Truco.fromMap(item as Map<String, dynamic>)).toList();
    minhaVez = (arguments['minhaVez'] as bool);

    final cartasDoOponenteEmbaralhadas = List.from(cartasDoOponente);
    cartasDoOponenteEmbaralhadas.shuffle();
    var cartaDoOponente = cartasDoOponenteEmbaralhadas.first;

    oponente = Jogador(cartaDoOponente, cartasDoOponente);

    controller = TrucoController(
      eu: eu,
      oponente: oponente,
      minhaVez: minhaVez,
    ); 

    return Scaffold(
      appBar: AppBar(
        title: Text(minhaCarta.nome),
      ),
      body: Column(
        children: [
          Text(minhaVez ? 'Minha vez' : 'Vez do oponente'),
          Image.asset(
            'assets/images/${minhaCarta.nome}.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      child: Text(minhaCarta.nome),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      child: Text(minhaCarta.naipe),
                    ),
                  ),
                ],
              ),
            ],
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
