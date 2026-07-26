// lib/screens/pantalla_productos_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/producto_local.dart';

class PantallaProductosFiltro extends StatelessWidget {
  final bool soloOferta;
  const PantallaProductosFiltro({super.key, this.soloOferta = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloOferta
        ? productosSimulados.where((p) => p.enOferta).toList()
        : productosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Productos${soloOferta ? ' (en oferta)' : ''}'),
        actions: [
          // Toggle filtro de oferta — cambia la URL con query param
          IconButton(
            icon:    Icon(soloOferta ? Icons.local_offer : Icons.local_offer_outlined),
            tooltip: soloOferta ? 'Ver todos' : 'Solo ofertas',
            onPressed: () => soloOferta
                ? context.go('/productos')
                : context.go('/productos?soloOferta=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final p = filtrados[i];
          return ListTile(
            leading: Icon(Icons.inventory_2, color: p.enOferta ? Colors.green : Colors.grey),
            title:   Text(p.nombre),
            subtitle: Text('\$${p.precioReferencial.toStringAsFixed(2)}'),
            onTap: () => context.push(
              '/productos/${p.id}',
              extra: p,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}
