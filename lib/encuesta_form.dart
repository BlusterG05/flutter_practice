import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EncuestaForm extends StatefulWidget {
  @override
  State<EncuestaForm> createState() => _EncuestaFormState();
}

class _EncuestaFormState extends State<EncuestaForm> {
  final _formKey = GlobalKey<FormState>();
  final _pregunta1Controller = TextEditingController();
  final _pregunta2Controller = TextEditingController();
  bool _isSubmitted = false;
  String? _sexo;

  String? _validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return "Seleccione una opción";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, 'menu_form');
            },
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
        title: Text(
          'Formulario Clientes'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              // PREGUNTA 1
              TextFormField(
                controller: _pregunta1Controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Pregunta 1".toUpperCase(),
                  prefixIcon: const Icon(Icons.email),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese un pregunta Válida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // PREGUNTA 2
              TextFormField(
                controller: _pregunta2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(242, 34, 34, 34)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Pregunta 2".toUpperCase(),
                  prefixIcon: const Icon(Icons.phone),
                  prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese un pregunta Válida";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isSubmitted = true;
                  });
                  if (_formKey.currentState!.validate() && _sexo != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("ENCUESTA ENVIADA EXITOSAMENTE")),
                    );
                  }
                },
                child: const Text("ENVIAR"),
              ),
              const SizedBox(height: 5),
              // BOTÓN VOLVER
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'menu_form');
                },
                child: const Text("VOLVER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
