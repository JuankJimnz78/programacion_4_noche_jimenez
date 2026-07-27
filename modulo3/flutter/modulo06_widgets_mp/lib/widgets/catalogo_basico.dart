import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos — PreciosEC')),
      body: ListView(
        padding: const EdgeInsets.all(3),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'Café Nacional 500g: Disponible',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // .w100–.w900  ·  .bold = .w700
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal, // .italic
              decoration: TextDecoration.underline,
              //          .underline  .lineThrough  .overline
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'Descripción del producto • El Café Nacional 500g es un producto de origen ecuatoriano cultivado en la sierra centro, tostado medio, ideal para preparaciones en cafetera de goteo o prensa francesa. Comparado en 12 comercios afiliados a PreciosEC, con historial de precios actualizado cada 24 horas.',
              textAlign:
                  TextAlign.justify, // .left  .right  .justify  .start  .end
              maxLines: 3,
              overflow: TextOverflow.clip, // .clip  .fade  .visible
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'PRECIO EN OFERTA',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última actualización hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── SelectableText — el usuario puede seleccionar y copiar ───────────
          const SelectableText(
            'SKU: PEC-0012-500G',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.check_circle, size: 40, color: Colors.green),
              Icon(Icons.cancel, size: 40, color: Colors.blue),
              Icon(Icons.warning_amber, size: 40, color: Colors.orange),
              Icon(Icons.storefront, size: 80, color: Colors.indigo),
              Icon(Icons.local_offer, size: 80, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 8),

          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ),

          Tooltip(
            message: 'comercio verificado',
            child: Icon(
              Icons.check_circle,
              size: 24,
              color: Colors.green,
              semanticLabel: 'Comercio verificado',
            ),
          ), // leído por lectores de pantalla

          const Divider(height: 32),

          // Agrega a children: [ ... ]
          // ── Cuatro variantes ──────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(
                onPressed: () {},
                child: const Text('OutlinedButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              ElevatedButton(onPressed: null, child: const Text('Desactivado')),
              //        ↑ onPressed: null → desactiva el botón visualmente
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar precio'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.compare_arrows, size: 18),
                label: const Text('Comparar'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                color: Colors.indigo,
                iconSize: 28,
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 4,
              minimumSize: const Size(
                double.infinity,
                0,
              ), // ocupa todo el ancho
            ),
            child: const Text(
              'Comprar al mejor precio',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]
          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.storefront, color: Colors.indigo),
              title: const Text('Supermaxi — La Y'),
              subtitle: const Text('\$2.35 · a 1.2 km'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              onTap: () {}, // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('Tía — Centro'),
              subtitle: const Text('sin stock · 10.0.0.30'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('Abarrotes')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Precio verificado'),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('En oferta'),
                selected: true,
                onSelected: (_) {},
              ),
              ActionChip(
                label: const Text('Ver historial'),
                avatar: const Icon(Icons.show_chart, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

          // ── Circular ──────────────────────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(),
              ), // value: null → animación continua
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: null, // cargando comercios
                  color: Colors.green,
                  strokeWidth: 6,
                ),
              ),
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  backgroundColor: Colors.amber,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round, // puntas redondeadas
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ── Lineal ────────────────────────────────────────────────────────────
          const LinearProgressIndicator(), // indeterminado
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 0.6,
            color: Colors.indigo,
          ), // 60 %
          const SizedBox(height: 8),
          const LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 6, // barra más gruesa (default: 4)
          ),
          const Divider(height: 32),
          // ← pega aquí cada bloque al avanzar
        ],
      ),
    );
  }
}
