// lib/router/app_router_paso4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_productos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_comercios.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/producto_local.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/productos',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/productos',
          builder: (_, __) => const PantallaProductos(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id       = state.pathParameters['id']!;
                final producto = state.extra as ProductoLocal?;
                return PantallaDetalle(id: id, producto: producto);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/comercios',
          builder: (_, __) => const PantallaComercios(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
      ],
    ),
  ],
);
