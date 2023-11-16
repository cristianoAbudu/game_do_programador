import 'package:flutter/material.dart';
import 'package:game_do_programador/src/sample_feature/profissional_ti.dart';

/// Displays detailed information about a ProfissionalTI.
class ProfissionalTIDetailsView extends StatefulWidget {
  const ProfissionalTIDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  _ProfissionalTIDetailsViewState createState() => _ProfissionalTIDetailsViewState();
}

class _ProfissionalTIDetailsViewState extends State<ProfissionalTIDetailsView> {
  var _selectedPropertyController = '';

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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'dificuldadeDeAprender';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'dificuldadeDeAprender' ? Colors.yellow : null,
                        child: Text('Dificuldade de aprender:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'dificuldadeDeAprender';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'dificuldadeDeAprender' ? Colors.yellow : null,
                        child: Text(item.dificuldadeDeAprender.toString()),
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
                        _selectedPropertyController = 'dificuldadeDeArranjarEmprego';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'dificuldadeDeArranjarEmprego' ? Colors.yellow : null,
                        child: Text('Dificuldade de arranjar emprego:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'dificuldadeDeArranjarEmprego';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'dificuldadeDeArranjarEmprego' ? Colors.yellow : null,
                        child: Text(item.dificuldadeDeArranjarEmprego.toString()),
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
                        _selectedPropertyController = 'salario';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'salario' ? Colors.yellow : null,
                        child: Text('Salário:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'salario';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'salario' ? Colors.yellow : null,
                        child: Text(item.salario.toString()),
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
                        _selectedPropertyController = 'stress';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'stress' ? Colors.yellow : null,
                        child: Text('Stress:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'stress';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'stress' ? Colors.yellow : null,
                        child: Text(item.stress.toString()),
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
                        _selectedPropertyController = 'vagasInternacionais';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'vagasInternacionais' ? Colors.yellow : null,
                        child: Text('Vagas internacionais:'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPropertyController = 'vagasInternacionais';
                      });
                    },
                    child: TableCell(
                      child: Container(
                        color: _selectedPropertyController == 'vagasInternacionais' ? Colors.yellow : null,
                        child: Text(item.vagasInternacionais.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if(_selectedPropertyController == 'dificuldadeDeAprender'){
                // vence o menor
              }else if(_selectedPropertyController == 'dificuldadeDeArranjarEmprego'){
                // vence o menor 
              }else if(_selectedPropertyController == 'salario'){
                // vence o maior
              }else if(_selectedPropertyController == 'stress'){
                // vence o menor
              }else if(_selectedPropertyController == 'vagasInternacionais'){
                // vence o maior
              }

              print(_selectedPropertyController);
            },
            child: Text('Jogar!'),
          ),
        ],
      ),
    );
  }
}