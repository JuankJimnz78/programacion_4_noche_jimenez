import 'package:flutter/material.dart';

/// Muestra y permite alternar la disponibilidad de un producto
/// (equivalente didáctico de ServicioEstado, adaptado a PreciosEC).
class DisponibilidadProducto extends StatefulWidget {
  final String nombre;
  const DisponibilidadProducto({super.key, required this.nombre});

  @override
  State<DisponibilidadProducto> createState() => _DisponibilidadProductoState();
}

class _DisponibilidadProductoState extends State<DisponibilidadProducto> {
  bool _disponible = true;
  int  _reabastecimientos = 0;

  static const int _maxReabastecimientos = 3;

  void _toggle() {
    setState(() {              // notifica a Flutter → rebuild
      _disponible = !_disponible;
      if (_disponible) _reabastecimientos++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reabastecimientos >= _maxReabastecimientos;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // ── Patrón 1: Ícono + color condicional ─────────────────
          Icon(
            _disponible ? Icons.check_circle : Icons.cancel,
            size:  72,
            color: _disponible ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          // ── Patrón 2: Texto condicional ──────────────────────────
          Text(
            _disponible ? 'Disponible en tu zona' : 'Agotado en comercios cercanos',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              color:      _disponible ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),

          // ── Patrón 3: Widget que aparece / desaparece ────────────
          if (!_disponible)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text('Te avisaremos cuando vuelva a estar disponible',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                ],
              ),
            ),

          // ── Patrón 4: Botón con texto, color y estado dinámicos ──
          FilledButton.icon(
            onPressed: enLimite ? null : _toggle,    // null = desactivado
            icon: Icon(_disponible ? Icons.remove_shopping_cart : Icons.inventory),
            label: Text(_disponible ? 'Marcar agotado' : 'Marcar disponible'),
            style: FilledButton.styleFrom(
              backgroundColor: _disponible ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),

          // ── Patrón 5: Opacidad condicional ───────────────────────
          Opacity(
            opacity: enLimite ? 0.4 : 1.0,
            child: Text(
              'Reabastecimientos: $_reabastecimientos / $_maxReabastecimientos',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          // ── Patrón 6: Widget condicional por otro estado ─────────
          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reabastecimientos alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
