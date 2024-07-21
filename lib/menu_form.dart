// lib/pages/menu_form.dart

import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';

class MenuForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Menu de Opciones'),
      drawer: CustomDrawer(),
      body: Center(child: Text("Bienvenido al menú principal")),
    );
  }
}