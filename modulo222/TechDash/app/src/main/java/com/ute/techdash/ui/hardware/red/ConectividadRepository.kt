package com.ute.techdash.ui.hardware.red

import android.content.Context
import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.callbackFlow

data class EstadoRed(
    val conectado:   Boolean = false,
    val tipoRed:     String  = "Sin conexión"
)

class ConectividadRepository(private val context: Context) {

    private val manager =
        context.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager

    fun estadoRedFlow(): Flow<EstadoRed> = callbackFlow {
        val callback = object : ConnectivityManager.NetworkCallback() {
            override fun onAvailable(network: Network) {
                val caps = manager.getNetworkCapabilities(network)
                val tipo = when {
                    caps?.hasTransport(NetworkCapabilities.TRANSPORT_WIFI)     == true -> "WiFi"
                    caps?.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) == true -> "Datos móviles"
                    caps?.hasTransport(NetworkCapabilities.TRANSPORT_ETHERNET) == true -> "Ethernet"
                    else -> "Otro"
                }
                trySend(EstadoRed(conectado = true, tipoRed = tipo))
            }

            override fun onLost(network: Network) {
                trySend(EstadoRed(conectado = false, tipoRed = "Sin conexión"))
            }
        }

        val request = NetworkRequest.Builder()
            .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
            .build()

        manager.registerNetworkCallback(request, callback)
        awaitClose { manager.unregisterNetworkCallback(callback) }
    }
}