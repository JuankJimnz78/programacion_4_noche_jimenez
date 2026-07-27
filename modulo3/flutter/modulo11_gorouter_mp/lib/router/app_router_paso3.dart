// lib/router/app_router_paso3.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_productos_filtro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/producto_local.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/productos',
      builder: (context, state) {
        // Query parameters — /productos?soloOferta=true
        final soloOferta = state.uri.queryParameters['soloOferta'] == 'true';
        return PantallaProductosFiltro(soloOferta: soloOferta);
      },
    ),
    GoRoute(
      path:    '/productos/:id',
      builder: (context, state) {
        final id       = state.pathParameters['id']!;
        final producto = state.extra as ProductoLocal?;
        return PantallaDetalle(id: id, producto: producto);
      },
    ),
  ],
);
