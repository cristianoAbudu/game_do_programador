import 'package:flutter/material.dart';
import 'package:game_do_programador/src/controller/profissional_ti_controller.dart';
import 'package:game_do_programador/src/model/carta_profissional_ti.dart';
import 'package:game_do_programador/src/model/jogador.dart';
import 'package:game_do_programador/src/view/baralho.dart';

/// Displays detailed information about a ProfissionalTI.
class ProfissionalTIDetailsView extends StatefulWidget {
  const ProfissionalTIDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  _ProfissionalTIDetailsViewState createState() => _ProfissionalTIDetailsViewState();
}

class _ProfissionalTIDetailsViewState extends State<ProfissionalTIDetailsView> {
  late ProfissionalTiController controller;
  late String poderSelecionado = '';

  @override
  Widget build(BuildContext context) {
    var minhaVez;

    late Jogador<ProfissionalTI> eu;
    late Jogador<ProfissionalTI> oponente;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var minhaCarta = ProfissionalTI.fromMap(arguments['item'] as Map<String, dynamic>);
    var minhasCartas = (arguments['items'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    eu = Jogador(minhaCarta, minhasCartas);

    var cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    minhaVez = (arguments['minhaVez'] as bool);

    final cartasDoOponenteEmbaralhadas = List.from(cartasDoOponente);
    cartasDoOponenteEmbaralhadas.shuffle();
    var cartaDoOponente = cartasDoOponenteEmbaralhadas.first;

    oponente = Jogador(cartaDoOponente, cartasDoOponente);

    controller = ProfissionalTiController(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'dificuldadeDeAprender';
                          print(poderSelecionado);
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'dificuldadeDeAprender' ? Colors.yellow : null,
                        child: Text('Dificuldade de aprender:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                         if(minhaVez){
                          poderSelecionado = 'dificuldadeDeAprender';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'dificuldadeDeAprender' ? Colors.yellow : null,
                        child: Text(minhaCarta.dificuldadeDeAprender.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                         if(minhaVez){
                          poderSelecionado = 'dificuldadeDeArranjarEmprego';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'dificuldadeDeArranjarEmprego' ? Colors.yellow : null,
                        child: Text('Dificuldade de arranjar emprego:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                         if(minhaVez){
                          poderSelecionado = 'dificuldadeDeArranjarEmprego';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'dificuldadeDeArranjarEmprego' ? Colors.yellow : null,
                        child: Text(minhaCarta.dificuldadeDeArranjarEmprego.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'salario';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'salario' ? Colors.yellow : null,
                        child: Text('Salário:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'salario';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'salario' ? Colors.yellow : null,
                        child: Text(minhaCarta.salario.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'stress';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'stress' ? Colors.yellow : null,
                        child: Text('Stress:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'stress';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'stress' ? Colors.yellow : null,
                        child: Text(minhaCarta.stress.toString()),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'vagasInternacionais';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'vagasInternacionais' ? Colors.yellow : null,
                        child: Text('Vagas internacionais:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if(minhaVez){
                          poderSelecionado = 'vagasInternacionais';
                        }
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: poderSelecionado == 'vagasInternacionais' ? Colors.yellow : null,
                        child: Text(minhaCarta.vagasInternacionais.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              String mensagem = controller.jogar(poderSelecionado);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(mensagem),
                ),
              );

              Navigator.restorablePushNamed(
                context,
                ProfissionalTIListView.routeName,
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
