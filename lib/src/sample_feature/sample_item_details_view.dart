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

  @override
  Widget build(BuildContext context) {
    
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    item = ProfissionalTI.fromMap(arguments['item'] as Map<String, dynamic>);
    items = (arguments['items'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    cartasDoOponente = (arguments['cartasDoOponente'] as List<dynamic>).map((item) => ProfissionalTI.fromMap(item as Map<String, dynamic>)).toList();
    
    final cartasDoOponenteEmbaralhadas = List.from(cartasDoOponente);
    cartasDoOponenteEmbaralhadas.shuffle();
    cartaDoOponente = cartasDoOponenteEmbaralhadas.first;

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
              print(cartaDoOponente.toMap());
              
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