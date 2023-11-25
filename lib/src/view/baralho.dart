import 'package:flutter/material.dart';

import '../model/carta_truco.dart';
import '../settings/settings_view.dart';
import 'carta.dart';

class TrucoListView extends StatelessWidget {
  TrucoListView({
    super.key,
  });

  List<Truco> items = [];
  List<Truco> cartasDoOponente = [];
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
      TrucoListView.routeName,
      arguments: {
        'items': items.map((item) => item.toMap()).toList(),
        'cartasDoOponente': cartasDoOponente.map((item) => item.toMap()).toList(),
        'minhaVez': minhaVez,
      },
    );
  }

  void getTrucoItems(BuildContext context) {
    this.context = context;

    if (ModalRoute.of(context)!.settings.arguments != null) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      items = (arguments['items'] as List<dynamic>).map((item) => Truco.fromMap(item as Map<String, dynamic>)).toList();
      cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => Truco.fromMap(item as Map<String, dynamic>)).toList();
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

    List<Truco> baralho = List.from( [
      Truco(
        '2',
        'ouro',
        0
      ),
      Truco(
        '2',
        'espada',
        1
      ),
      Truco(
        '2',
        'copas',
        2
      ),
      Truco(
        '2',
        'paus',
        3
      ),
      Truco(
        '3',
        'ouro',
        4
      ),
      Truco(
        '3',
        'espada',
        5
      ),
      Truco(
        '3',
        'copas',
        6
      ),
      Truco(
        '3',
        'paus',
        7
      ),
      Truco(
        '4',
        'ouro',
        8
      ),
      Truco(
        '4',
        'espada',
        9
      ),
      Truco(
        '4',
        'copas',
        10
      ),
      Truco(
        '4',
        'paus',
        11
      ),
      Truco(
        '5',
        'ouro',
        12
      ),
      Truco(
        '5',
        'espada',
        13
      ),
      Truco(
        '5',
        'copas',
        14
      ),
      Truco(
        '5',
        'paus',
        15
      ),
      Truco(
        '6',
        'ouro',
        16
      ),
      Truco(
        '6',
        'espada',
        17
      ),
      Truco(
        '6',
        'copas',
        18
      ),
      Truco(
        '6',
        'paus',
        19
      ),
      Truco(
        '7',
        'ouro',
        20
      ),
      Truco(
        '7',
        'espada',
        21
      ),
      Truco(
        '7',
        'copas',
        22
      ),
      Truco(
        '7',
        'paus',
        23
      ),
      Truco(
        'Q',
        'ouro',
        24
      ),
      Truco(
        'Q',
        'espada',
        25
      ),
      Truco(
        'Q',
        'copas',
        26
      ),
      Truco(
        'Q',
        'paus',
        27
      ),
      Truco(
        'J',
        'ouro',
        28
      ),
      Truco(
        'J',
        'espada',
        29
      ),
      Truco(
        'J',
        'copas',
        30
      ),
      Truco(
        'J',
        'paus',
        31
      ),
      Truco(
        'K',
        'ouro',
        32
      ),
      Truco(
        'K',
        'espada',
        33
      ),
      Truco(
        'K',
        'copas',
        34
      ),
      Truco(
        'K',
        'paus',
        35
      ),
      Truco(
        'A',
        'ouro',
        36
      ),
      Truco(
        'A',
        'espada',
        37
      ),
      Truco(
        'A',
        'copas',
        38
      ),
      Truco(
        'A',
        'paus',
        39
      ),
      Truco(
        '2',
        'ouro',
        40
      ),
      Truco(
        '2',
        'espada',
        41
      ),
      Truco(
        '2',
        'copas',
        42
      ),
      Truco(
        '2',
        'paus',
        43
      ),
      Truco(
        '3',
        'ouro',
        44
      ),
      Truco(
        '3',
        'espada',
        45
      ),
      Truco(
        '3',
        'copas',
        46
      ),
      Truco(
        '3',
        'paus',
        47
      ),
    ]);

    baralho.shuffle();
    baralho.forEach((element) {
      if (items.length < 3) {
        items.add(element);
      } else if(cartasDoOponente.length < 3){
        cartasDoOponente.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getTrucoItems(context);

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
              restorationId: 'TrucoListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return ListTile(
                  title: Text(
                    '${item.nome}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (item.naipe == 'ouro' || item.naipe == 'copas') ? Colors.red : Colors.black,
                    ),
                  ),
                  leading: CircleAvatar(
                    foregroundImage: AssetImage('assets/images/${item.naipe}.jpeg'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      TrucoDetailsView.routeName,
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
