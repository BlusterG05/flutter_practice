import 'package:flutter/material.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_drawer.dart';

void main() {
  runApp(const PurchaseOrderApp());
}

class PurchaseOrderApp extends StatelessWidget {
  const PurchaseOrderApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Orden de Compra",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 65, 67, 71)),
        useMaterial3: true,
      ),
      home: const PurchaseOrderForm(),
    );
  }
}

class PurchaseOrderForm extends StatefulWidget {
  const PurchaseOrderForm({super.key});
  @override
  _PurchaseOrderFormState createState() => _PurchaseOrderFormState();
}

class _PurchaseOrderFormState extends State<PurchaseOrderForm> {
  final _formKey = GlobalKey<FormState>();
  final _proveedorController = TextEditingController();
  final _numeroOrdenController = TextEditingController();
  final _montoTotalController = TextEditingController();

  String? _estado = 'Pendiente';
  DateTime? _fechaEmision;
  DateTime? _fechaEntrega;

  Future<void> _selectDate(BuildContext context, DateTime? initialDate,
      ValueChanged<DateTime?> onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != initialDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Orden de Compra"),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Image.network(
                  'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/repair-center-logo-design-template-397703bb56003446ed60f5b1f7ab6174_screen.jpg?ts=1566606262',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _estado,
                decoration: const InputDecoration(
                  labelText: "Estado",
                  prefixIcon: Icon(Icons.assignment_turned_in_outlined),
                ),
                items: <String>['Pendiente', 'En proceso', 'Completada']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _estado = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor seleccione el estado";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _proveedorController,
                decoration: const InputDecoration(
                  labelText: "Proveedor",
                  prefixIcon: Icon(Icons.business_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el nombre del proveedor";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _numeroOrdenController,
                decoration: const InputDecoration(
                  labelText: "Número de Orden",
                  prefixIcon: Icon(Icons.numbers_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el número de orden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context, _fechaEmision, (date) {
                  setState(() {
                    _fechaEmision = date;
                  });
                }),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: _fechaEmision == null
                          ? "Fecha de Emisión"
                          : "Fecha de Emisión: ${_fechaEmision!.toLocal()}".split(' ')[0],
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    validator: (value) {
                      if (_fechaEmision == null) {
                        return "Por favor seleccione la fecha de emisión";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => _selectDate(context, _fechaEntrega, (date) {
                  setState(() {
                    _fechaEntrega = date;
                  });
                }),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: _fechaEntrega == null
                          ? "Fecha de Entrega"
                          : "Fecha de Entrega: ${_fechaEntrega!.toLocal()}".split(' ')[0],
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                    validator: (value) {
                      if (_fechaEntrega == null) {
                        return "Por favor seleccione la fecha de entrega";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _montoTotalController,
                decoration: const InputDecoration(
                  labelText: "Monto Total",
                  prefixIcon: Icon(Icons.attach_money_outlined),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingrese el monto total";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Orden de Compra Registrada")),
                    );
                  }
                },
                child: const Text("Registrar Orden"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}