import { StyleSheet, Text, View } from 'react-native'

interface TarjetaProductoProps {
  nombre: string
  marca: string
  categoria: string
  precio: number
}

export function TarjetaProducto({ nombre, marca, categoria, precio }: TarjetaProductoProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreProducto}>{nombre}</Text>
      <Text style={styles.datoPrecio}>${precio.toFixed(2)} · {marca}</Text>
      <Text style={styles.datoCategoria}>{categoria}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  tarjeta: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    padding: 16,
    gap: 4,
    shadowColor: '#000',
    shadowOpacity: 0.06,
    shadowRadius: 4,
    shadowOffset: { width: 0, height: 2 },
    elevation: 2,
  },
  nombreProducto: {
    fontSize: 16,
    fontWeight: '600',
    color: '#1a1a1a',
  },
  datoPrecio: {
    fontSize: 13,
    color: '#1565c0',
    fontFamily: 'monospace',
  },
  datoCategoria: {
    fontSize: 12,
    color: '#757575',
  },
})
