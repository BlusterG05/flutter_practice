import 'package:flutter/material.dart';
import 'components/custom_drawer.dart';
import 'components/custom_app_bar.dart';
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
      return 'Por favor selecciona una opción';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Encuesta'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'PREGUNTA 1: ¿Cómo calificaría el servicio recibido?',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _pregunta1Controller,
                decoration: InputDecoration(
                  hintText: 'Escribe tu respuesta aquí...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, responde la pregunta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'PREGUNTA 2: ¿Recomendarías nuestro servicio?',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _pregunta2Controller,
                decoration: InputDecoration(
                  hintText: 'Escribe tu respuesta aquí...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, responde la pregunta';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Sexo:',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Masculino'),
                value: 'Masculino',
                groupValue: _sexo,
                onChanged: (String? value) {
                  setState(() {
                    _sexo = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Femenino'),
                value: 'Femenino',
                groupValue: _sexo,
                onChanged: (String? value) {
                  setState(() {
                    _sexo = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Enviar'),
              ),
              if (_isSubmitted)
                Text(
                  'Gracias por completar la encuesta!',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
