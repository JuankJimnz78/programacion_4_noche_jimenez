// app/Paso3.tsx
import { useState } from 'react'
import { Image, Pressable, StyleSheet, Text, View } from 'react-native'

export default function Paso3() {
  const [favorito, setFavorito] = useState(false)

  return (
    <View style={styles.contenedor}>
      <Image
        source={{ uri: 'https://reactnative.dev/img/tiny_logo.png' }}
        style={styles.avatar}
      />
      <Text style={styles.nombre}>Café Nacional 500g</Text>
      <Text style={styles.subtitulo}>Nescafé · $2.35 · 12 comercios</Text>

      <Pressable
        style={[styles.boton, favorito && styles.botonFavorito]}
        onPress={() => setFavorito((prev) => !prev)}
      >
        <Text style={[styles.textoBoton, favorito && styles.textoFavorito]}>
          {favorito ? '★ En favoritos' : 'Agregar a favoritos'}
        </Text>
      </Pressable>
    </View>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    gap: 8,
    backgroundColor: '#f5f5f5',
  },
  avatar: {
    width: 100,
    height: 100,
    borderRadius: 12,
    marginBottom: 8,
  },
  nombre: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  subtitulo: {
    fontSize: 14,
    color: '#666',
    marginBottom: 12,
  },
  boton: {
    backgroundColor: '#1565c0',
    paddingVertical: 10,
    paddingHorizontal: 28,
    borderRadius: 8,
  },
  botonFavorito: {
    backgroundColor: '#e0e0e0',
  },
  textoBoton: {
    color: '#fff',
    fontWeight: '600',
    fontSize: 15,
  },
  textoFavorito: {
    color: '#1a1a1a',
  },
})
