import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

void main() => runApp(MyApp());




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class VagasDisponivei {
  String v_n;
  String v_id;

  VagasDisponivei({this.v_n, this.v_id});

  @override
  String toString() {
    return '${v_n} ${v_id}'.toLowerCase() + ' ${v_n} ${v_id}'.toUpperCase();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<VagasDisponivei> _vagasDisponiveis;
  String vaga_name;
  VagasDisponivei selectedValue;

  @override
  void initState() {
    super.initState();
    _vagasDisponiveis = [
      VagasDisponivei(v_id: "1", v_n: "A0001"),
      VagasDisponivei(v_id: "2", v_n: "A0002"),
      VagasDisponivei(v_id: "3", v_n: "A0003"),
      VagasDisponivei(v_id: "4", v_n: "A0004"),
      VagasDisponivei(v_id: "5", v_n: "A0005"),
      VagasDisponivei(v_id: "6", v_n: "A0006"),
      VagasDisponivei(v_id: "7", v_n: "A0007"),
      VagasDisponivei(v_id: "8", v_n: "A0008"),
      VagasDisponivei(v_id: "9", v_n: "A0009"),
      VagasDisponivei(v_id: "10", v_n: "A0010"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Searchable Dropdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SearchableDropdown(
              hint: Text('Select'),
              items: _vagasDisponiveis.map((item) {
                return new DropdownMenuItem<VagasDisponivei>(
                    child: Text(item.v_n), value: item);
              }).toList(),
              isExpanded: true,
              value: selectedValue,
              isCaseSensitiveSearch: true,
              searchHint: new Text(
                'Select ',
                style: new TextStyle(fontSize: 20),
              ),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  print(selectedValue);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}