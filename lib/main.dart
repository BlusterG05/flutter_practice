import 'package:flutter/material.dart';
import 'login_form.dart';
import 'menu_form.dart';
import 'encuesta_form.dart';
import 'cliente_form.dart';
import 'orden_form.dart';
import 'mapa.dart';
import 'productos.dart';
import 'datos_empresa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Formularios",
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 65, 67, 71)),
          useMaterial3: true,
        ),
        home: LoginForm(),
        routes: {
          'cliente_form': (context) => MyHomePage(),
          'menu_form': (context) => MenuForm(),
          'encuesta_form': (context) => EncuestaForm(),
          'purchase_order_form': (context) => const PurchaseOrderForm(),
          'mapa': (context) => MapaScreen(),
          'datos_empresa_form': (context) => DatosEmpresaForm(),
          'productos_form': (context) => ProductosForm(),

        });
  }
}
