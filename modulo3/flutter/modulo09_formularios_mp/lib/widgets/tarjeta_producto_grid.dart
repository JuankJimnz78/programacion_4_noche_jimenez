// lib/widgets/tarjeta_producto_grid.dart
import 'package:flutter/material.dart';
import '../models/producto_local.dart';

class TarjetaProductoGrid extends StatelessWidget {
  final ProductoLocal producto;
  final VoidCallback onDestacado;
  final VoidCallback onEliminar;

  const TarjetaProductoGrid({
    super.key,
    required this.producto,
    required this.onDestacado,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + destacado
            Row(children: [
              Icon(
                Icons.inventory_2,
                color: producto.destacado ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onDestacado,
                child: Icon(
                  producto.destacado ? Icons.star : Icons.star_border,
                  color: producto.destacado ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Nombre y precio
            Text(
              producto.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$${producto.precioReferencial.toStringAsFixed(2)}',
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: marca + categoría + eliminar
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.local_offer_outlined, size: 12, color: cs.primary),
              ),
              Expanded(
                child: Text(
                  producto.categoria,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
