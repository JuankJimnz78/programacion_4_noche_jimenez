// app/Paso1.tsx
import { StyleSheet, Text, View } from 'react-native'

export default function Paso1() {
  return (
    <View style={styles.contenedor}>
      <Text style={styles.titulo}>PreciosEC</Text>
      <Text style={styles.subtitulo}>Café Nacional 500g</Text>
      <Text style={styles.detalle}>Nescafé · $2.35 · Abarrotes</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    gap: 8,
  },
  titulo: {
    fontSize: 22,
    fontWeight: 'bold',
    color: '#1a1a1a',
  },
  subtitulo: {
    fontSize: 16,
    color: '#333',
  },
  detalle: {
    fontSize: 13,
    color: '#777',
  },
})
