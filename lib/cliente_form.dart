import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';
import 'database_cuarto.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  String? _sexo;
  String? _estadocivil;

  late DatabaseCuarto _databaseCuarto;
  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
  }

  void _addClient() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text
      };
      await _databaseCuarto.insertCliente(client);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Formulario clientes'),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _apellidoController,
                  decoration: InputDecoration(
                      labelText: "Apellidos Completos",
                      prefixIcon: Icon(Icons.person_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Porfavor Ingrese el apellido";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                      labelText: "Nombres Completos",
                      prefixIcon: Icon(Icons.person_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Porfavor Ingrese los nombres";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(
                      labelText: "Correo",
                      prefixIcon: Icon(Icons.mail_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Porfavor Ingrese su correo";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _telefonoController,
                  decoration: InputDecoration(
                      labelText: "Telefono",
                      prefixIcon: Icon(Icons.phone_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Porfavor Ingrese su telefono";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Sexo: "),
                ),
                RadioListTile<String>(
                  title: const Text("Masculino"),
                  value: 'M',
                  groupValue: _sexo,
                  onChanged: (String? value) {
                    setState(() {
                      _sexo = value;
                    });
                  },
                  secondary: Icon(Icons.male),
                ),
                RadioListTile<String>(
                    title: const Text("Femenino"),
                    value: 'F',
                    groupValue: _sexo,
                    onChanged: (String? value) {
                      setState(() {
                        _sexo = value;
                      });
                    },
                    secondary: Icon(Icons.female)),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: "Estado Civil",
                      prefixIcon: Icon(Icons.family_restroom)),
                  value: _estadocivil,
                  onChanged: (String? newValue) {
                    setState(() {
                      _estadocivil = newValue;
                    });
                  },
                  items: <String>["Soltero", "Casado", "Divorciado"]
                      .map<DropdownMenuItem<String>>(
                    (String Value) {
                      return DropdownMenuItem(value: Value, child: Text(Value));
                    },
                  ).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Porfavor Ingrese su estdo civil";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addClient,
                  child: Text("Enviar"),
                )
              ],
            ),
          ),
        ));
  }
}
