package com.ute.techdash.ui.hardware.red

import android.content.Context
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.slideInVertically
import androidx.compose.animation.slideOutVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.SignalWifiOff
import androidx.compose.material.icons.filled.Wifi
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.produceState
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import kotlinx.coroutines.flow.first

@Composable
fun BannerConectividad(modifier: Modifier = Modifier) {
    val context: Context = LocalContext.current
    val estado by produceState(initialValue = EstadoRed()) {
        ConectividadRepository(context).estadoRedFlow().collect { value = it }
    }

    AnimatedVisibility(
        visible = true,
        enter   = slideInVertically(),
        exit    = slideOutVertically(),
        modifier = modifier
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .background(
                    if (estado.conectado) MaterialTheme.colorScheme.primaryContainer
                    else                  MaterialTheme.colorScheme.errorContainer
                )
                .padding(horizontal = 16.dp, vertical = 6.dp),
            verticalAlignment     = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector        = if (estado.conectado) Icons.Default.Wifi
                else                  Icons.Default.SignalWifiOff,
                contentDescription = null,
                tint               = if (estado.conectado) MaterialTheme.colorScheme.onPrimaryContainer
                else                  MaterialTheme.colorScheme.onErrorContainer,
                modifier           = Modifier.size(16.dp)
            )
            Spacer(Modifier.width(6.dp))
            Text(
                text  = if (estado.conectado) estado.tipoRed else "Sin conexión",
                style = MaterialTheme.typography.labelSmall,
                color = if (estado.conectado) MaterialTheme.colorScheme.onPrimaryContainer
                else                  MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}