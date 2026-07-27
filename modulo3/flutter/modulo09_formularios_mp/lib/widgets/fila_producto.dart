// lib/widgets/fila_producto.dart
import 'package:flutter/material.dart';
import '../models/producto_local.dart';

class FilaProducto extends StatelessWidget {
  final ProductoLocal producto;
  final VoidCallback onDestacado;
  final VoidCallback onEliminar;

  const FilaProducto({
    super.key,
    required this.producto,
    required this.onDestacado,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      // leading — icono con color según si está destacado
      leading: CircleAvatar(
        backgroundColor: producto.destacado
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.inventory_2,
          color: producto.destacado ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        producto.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${producto.marca} · \$${producto.precioReferencial.toStringAsFixed(2)} / ${producto.unidadMedida}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      // trailing — dos acciones compactas
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              producto.destacado ? Icons.star : Icons.star_border,
              color: producto.destacado ? Colors.amber : cs.outline,
            ),
            onPressed: onDestacado,
            visualDensity: VisualDensity.compact,
            tooltip: producto.destacado ? 'Quitar destacado' : 'Marcar destacado',
          ),
          IconButton(
            icon: Icon(Icons.delete_outline, color: cs.error),
            onPressed: onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip: 'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
