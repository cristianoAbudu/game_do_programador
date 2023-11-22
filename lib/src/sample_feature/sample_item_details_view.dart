import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_do_programador/src/sample_feature/profissional_ti.dart';
import 'package:game_do_programador/src/sample_feature/sample_item_list_view.dart';

/// Displays detailed information about a ProfissionalTI.
class ProfissionalTIDetailsView extends StatefulWidget {
  const ProfissionalTIDetailsView({Key? key}) : super(key: key);

  static const routeName = '/sample_item';

  @override
  _ProfissionalTIDetailsViewState createState() => _ProfissionalTIDetailsViewState();
}

class _ProfissionalTIDetailsViewState extends State<ProfissionalTIDetailsView> {
  var _selectedPropertyController = '';

  var item ;
  var items ;
  var cartasDoOponente;
  var cartaDoOponente;
  var minhaVez;

  @override
  Widget build(BuildContext context) {
    
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    item = ProfissionalTI.fromMap(arguments['item'] as Map<String, dynamic>);
    items = (arguments['items'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    minhaVez = (arguments['minhaVez'] as bool);


    final cartasDoOponenteEmbaralhadas = List.from(cartasDoOponente);
    cartasDoOponenteEmbaralhadas.shuffle();
    cartaDoOponente = cartasDoOponenteEmbaralhadas.first;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.nome),
      ),
      body: Column(
        children: [
          Text(minhaVez ? 'Minha vez' : 'Vez do oponente'),
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
                        if(minhaVez){
                          _selectedPropertyController = 'dificuldadeDeAprender';
                        }
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
                         if(minhaVez){
                          _selectedPropertyController = 'dificuldadeDeAprender';
                        }
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
                         if(minhaVez){
                          _selectedPropertyController = 'dificuldadeDeArranjarEmprego';
                        }
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
                         if(minhaVez){
                          _selectedPropertyController = 'dificuldadeDeArranjarEmprego';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'salario';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'salario';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'stress';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'stress';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'vagasInternacionais';
                        }
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
                        if(minhaVez){
                          _selectedPropertyController = 'vagasInternacionais';
                        }
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
              print(cartaDoOponente.toMap());

              if(!minhaVez){
                // if minhaVez is false then select a random value from _selectedPropertyController possibilities
                final _selectedPropertyControllerPossibilities = ['dificuldadeDeAprender', 'dificuldadeDeArranjarEmprego', 'salario', 'stress', 'vagasInternacionais'];
                // get a random value from _selectedPropertyControllerPossibilities and assign it to _selectedPropertyController
                _selectedPropertyController = _selectedPropertyControllerPossibilities[Random().nextInt(_selectedPropertyControllerPossibilities.length)];
              }
              
              if(_selectedPropertyController == 'dificuldadeDeAprender'){
                // vence o menor
                if(item.dificuldadeDeAprender < cartaDoOponente.dificuldadeDeAprender){
                  venceu();
                }else{
                  perdeu();
                }
              }else if(_selectedPropertyController == 'dificuldadeDeArranjarEmprego'){
                // vence o menor 
                if(item.dificuldadeDeArranjarEmprego < cartaDoOponente.dificuldadeDeArranjarEmprego){
                  venceu();
                }else{
                  perdeu();
                }
              }else if(_selectedPropertyController == 'salario'){
                // vence o maior
                if(item.salario > cartaDoOponente.salario){
                  venceu(); 
                }else{
                  perdeu();
                }
              }else if(_selectedPropertyController == 'stress'){
                // vence o menor
                if(item.stress < cartaDoOponente.stress){
                  venceu();
                }else{
                  perdeu();
                }
              }else if(_selectedPropertyController == 'vagasInternacionais'){
                // vence o maior
                if(item.vagasInternacionais > cartaDoOponente.vagasInternacionais){
                  venceu();
                }else{
                  perdeu();
                }
              }
              Navigator.restorablePushNamed(
                context,
                ProfissionalTIListView.routeName,
                arguments: {
                  'items': items.map((item) => item.toMap()).toList(),
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
  

  void venceu() {
    print('venceu');
    // remove a carta do oponente
    cartasDoOponente.remove(cartaDoOponente);
    items.add(cartaDoOponente);
   
    print(items.length);
    print(cartasDoOponente.length);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você venceu!'),
      ),
    );
  }

  void perdeu() {
    print('perdeu');
    // remove a carta do oponente
    cartasDoOponente.add(item);
    // remove from items the item that has nome equal to item.nome
    items.removeWhere((element) => element.nome == item.nome);
   
    print(items.length);
    print(cartasDoOponente.length);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Você perdeu!'),
      ),
    );
    
  }
}