import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'profissional_ti.dart';
import 'sample_item_details_view.dart';

/// Displays a list of ProfissionalTIs.
class ProfissionalTIListView extends StatelessWidget {
  const ProfissionalTIListView({
    super.key,
    // Onde vamos sortear as cartas
    this.items = const [
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
    ],
  });

  static const routeName = '/';

  final List<ProfissionalTI> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartas na Mão'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName, arguments: items);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'ProfissionalTIListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            title: Text('${item.nome}'),
            leading: CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/${item.nome}.jpeg'),
            ),
            onTap: () {
              // Navigate to the details page. If the user leaves and returns to
              // the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                ProfissionalTIDetailsView.routeName,
                arguments: item.toMap(),
              );
            }
          );
        },
      ),
    );
  }
}
