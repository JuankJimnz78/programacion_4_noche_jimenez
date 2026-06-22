import 'dart:async';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({super.key});

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {
  Timer? _timer; // nullable — ya no hace falta "late", el valor inicial es null
  int _segundos = 0;
  bool _pausado = false;
  int vueltas = 0;
  final List<int> _tiemposVuelta = []; // guarda el _segundos de cada vuelta

  @override
  void initState() {
    super.initState(); // ← siempre primero
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      if (!mounted) return; // ← protege setState en callbacks
      setState(() => _segundos++);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel(); // pausa: cancela el timer actual
      } else {
        _iniciarTimer(); // reanuda: crea un timer nuevo
      }
    });
  }

  void _registrarVuelta() {
    setState(() {
      vueltas++;
      _tiemposVuelta.add(_segundos);
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // ← SIEMPRE liberar en dispose
    super.dispose(); // ← siempre al final
  }

  String _formatoDe(int segundos) {
    final h = segundos ~/ 3600;
    final m = (segundos % 3600) ~/ 60;
    final s = segundos % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _formato => _formatoDe(_segundos);

  // Color cambia según el tiempo transcurrido
  Color get _colorTiempo {
    if (_segundos > 60) return Colors.red;
    if (_segundos > 30) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _formato,
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: _segundos > 120 ? Colors.deepPurple : _colorTiempo,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () => setState(() {
                _timer?.cancel();
                _segundos = 0;
                _pausado = false;
                _iniciarTimer();
              }),
              child: const Text('Reiniciar'),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: _registrarVuelta,
              child: const Text('Vuelta'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _pausado ? 'Pausado' : 'Corriendo',
          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
        ),
        if (_tiemposVuelta.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            'Vuelta $vueltas: ${_formatoDe(_tiemposVuelta.last)}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ],
    );
  }
}