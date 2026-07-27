// app/index.tsx — agrega la función Paso4
import { StyleSheet, Text, useColorScheme, useWindowDimensions, View } from 'react-native'

function Paso4() {
  const { width, height, scale } = useWindowDimensions()
  const esquema = useColorScheme()   // 'light' | 'dark' | null

  // Paleta dinámica según el tema del sistema
  const colores = {
    fondo:   esquema === 'dark' ? '#0d1b2a' : '#f5f5f5',
    tarjeta: esquema === 'dark' ? '#1a2a3a' : '#ffffff',
    texto:   esquema === 'dark' ? '#e8eaed' : '#1a1a1a',
    detalle: esquema === 'dark' ? '#9aa0a6' : '#666666',
    borde:   esquema === 'dark' ? '#2d3e50' : '#e0e0e0',
  }

  // Layout adaptativo: 1 columna en pantallas angostas, 2 en anchas
  const columnas = width > 500 ? 2 : 1
  const anchoTarjeta = (width - 48 - (columnas - 1) * 12) / columnas

  const productos = [
    { nombre: 'Café Nacional 500g', marca: 'Nescafé',     estado: 'disponible' },
    { nombre: 'Arroz Superior 1kg', marca: 'Gustadina',   estado: 'disponible' },
    { nombre: 'Aceite Girasol 1L',  marca: 'La Favorita', estado: 'agotándose' },
    { nombre: 'Leche Entera 1L',    marca: 'Toni',        estado: 'disponible' },
  ]

  return (
    <View style={[styles.contenedor, { backgroundColor: colores.fondo }]}>
      <Text style={[styles.titulo, { color: colores.texto }]}>
        Catálogo PreciosEC
      </Text>

      {/* Información de pantalla */}
      <View style={[styles.tarjetaInfo, {
        backgroundColor: colores.tarjeta,
        borderColor: colores.borde,
        width: '100%',
      }]}>
        <Text style={[styles.etiqueta, { color: colores.detalle }]}>
          Pantalla: {Math.round(width)} × {Math.round(height)} dp
          {'  '}·{'  '}escala: {scale.toFixed(1)}
          {'  '}·{'  '}tema: {esquema ?? 'sin preferencia'}
        </Text>
      </View>

      {/* Grid de productos con columnas adaptativas */}
      <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 12 }}>
        {productos.map(prod => (
          <View
            key={prod.nombre}
            style={[styles.tarjeta, {
              backgroundColor: colores.tarjeta,
              borderColor: colores.borde,
              width: anchoTarjeta,
            }]}
          >
            <Text style={[styles.nombreProducto, { color: colores.texto }]}>
              {prod.nombre}
            </Text>
            <Text style={[styles.marcaProducto, { color: colores.detalle }]}>
              {prod.marca}
            </Text>
            <Text style={{
              fontSize: 12,
              fontWeight: '600',
              color: prod.estado === 'disponible' ? '#2e7d32' : '#f57f17',
            }}>
              {prod.estado.toUpperCase()}
            </Text>
          </View>
        ))}
      </View>

      {/* Nota sobre useSafeAreaInsets */}
      <View style={[styles.nota, { borderColor: colores.borde }]}>
        <Text style={[styles.notaTexto, { color: colores.detalle }]}>
          💡 useSafeAreaInsets() — disponible desde react-native-safe-area-context
          (ya visto en la página anterior como SafeAreaView). El hook expone los
          valores numéricos {'{'}top, bottom, left, right{'}'} para cuando necesitas
          posicionar elementos manualmente respetando el notch y la barra de inicio.
        </Text>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flexGrow: 1,
    padding: 24,
    paddingTop: 60,
    gap: 16,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  tarjetaInfo: {
    padding: 12,
    borderRadius: 8,
    borderWidth: 1,
  },
  etiqueta: {
    fontSize: 12,
  },
  tarjeta: {
    borderRadius: 10,
    borderWidth: 1,
    padding: 14,
    gap: 4,
  },
  nombreProducto: {
    fontSize: 14,
    fontWeight: '700',
  },
  marcaProducto: {
    fontSize: 12,
  },
  nota: {
    borderRadius: 8,
    borderWidth: 1,
    padding: 14,
  },
  notaTexto: {
    fontSize: 12,
    lineHeight: 18,
  },
})

export default Paso4
