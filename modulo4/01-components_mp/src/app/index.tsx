// app/index.tsx
import { useState } from 'react'
import { Modal, Pressable, SafeAreaView, ScrollView, StyleSheet, Text, View } from 'react-native'
import { Card } from './components/Card'
import { FilaInfo } from './components/FilaInfo'
import { TarjetaProducto } from './components/TarjetaProducto'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Props tipadas — TarjetaProducto                     │
// │  2  Paso 2  children y composición — Card reutilizable          │
// │  3  Paso 3  Props opcionales y BadgeEstado                      │
// │  4  Paso 4  ScrollView y SafeAreaView                           │
// │  5  Paso 5  Modal de confirmación                               │
// │  6  Paso 6  Pantalla completa — detalle de producto             │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 6

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3:
      return <Paso3 />
    case 4:
      return <Paso4 />
    case 5:
      return <Paso5 />
    case 6:
      return <Paso6 />
    default:
      return (
        <View style={styles.centrado}>
          <Text>Paso {PASO}: crea el componente primero</Text>
        </View>
      )
  }
}

// ─── Paso 1 — Props tipadas ──────────────────────────────────────────

function Paso1() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.encabezado}>Catálogo de productos</Text>
      <TarjetaProducto
        nombre="Café Nacional 500g"
        marca="Nescafé"
        categoria="Abarrotes"
        precio={2.35}
      />
      <TarjetaProducto
        nombre="Arroz Superior 1kg"
        marca="Gustadina"
        categoria="Abarrotes"
        precio={1.1}
      />
      <TarjetaProducto
        nombre="Aceite Girasol 1L"
        marca="La Favorita"
        categoria="Abarrotes"
        precio={2.89}
      />
      <TarjetaProducto
        nombre="Leche Entera 1L"
        marca="Toni"
        categoria="Lácteos"
        precio={0.95}
      />
    </View>
  )
}

function Paso2() {
  return (
    <View style={styles.fondo}>
      <Text style={styles.titulo}>Detalle de producto</Text>
      <Card titulo="Café Nacional 500g" subtitulo="Nescafé · Abarrotes">
        <FilaInfo etiqueta="Precio ref." valor="$2.35" />
        <FilaInfo etiqueta="Unidad" valor="500 g" />
        <FilaInfo etiqueta="SKU" valor="PEC-0012-500G" />
        <FilaInfo etiqueta="Comercios" valor="12 afiliados" />
        <FilaInfo etiqueta="Mejor precio" valor="Supermaxi · $2.30" />
      </Card>
      <Card titulo="Actividad reciente">
        <FilaInfo etiqueta="Consultas" valor="142 hoy" />
        <FilaInfo etiqueta="Favoritos" valor="38 usuarios" />
        <FilaInfo etiqueta="Última alerta" valor="hace 3 minutos" />
      </Card>
      <Card titulo="Historial de precios" color="#21df70">
        <FilaInfo etiqueta="Mínimo (30d)" valor="$2.10" />
        <FilaInfo etiqueta="Máximo (30d)" valor="$2.45" />
        <FilaInfo etiqueta="Tendencia" valor="Estable" />
      </Card>
    </View>
  )
}

const styles = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 12,
  },
  centrado: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  encabezado: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 4,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
  },
})


// app/index.tsx — agrega al archivo existente

// ─── Paso 3 — Props opcionales ───────────────────────────────────────

type EstadoProducto = 'disponible' | 'agotándose' | 'agotado' | 'sin datos'

interface BadgeEstadoProps {
  estado: EstadoProducto
  tamaño?: number          // opcional — valor por defecto: 12
  mostrarIcono?: boolean   // opcional — valor por defecto: false
}

const COLOR_ESTADO: Record<EstadoProducto, { fondo: string; texto: string }> = {
  disponible:   { fondo: '#e8f5e9', texto: '#2e7d32' },
  'agotándose': { fondo: '#fff8e1', texto: '#f57f17' },
  agotado:      { fondo: '#fce4ec', texto: '#c62828' },
  'sin datos':  { fondo: '#f5f5f5', texto: '#616161' },
}

const ICONO_ESTADO: Record<EstadoProducto, string> = {
  disponible:   '●',
  'agotándose': '◐',
  agotado:      '✕',
  'sin datos':  '○',
}

function BadgeEstado({
  estado,
  tamaño = 12,
  mostrarIcono = false,
}: BadgeEstadoProps) {
  const colores = COLOR_ESTADO[estado]
  return (
    <View style={[estilos3.badge, { backgroundColor: colores.fondo }]}>
      {mostrarIcono && (
        <Text style={[estilos3.icono, { color: colores.texto, fontSize: tamaño }]}>
          {ICONO_ESTADO[estado]}{' '}
        </Text>
      )}
      <Text style={[estilos3.textoBadge, { color: colores.texto, fontSize: tamaño }]}>
        {estado.toUpperCase()}
      </Text>
    </View>
  )
}

interface FilaProductoProps {
  nombre: string
  comercio: string
  estado: EstadoProducto
  precio?: number          // opcional
}

function FilaProducto({ nombre, comercio, estado, precio }: FilaProductoProps) {
  return (
    <View style={estilos3.fila}>
      <View style={estilos3.infoIzq}>
        <Text style={estilos3.nombreProducto}>{nombre}</Text>
        <Text style={estilos3.comercioTexto}>{comercio}</Text>
      </View>
      <View style={estilos3.infoDer}>
        {precio !== undefined && (
          <Text style={estilos3.precio}>${precio.toFixed(2)}</Text>
        )}
        <BadgeEstado estado={estado} mostrarIcono tamaño={11} />
      </View>
    </View>
  )
}

function Paso3() {
  return (
    <View style={estilos3.fondo}>
      <Text style={estilos3.titulo}>Disponibilidad por comercio</Text>
      <FilaProducto nombre="Café Nacional 500g" comercio="Supermaxi"      estado="disponible"   precio={2.35} />
      <FilaProducto nombre="Arroz Superior 1kg" comercio="Tía"            estado="disponible"   precio={1.1}  />
      <FilaProducto nombre="Aceite Girasol 1L"  comercio="Aki"            estado="agotándose"   precio={2.89} />
      <FilaProducto nombre="Leche Entera 1L"    comercio="Mi Comisariato" estado="agotado"                    />
      <FilaProducto nombre="Detergente 2kg"     comercio="Coral"         estado="sin datos"                  />
    </View>
  )
}

const estilos3 = StyleSheet.create({
  fondo: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 20,
    paddingTop: 60,
    gap: 8,
  },
  titulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#1a237e',
    marginBottom: 8,
  },
  fila: {
    backgroundColor: '#ffffff',
    borderRadius: 10,
    paddingHorizontal: 16,
    paddingVertical: 14,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 3,
    shadowOffset: { width: 0, height: 1 },
    elevation: 1,
  },
  infoIzq: { gap: 2 },
  infoDer: { alignItems: 'flex-end', gap: 4 },
  nombreProducto: { fontSize: 14, fontWeight: '600', color: '#1a1a1a' },
  comercioTexto: { fontSize: 12, color: '#90a4ae' },
  precio: { fontSize: 11, color: '#546e7a', fontFamily: 'monospace' },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    borderRadius: 4,
    paddingHorizontal: 6,
    paddingVertical: 2,
  },
  icono: { fontWeight: '700' },
  textoBadge: { fontWeight: '600' },
})



// ─── Paso 4 — ScrollView y SafeAreaView ──────────────────────────────

const PRODUCTOS_DEMO = [
  { id: '1',  nombre: 'Café Nacional 500g',  marca: 'Nescafé',      stock: 48, demanda: 62 },
  { id: '2',  nombre: 'Café Descafeinado',   marca: 'Nescafé',      stock: 51, demanda: 58 },
  { id: '3',  nombre: 'Arroz Superior 1kg',  marca: 'Gustadina',    stock: 12, demanda: 74 },
  { id: '4',  nombre: 'Arroz Integral 1kg',  marca: 'Gustadina',    stock: 8,  demanda: 71 },
  { id: '5',  nombre: 'Aceite Girasol 1L',   marca: 'La Favorita',  stock: 4,  demanda: 18 },
  { id: '6',  nombre: 'Leche Entera 1L',     marca: 'Toni',         stock: 89, demanda: 45 },
  { id: '7',  nombre: 'Leche Deslactosada',  marca: 'Toni',         stock: 92, demanda: 47 },
  { id: '8',  nombre: 'Detergente 2kg',      marca: 'Deja',         stock: 3,  demanda: 12 },
  { id: '9',  nombre: 'Jabón de tocador',    marca: 'Dove',         stock: 6,  demanda: 9  },
  { id: '10', nombre: 'Papel higiénico x4',  marca: 'Scott',        stock: 22, demanda: 38 },
  { id: '11', nombre: 'Atún en lata',        marca: 'Van Camps',    stock: 2,  demanda: 21 },
  { id: '12', nombre: 'Fideos Spaghetti',    marca: 'Oriental',     stock: 15, demanda: 33 },
]

interface BarraNivelProps {
  porcentaje: number
  etiqueta: string
}

function BarraNivel({ porcentaje, etiqueta }: BarraNivelProps) {
  const color = porcentaje > 85 ? '#c62828'
              : porcentaje > 60 ? '#f57f17'
              : '#2e7d32'
  return (
    <View style={estilos4.barraFila}>
      <Text style={estilos4.barraEtiqueta}>{etiqueta}</Text>
      <View style={estilos4.barraFondo}>
        <View style={[estilos4.barraRelleno, { width: `${porcentaje}%` as any, backgroundColor: color }]} />
      </View>
      <Text style={[estilos4.barraPct, { color }]}>{porcentaje}%</Text>
    </View>
  )
}

function TarjetaCatalogo({ nombre, marca, stock, demanda }: typeof PRODUCTOS_DEMO[0]) {
  return (
    <View style={estilos4.nodo}>
      <View style={estilos4.nodoEncabezado}>
        <Text style={estilos4.nodoNombre}>{nombre}</Text>
        <Text style={estilos4.nodoMarca}>{marca}</Text>
      </View>
      <BarraNivel porcentaje={stock} etiqueta="Stock" />
      <BarraNivel porcentaje={demanda} etiqueta="Dem." />
    </View>
  )
}

function Paso4() {
  return (
    <SafeAreaView style={estilos4.safeArea}>
      <View style={estilos4.header}>
        <Text style={estilos4.headerTitulo}>Catálogo PreciosEC</Text>
        <Text style={estilos4.headerSub}>{PRODUCTOS_DEMO.length} productos</Text>
      </View>
      <ScrollView
        style={estilos4.scroll}
        contentContainerStyle={estilos4.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {PRODUCTOS_DEMO.map((prod) => (
          <TarjetaCatalogo key={prod.id} {...prod} />
        ))}
      </ScrollView>
    </SafeAreaView>
  )
}

const estilos4 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#0d1b2a',
  },
  header: {
    paddingHorizontal: 20,
    paddingTop: 16,
    paddingBottom: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#1c2e40',
  },
  headerTitulo: {
    fontSize: 20,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  headerSub: {
    fontSize: 12,
    color: '#78909c',
    marginTop: 2,
  },
  scroll: { flex: 1 },
  scrollContenido: {
    padding: 16,
    gap: 10,
    paddingBottom: 40,
  },
  nodo: {
    backgroundColor: '#132232',
    borderRadius: 10,
    padding: 14,
    gap: 8,
    borderWidth: 1,
    borderColor: '#1c3548',
  },
  nodoEncabezado: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'baseline',
  },
  nodoNombre: {
    fontSize: 14,
    fontWeight: '700',
    color: '#e3f2fd',
  },
  nodoMarca: {
    fontSize: 12,
    color: '#4fc3f7',
  },
  barraFila: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: 8,
  },
  barraEtiqueta: {
    fontSize: 11,
    color: '#78909c',
    width: 28,
  },
  barraFondo: {
    flex: 1,
    height: 4,
    backgroundColor: '#1c3548',
    borderRadius: 2,
    overflow: 'hidden',
  },
  barraRelleno: {
    height: '100%',
    borderRadius: 2,
  },
  barraPct: {
    fontSize: 11,
    fontWeight: '600',
    width: 34,
    textAlign: 'right',
  },
})


// app/index.tsx — agrega al archivo existente

// ─── Paso 5 — Modal de confirmación ──────────────────────────────────

interface ModalConfirmProps {
  visible: boolean
  titulo: string
  mensaje: string
  etiquetaConfirmar?: string
  etiquetaCancelar?: string
  onConfirmar: () => void
  onCancelar: () => void
}

function ModalConfirm({
  visible,
  titulo,
  mensaje,
  etiquetaConfirmar = 'Confirmar',
  etiquetaCancelar = 'Cancelar',
  onConfirmar,
  onCancelar,
}: ModalConfirmProps) {
  return (
    <Modal
      visible={visible}
      transparent
      animationType="fade"
      onRequestClose={onCancelar}
    >
      <Pressable style={estilos5.fondo} onPress={onCancelar}>
        <Pressable style={estilos5.dialogo} onPress={() => {}}>
          <Text style={estilos5.dialogoTitulo}>{titulo}</Text>
          <Text style={estilos5.dialogoMensaje}>{mensaje}</Text>
          <View style={estilos5.botones}>
            <Pressable
              style={[estilos5.boton, estilos5.botonCancelar]}
              onPress={onCancelar}
            >
              <Text style={estilos5.textoCancelar}>{etiquetaCancelar}</Text>
            </Pressable>
            <Pressable
              style={[estilos5.boton, estilos5.botonConfirmar]}
              onPress={onConfirmar}
            >
              <Text style={estilos5.textoConfirmar}>{etiquetaConfirmar}</Text>
            </Pressable>
          </View>
        </Pressable>
      </Pressable>
    </Modal>
  )
}

function Paso5() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionEjecutada, setAccionEjecutada] = useState<string | null>(null)

  return (
    <SafeAreaView style={estilos5.safeArea}>
      <Text style={estilos5.titulo}>Gestión de producto</Text>
      <Text style={estilos5.subtitulo}>Café Nacional 500g · Nescafé</Text>

      <View style={estilos5.acciones}>
        <Pressable
          style={estilos5.botonAccion}
          onPress={() => {
            setAccionEjecutada(null)
            setModalVisible(true)
          }}
        >
          <Text style={estilos5.textoAccion}>Forzar actualización de precio</Text>
        </Pressable>
      </View>

      {accionEjecutada && (
        <View style={estilos5.resultado}>
          <Text style={estilos5.textoResultado}>{accionEjecutada}</Text>
        </View>
      )}

      <ModalConfirm
        visible={modalVisible}
        titulo="Actualizar precio"
        mensaje={`¿Confirmas la actualización de precio de Café Nacional 500g?\nSe consultará el precio actual en los 12 comercios afiliados.`}
        etiquetaConfirmar="Actualizar"
        onConfirmar={() => {
          setModalVisible(false)
          setAccionEjecutada('Actualización enviada a las ' + new Date().toLocaleTimeString())
        }}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

const estilos5 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
    padding: 24,
    paddingTop: 60,
  },
  titulo: {
    fontSize: 22,
    fontWeight: '700',
    color: '#1a237e',
  },
  subtitulo: {
    fontSize: 14,
    color: '#546e7a',
    marginTop: 4,
    marginBottom: 32,
  },
  acciones: { gap: 12 },
  botonAccion: {
    backgroundColor: '#b71c1c',
    borderRadius: 10,
    paddingVertical: 14,
    alignItems: 'center',
  },
  textoAccion: {
    color: '#fff',
    fontWeight: '700',
    fontSize: 15,
  },
  resultado: {
    marginTop: 24,
    backgroundColor: '#e8f5e9',
    borderRadius: 8,
    padding: 14,
  },
  textoResultado: {
    color: '#2e7d32',
    fontSize: 13,
    fontFamily: 'monospace',
  },
  // Modal
  fondo: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  dialogo: {
    backgroundColor: '#ffffff',
    borderRadius: 16,
    padding: 24,
    width: '85%',
    gap: 12,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 12,
    shadowOffset: { width: 0, height: 6 },
    elevation: 10,
  },
  dialogoTitulo: {
    fontSize: 17,
    fontWeight: '700',
    color: '#1a1a1a',
  },
  dialogoMensaje: {
    fontSize: 14,
    color: '#546e7a',
    lineHeight: 20,
  },
  botones: {
    flexDirection: 'row',
    gap: 10,
    marginTop: 4,
  },
  boton: {
    flex: 1,
    borderRadius: 8,
    paddingVertical: 12,
    alignItems: 'center',
  },
  botonCancelar: {
    backgroundColor: '#f5f5f5',
  },
  botonConfirmar: {
    backgroundColor: '#b71c1c',
  },
  textoCancelar: {
    color: '#424242',
    fontWeight: '600',
    fontSize: 14,
  },
  textoConfirmar: {
    color: '#ffffff',
    fontWeight: '700',
    fontSize: 14,
  },
})


// app/index.tsx — agrega al archivo existente

// ─── Paso 6 — Pantalla completa de detalle ───────────────────────────

interface AccionProps {
  etiqueta: string
  color: string
  onPress: () => void
}

function BotonAccion({ etiqueta, color, onPress }: AccionProps) {
  return (
    <Pressable
      style={({ pressed }) => [
        estilos6.botonAccion,
        { backgroundColor: color },
        pressed && { opacity: 0.75 },
      ]}
      onPress={onPress}
    >
      <Text style={estilos6.textoBotonAccion}>{etiqueta}</Text>
    </Pressable>
  )
}

function Paso6() {
  const [modalVisible, setModalVisible] = useState(false)
  const [accionPendiente, setAccionPendiente] = useState<string>('')
  const [log, setLog] = useState<string[]>([])

  function pedirConfirmacion(accion: string) {
    setAccionPendiente(accion)
    setModalVisible(true)
  }

  function ejecutarAccion() {
    const entrada = `[${new Date().toLocaleTimeString()}] ${accionPendiente} ejecutado en Café Nacional 500g`
    setLog((prev) => [entrada, ...prev])
    setModalVisible(false)
  }

  return (
    <SafeAreaView style={estilos6.safeArea}>
      {/* Cabecera fija — fuera del scroll */}
      <View style={estilos6.cabecera}>
        <View>
          <Text style={estilos6.cabNombre}>Café Nacional 500g</Text>
          <Text style={estilos6.cabIp}>Nescafé · Abarrotes</Text>
        </View>
        <BadgeEstado estado="disponible" mostrarIcono tamaño={12} />
      </View>

      {/* Contenido desplazable */}
      <ScrollView
        contentContainerStyle={estilos6.scrollContenido}
        showsVerticalScrollIndicator={false}
      >
        {/* Card de métricas */}
        <Card titulo="Precios en tiempo real" subtitulo="Última actualización: hace 30 s">
          <FilaInfo etiqueta="Mín. hoy" valor="$2.30 · Supermaxi" />
          <FilaInfo etiqueta="Máx. hoy" valor="$2.55 · Mi Comisariato" />
          <FilaInfo etiqueta="Promedio" valor="$2.41" />
          <FilaInfo etiqueta="Ahorro potencial" valor="10.2%" />
          <FilaInfo etiqueta="Comercios comparados" valor="12" />
        </Card>

        {/* Card de configuración */}
        <Card titulo="Ficha del producto">
          <FilaInfo etiqueta="SKU" valor="PEC-0012-500G" />
          <FilaInfo etiqueta="Categoría" valor="Abarrotes · Café" />
          <FilaInfo etiqueta="Unidad" valor="500 g" />
          <FilaInfo etiqueta="Código de barras" valor="7861234567890" />
          <FilaInfo etiqueta="Origen" valor="Ecuador" />
        </Card>

        {/* Card de acciones */}
        <Card titulo="Acciones">
          <View style={estilos6.gridAcciones}>
            <BotonAccion
              etiqueta="Actualizar"
              color="#1565c0"
              onPress={() => pedirConfirmacion('Actualización de precio')}
            />
            <BotonAccion
              etiqueta="Marcar agotado"
              color="#b71c1c"
              onPress={() => pedirConfirmacion('Marcado como agotado')}
            />
            <BotonAccion
              etiqueta="Favorito"
              color="#2e7d32"
              onPress={() => pedirConfirmacion('Agregado a favoritos')}
            />
            <BotonAccion
              etiqueta="Ver historial"
              color="#6a1b9a"
              onPress={() => pedirConfirmacion('Descarga de historial')}
            />
          </View>
        </Card>

        {/* Card de log de actividad */}
        {log.length > 0 && (
          <Card titulo="Actividad reciente">
            {log.map((entrada, i) => (
              <Text key={i} style={estilos6.entradaLog}>{entrada}</Text>
            ))}
          </Card>
        )}
      </ScrollView>

      {/* Modal reutilizado del Paso 5 */}
      <ModalConfirm
        visible={modalVisible}
        titulo={`Confirmar: ${accionPendiente}`}
        mensaje={`¿Ejecutar "${accionPendiente}" en Café Nacional 500g?\nEsta acción afectará la información visible a los usuarios.`}
        etiquetaConfirmar="Ejecutar"
        onConfirmar={ejecutarAccion}
        onCancelar={() => setModalVisible(false)}
      />
    </SafeAreaView>
  )
}

const estilos6 = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: '#f0f4f8',
  },
  cabecera: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: 20,
    paddingVertical: 14,
    backgroundColor: '#ffffff',
    borderBottomWidth: 1,
    borderBottomColor: '#e0e7ef',
  },
  cabNombre: {
    fontSize: 18,
    fontWeight: '700',
    color: '#1a237e',
  },
  cabIp: {
    fontSize: 12,
    color: '#78909c',
    marginTop: 2,
  },
  scrollContenido: {
    padding: 16,
    gap: 14,
    paddingBottom: 40,
  },
  gridAcciones: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 10,
  },
  botonAccion: {
    borderRadius: 8,
    paddingVertical: 10,
    paddingHorizontal: 16,
    minWidth: '45%',
    alignItems: 'center',
  },
  textoBotonAccion: {
    color: '#ffffff',
    fontWeight: '600',
    fontSize: 14,
  },
  entradaLog: {
    fontSize: 11,
    color: '#2e7d32',
    fontFamily: 'monospace',
    lineHeight: 18,
  },
})
