// lib/main.dart
import 'package:flutter/material.dart';
import 'package:modulo07_layouts_mp/widgets/sizedbox_custom.dart';
import 'package:modulo07_layouts_mp/widgets/tarjeta_historial_precio.dart';
import 'widgets/fila_sucursal.dart';
import 'widgets/avatar_comercio.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaHistorialPrecio                     │
// │  3  Paso 3  Row + Expanded + Spacer — FilaSucursal               │
// │  4  Paso 4  Stack + Positioned — AvatarComercio                 │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: switch (paso) {
      1 => _paso1(),
      2 => Scaffold(
        body: ListView(
          children: [
            TarjetaHistorialPrecio(
              nivel: 'ALERTA',
              componente: 'Café Nacional 500g — Supermaxi',
              mensaje: 'Precio subió de \$2.10 a \$2.35 (+11.9%)',
              timestamp: DateTime.now(),
              subtitulo: 'Cambio de precio',
              detalle: 'Alerta',
            ),

            TarjetaHistorialPrecio(
              nivel: 'STOCK',
              componente: 'Arroz Superior 1kg — Tía',
              mensaje: 'Disponibilidad: quedan 4 comercios con stock',
              subtitulo: 'stock bajo',
              detalle: 'inventario',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
            ),
            TarjetaHistorialPrecio(
              nivel: 'INFO',
              componente: 'sincronizador-precios',
              mensaje: 'Se actualizaron 812 precios de 12 comercios',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
            ),
            TarjetaHistorialPrecio(
              nivel: 'OFERTA',
              componente: 'Aceite Girasol 1L — Aki',
              mensaje: 'Nuevo precio más bajo: \$2.89 (-15%)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
            ),

            TarjetaHistorialPrecio(
              nivel: 'INFO',
              componente: 'api-comercios',
              subtitulo: 'Petición',
              detalle: 'sincronización',
              mensaje: 'GET /api/precios → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
            ),
          ],
        ),
      ),
      3 => const Scaffold(
        body: Column(
          children: [
            FilaSucursal(
              nombre: 'Supermaxi — La Y',
              detalle: 'Av. América · abierto hasta las 21h00',
              activo: true,
            ),
            Divider(height: 1),
            FilaSucursal(
              nombre: 'Tía — Centro Histórico',
              detalle: 'García Moreno · abierto hasta las 20h00',
              activo: true,
            ),
            Divider(height: 1),
            FilaSucursal(
              nombre: 'Mi Comisariato — Quicentro',
              detalle: 'Sin datos de precios recientes',
              activo: false,
            ),
            Divider(height: 1),
            FilaSucursal(
              nombre: 'Supermaxi — Centro comercial El Recreo, planta baja local 45',
              detalle: 'Av. Maldonado · abierto hasta las 21h00',
              activo: true,
            ),
          ],
        ),
      ),
      4 => const Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarComercio(
                nombre: 'Supermaxi',
                alertas: 2,
                activo: true,
                detalle: 'Sierra',
              ),
              SizedBox(width: 15),

              AvatarComercio(
                nombre: 'Tía',
                alertas: 0,
                activo: true,
                detalle: 'Costa',
              ),
              SizedBox(width: 24),
              AvatarComercio(
                nombre: 'Aki',
                alertas: 0,
                activo: false,
                detalle: 'Norte',
              ),
              SizedBox(width: 24),
              AvatarComercio(
                nombre: 'Coral',
                alertas: 11,
                activo: true,
                detalle: 'Sur',
              ),
              SizedBox(width: 24),
              AvatarComercio(
                nombre: 'Mi Comisariato',
                alertas: 11,
                activo: true,
                detalle: 'Valle',
              ),
            ],
          ),
        ),
      ),

      5 => SizedboxCustom(),
      _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero')),
      ),
    },
  ),
);

// ─── Paso 1 — Container (vive aquí en main.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(0),
        border: Border(left: BorderSide(color: Colors.indigo, width: 4)),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'Producto: Café Nacional 500g',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ),
);
