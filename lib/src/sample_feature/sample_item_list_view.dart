import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of ProfissionalTIs.
class ProfissionalTIListView extends StatelessWidget {
  const ProfissionalTIListView({
    super.key,
    // Onde vamos sortear as cartas
    this.items = const [
      ProfissionalTI(
        'Desenvolvedor Front-End',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Back-End',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Full-Stack',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Mobile',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor Desktop',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor de Jogos',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Desenvolvedor de Sistemas Embarcados',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Product Owner',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Scrum Master',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Analista de Requisitos',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Analista de Suporte',
        0,
        10000,
        1,
        1,
        1,
      ),
      ProfissionalTI(
        'Analista de Banco de Dados',
        0,
        10000,
        1,
        1,
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
              Navigator.restorablePushNamed(context, SettingsView.routeName);
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
              );
            }
          );
        },
      ),
    );
  }
}
