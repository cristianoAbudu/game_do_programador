import 'package:flutter/material.dart';
import 'package:game_do_programador/src/sample_feature/profissional_ti.dart';

/// Displays detailed information about a ProfissionalTI.
class ProfissionalTIDetailsView extends StatelessWidget {
  const ProfissionalTIDetailsView({super.key});

  static const routeName = '/sample_item';

  @override
  Widget build(BuildContext context) {

    final item = ProfissionalTI.fromMap(ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nome),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/${item.nome}.jpeg',
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
                      
                      child: Text('Dificuldade de aprender:'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      
                      child: Text(item.dificuldadeDeAprender.toString()),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      
                      child: Text('Dificuldade de arranjar emprego:'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      
                      child: Text(item.dificuldadeDeArranjarEmprego.toString()),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      
                      child: Text('Salário:'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      
                      child: Text(item.salario.toString()),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      
                      child: Text('Stress:'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      
                      child: Text(item.stress.toString()),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      
                      child: Text('Vagas internacionais:'),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      
                      child: Text(item.vagasInternacionais.toString()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}