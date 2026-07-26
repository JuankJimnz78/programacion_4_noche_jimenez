import 'package:flutter/material.dart';

class Indicador extends StatelessWidget {
  final String label;
  final String valor; // String para mayor flexibilidad: '128', '18.4%', '\$2.35'
  final Color color;
  final String? subtitulo; // línea adicional opcional
  final IconData? icono; // ícono opcional antes del valor
  final double opacidad; // controla la transparencia de todo el indicador

  const Indicador({
    super.key,
    required this.label,
    required this.valor,
    required this.color,
    this.subtitulo,
    this.icono,
    this.opacidad = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacidad,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Valor principal — con ícono opcional
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icono != null) ...[
                Icon(icono, size: 22, color: color),
                const SizedBox(width: 4),
              ],
              Text(
                valor,
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          Text(label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          if (subtitulo != null)
            Text(subtitulo!,
                style: TextStyle(fontSize: 10, color: Colors.grey.shade400)),
        ],
      ),
    );
  }
}

// Ejemplo de composición: varios Indicador trabajando juntos.
// Muestra el ícono (punto 3) y dos indicadores con el mismo label
// pero distinto color (punto 4) para comprobar que Flutter los trata
// como widgets totalmente independientes entre sí.
class PanelIndicadores extends StatelessWidget {
  const PanelIndicadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: const [
        Indicador(
          label: 'Productos comparados',
          valor: '4.2K',
          color: Colors.blue,
          icono: Icons.inventory_2,
          subtitulo: 'este mes',
        ),
        Indicador(
          label: 'Ahorro',
          valor: '38%',
          color: Colors.green,
        ),
        Indicador(
          label: 'Ahorro', // mismo label que el de arriba...
          valor: '92%',
          color: Colors.red, // ...pero color distinto: son independientes
        ),
      ],
    );
  }
}
