import 'package:flutter/material.dart';
import 'menu_form.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String usuario = 'admin';
  final String claveCorrecta = '123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Formulario Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipOval(
                  child: Image.asset(
                    'assets/candado.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person_outlined)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Porfavor ingrese su nombre de usuario";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password", prefixIcon: Icon(Icons.lock)),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Porfavor ingrese su contraseña";
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_usernameController.text == usuario &&
                          _passwordController.text == claveCorrecta) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MenuForm()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Usuario o contraseña incorrecta")),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Formulario no validado")),
                      );
                    }
                  },
                  child: Text('Iniciar sesion'))
            ],
          ),
        ),
      ),
    );
  }
}
