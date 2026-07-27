// app/index.tsx
import { Text, View } from 'react-native'
import { Paso1 } from './components/Paso1'
import { Paso2 } from './components/Paso2'
import Paso3 from './components/Paso3'
import { Paso5 } from './components/Paso5'
import { Paso7 } from './components/Paso7'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  useState — contador de reintentos                    │
// │  2  Paso 2  useEffect — sincronización periódica con setInterval │
// │  3  Paso 3  useRef — foco en TextInput y contador sin re-render  │
// │  4  Paso 4  Hooks nativos de RN — dimensiones, esquema de color  │
// │  5  Paso 5  Custom hook — useSincronizacionPrecios               │
// │  6  Paso 6  Ejemplo combinado — pantalla de estado del servicio  │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 7

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3:
      return <Paso3 />

    case 5:
      return <Paso5 />
    case 7:
      return <Paso7 />
    default:
      return (
        <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}
