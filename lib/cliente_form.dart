import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Formulario Cliente",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 44, 46, 51),
          leading: Icon(Icons.menu),
          actions: [
            IconButton(onPressed: () => {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert)),
          ],
        ),
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Formulario Validado")),
                      );
                    }
                  },
                  child: Text("Enviar"),
                )
              ],
            ),
          ),
        ));
  }
}
