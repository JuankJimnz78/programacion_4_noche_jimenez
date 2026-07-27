import { useEffect, useState } from 'react'
import {
  ActivityIndicator,
  FlatList,
  StyleSheet,
  Text,
  View,
} from 'react-native'


type Producto = {
  id: number
  title: string
  price: number
  category: string
}


export default function Paso3() {
  const [productos, setProductos] = useState<Producto[]>([])
  const [cargando, setCargando] = useState(true)
  const [error, setError] = useState('')


  useEffect(() => {
    async function obtenerProductos() {
      try {
        // Fuente externa de práctica — en la app real esto se reemplaza
        // por GET {AppConfig.baseUrl}/kache/productos/
        const response = await fetch('https://fakestoreapi.com/products')

        if (!response.ok) {
          throw new Error('Error al consultar la API')
        }

        const data: Producto[] = await response.json()
        setProductos(data)
      } catch (err) {
        setError('No se pudieron obtener los productos')
      } finally {
        setCargando(false)
      }
    }

    obtenerProductos()
  }, []) // Solo se ejecuta una vez al montar el componente


  if (cargando) {
    return (
      <View style={styles.center}>
        <ActivityIndicator size="large" color="#1565c0" />
        <Text>Cargando catálogo de PreciosEC...</Text>
      </View>
    )
  }


  if (error) {
    return (
      <View style={styles.center}>
        <Text>{error}</Text>
      </View>
    )
  }


  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Catálogo de productos</Text>

      <FlatList
        data={productos}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => (
          <View style={styles.card}>
            <Text style={styles.nombre}>{item.title}</Text>
            <Text>Categoría: {item.category}</Text>
            <Text style={styles.precio}>${item.price}</Text>
          </View>
        )}
      />
    </View>
  )
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  center: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  titulo: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 15,
    color: '#1a237e',
  },
  card: {
    backgroundColor: '#f0f4f8',
    padding: 15,
    borderRadius: 8,
    marginBottom: 10,
  },
  nombre: {
    fontWeight: 'bold',
    fontSize: 16,
  },
  precio: {
    marginTop: 5,
    color: '#2e7d32',
    fontWeight: 'bold',
  },
})
