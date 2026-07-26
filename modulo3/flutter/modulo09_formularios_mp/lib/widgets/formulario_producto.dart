// lib/widgets/formulario_producto.dart
import 'package:flutter/material.dart';

class FormularioProducto extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioProducto({super.key, required this.onGuardar});

  @override
  State<FormularioProducto> createState() => _FormularioProductoState();
}

class _FormularioProductoState extends State<FormularioProducto> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlNombre = TextEditingController();
  final _ctrlMarca = TextEditingController();
  final _ctrlPrecio = TextEditingController(text: '0.00');
  final _ctrlCodigoBarras = TextEditingController();

  final _focusMarca = FocusNode();
  final _focusPrecio = FocusNode();
  final _focusCodigo = FocusNode();

  String _unidadMedida = 'unidad';
  bool _destacado = false;

  // Expresión regular para validar precio (dos decimales opcionales)
  static final _regexPrecio = RegExp(r'^\d+(\.\d{1,2})?$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlMarca.dispose();
    _ctrlPrecio.dispose();
    _ctrlCodigoBarras.dispose();
    _focusMarca.dispose();
    _focusPrecio.dispose();
    _focusCodigo.dispose();
    super.dispose();
  }

  void _guardar() {
    // validate() llama al validator de TODOS los TextFormField del Form
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre': _ctrlNombre.text,
      'marca': _ctrlMarca.text,
      'precio': _ctrlPrecio.text,
      'codigoBarras': _ctrlCodigoBarras.text,
      'unidadMedida': _unidadMedida,
      'destacado': _destacado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // ── Nombre del producto ───────────────────────────────────
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre del producto',
              hintText: 'Café Nacional 500g',
              prefixIcon: Icon(Icons.inventory_2),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMarca.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3) return 'Mínimo 3 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Marca ──────────────────────────────────────────────────
          TextFormField(
            controller: _ctrlMarca,
            focusNode: _focusMarca,
            decoration: const InputDecoration(
              labelText: 'Marca',
              hintText: 'Nescafé',
              prefixIcon: Icon(Icons.local_offer_outlined),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPrecio.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'La marca es obligatoria' : null,
          ),
          const SizedBox(height: 12),

          // ── Precio referencial ────────────────────────────────────
          TextFormField(
            controller: _ctrlPrecio,
            focusNode: _focusPrecio,
            decoration: const InputDecoration(
              labelText: 'Precio referencial (\$)',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCodigo.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El precio es obligatorio';
              if (!_regexPrecio.hasMatch(v)) return 'Formato inválido (ej. 2.35)';
              if (double.parse(v) <= 0) return 'El precio debe ser mayor a 0';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Código de barras ───────────────────────────────────────
          TextFormField(
            controller: _ctrlCodigoBarras,
            focusNode: _focusCodigo,
            decoration: const InputDecoration(
              labelText: 'Código de barras',
              prefixIcon: Icon(Icons.qr_code),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El código es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Unidad de medida — DropdownButtonFormField ─────────────
          DropdownButtonFormField<String>(
            value: _unidadMedida,
            decoration: const InputDecoration(
              labelText: 'Unidad de medida',
              prefixIcon: Icon(Icons.straighten),
              border: OutlineInputBorder(),
            ),
            items: [
              'unidad', 'gramos', 'kilogramos', 'litros', 'mililitros', 'paquete',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _unidadMedida = v!),
          ),
          const SizedBox(height: 8),

          // ── Destacado — SwitchListTile ──────────────────────────────
          SwitchListTile(
            title: const Text('Producto destacado'),
            subtitle: const Text('Aparece primero en el catálogo'),
            value: _destacado,
            onChanged: (v) => setState(() => _destacado = v),
            secondary: const Icon(Icons.star_outline),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon: const Icon(Icons.save),
                label: const Text('Guardar producto'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
