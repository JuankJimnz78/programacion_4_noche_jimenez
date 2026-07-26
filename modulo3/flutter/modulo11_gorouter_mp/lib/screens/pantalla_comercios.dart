// lib/screens/pantalla_comercios.dart
import 'package:flutter/material.dart';

class PantallaComercios extends StatelessWidget {
  const PantallaComercios({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.storefront, size: 56),
        SizedBox(height: 8),
        Text('Comercios afiliados', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}
