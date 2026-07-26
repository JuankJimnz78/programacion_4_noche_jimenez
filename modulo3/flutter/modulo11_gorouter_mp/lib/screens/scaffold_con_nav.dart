// lib/screens/scaffold_con_nav.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldConNav extends StatelessWidget {
  final Widget child;
  const ScaffoldConNav({super.key, required this.child});

  // Detecta la ruta activa para resaltar la tab correcta
  int _indiceActivo(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/comercios')) return 1;
    if (loc.startsWith('/ajustes'))   return 2;
    return 0; // /productos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,    // child cambia, el Scaffold NO se reconstruye
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indiceActivo(context),
        onDestinationSelected: (i) {
          switch (i) {
            case 0: context.go('/productos');
            case 1: context.go('/comercios');
            case 2: context.go('/ajustes');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2),
            label: 'Productos',
          ),
          NavigationDestination(
            icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront),
            label: 'Comercios',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
