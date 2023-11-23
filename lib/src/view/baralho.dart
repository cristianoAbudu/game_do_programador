import 'package:flutter/material.dart';

import '../model/carta_profissional_ti.dart';
import '../settings/settings_view.dart';
import 'carta.dart';

class ProfissionalTIListView extends StatelessWidget {
  ProfissionalTIListView({
    super.key,
  });

  List<ProfissionalTI> items = [];
  List<ProfissionalTI> cartasDoOponente = [];
  bool minhaVez = true;

  var floatingActionButton;
  var gameMessage;
  var floatingActionButtonVisible = false;
  var context;

  static const routeName = '/';

  void colocarBotaoReset() {
    items = [];
    cartasDoOponente = [];
    floatingActionButtonVisible = true;
  }

  void reset() {
    floatingActionButtonVisible = false;
    embaralhar();
    minhaVez = true;

    Navigator.restorablePushNamed(
      context,
      ProfissionalTIListView.routeName,
      arguments: {
        'items': items.map((item) => item.toMap()).toList(),
        'cartasDoOponente': cartasDoOponente.map((item) => item.toMap()).toList(),
        'minhaVez': minhaVez,
      },
    );
  }

  void getProfissionalTIItems(BuildContext context) {
    this.context = context;

    if (ModalRoute.of(context)!.settings.arguments != null) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      items = (arguments['items'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
      cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
      minhaVez = (arguments['minhaVez'] as bool);

      if (items.length == 0) {
        gameMessage = 'Você perdeu o jogo!';
        colocarBotaoReset();
      } else if (items.length == 12) {
        gameMessage = 'Você venceu o jogo!';
        colocarBotaoReset();
      }
    } else {
      embaralhar();
    }
  }

  void embaralhar() {
    items = [];
    cartasDoOponente = [];

    List<ProfissionalTI> baralho = List.from( [
      ProfissionalTI(
        'Desenvolvedor Front-End',
        1231,
        12000,
        23132,
        23,
        0,
      ),
      ProfissionalTI(
        'Desenvolvedor Back-End',
        342,
        13000,
        432,
        432,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Full-Stack',
        12,
        8000,
        231,
        213,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Mobile',
        31,
        5000,
        321,
        1122,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Desktop',
        321,
        10000,
        1645,
        6541,
        0,
      ),
      ProfissionalTI(
        'Desenvolvedor de Jogos',
        6524,
        10000,
        765,
        65234,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor de Sistemas Embarcados',
        342,
        10000,
        7654,
        18765,
        1,
      ),
      ProfissionalTI(
        'Product Owner',
        5643,
        10000,
        57653,
        23,
        1,
      ),
      ProfissionalTI(
        'Scrum Master',
        43634,
        15000,
        6432,
        45132,
        1,
      ),
      ProfissionalTI(
        'Analista de Requisitos',
        5432,
        10000,
        765,
        1623,
        1,
      ),
      ProfissionalTI(
        'Analista de Suporte',
        67543,
        600,
        6245,
        6432,
        0,
      ),
      ProfissionalTI(
        'Analista de Banco de Dados',
        9768,
        9000,
        6357,
        653,
        1,
      ),
    ]);

    baralho.shuffle();
    baralho.forEach((element) {
      if (items.length < 6) {
        items.add(element);
      } else {
        cartasDoOponente.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getProfissionalTIItems(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartas na Mão'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName, arguments: items);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text(gameMessage ?? ""),
          Text(minhaVez ? 'Minha vez' : 'Vez do oponente'),
          Expanded(
            child: ListView.builder(
              restorationId: 'ProfissionalTIListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ListTile(
                  title: Text('${item.nome}'),
                  leading: CircleAvatar(
                    foregroundImage: AssetImage('assets/images/${item.nome}.jpeg'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      ProfissionalTIDetailsView.routeName,
                      arguments: {
                        'items': items.map((item) => item.toMap()).toList(),
                        'cartasDoOponente': cartasDoOponente.map((item) => item.toMap()).toList(),
                        'item': item.toMap(),
                        'minhaVez': minhaVez,
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Visibility(
        visible: floatingActionButtonVisible,
        child: FloatingActionButton(
          onPressed: () {
            reset();
          },
          tooltip: 'Resetar Jogo',
          child: Icon(Icons.restart_alt),
        ),
      ),
    );
  }
}
