package com.ute.compose.material

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Calculate
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.foundation.text.KeyboardOptions

@Composable
fun Paso01SumaScreen() {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(24.dp)
    ) {
        Text(
            "Paso 1 · TextField y OutlinedTextField",
            style = MaterialTheme.typography.titleMedium
        )
        HorizontalDivider()
        SumaNumeros()
    }
}

@Composable
private fun SumaNumeros() {
    var numero1 by remember { mutableStateOf("0") }
    var numero2 by remember { mutableStateOf("0") }
    var resultado by remember { mutableStateOf("0") }

    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(
            "Formulario suma de números",
            style = MaterialTheme.typography.labelLarge,
            color = MaterialTheme.colorScheme.primary
        )
        OutlinedTextField(
            value = numero1,
            onValueChange = { numero1 = it },
            label = { Text("Primer valor") },
            leadingIcon = { Icon(Icons.Default.Calculate, contentDescription = null) },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Next,
                keyboardType = KeyboardType.Number
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )
        OutlinedTextField(
            value = numero2,
            onValueChange = { numero2 = it },
            label = { Text("Segundo valor") },
            leadingIcon = { Icon(Icons.Default.Calculate, contentDescription = null) },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Done,
                keyboardType = KeyboardType.Number
            ),
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )
        Button(
            onClick = {
                val n1 = numero1.toDoubleOrNull() ?: 0.0
                val n2 = numero2.toDoubleOrNull() ?: 0.0
                resultado = (n1 + n2).toString()
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Sumar")
        }
        Text(
            text = "Resultado: $resultado",
            style = MaterialTheme.typography.bodyLarge
        )
    }
}

@Preview(showBackground = true)
@Composable
fun Paso01SumaPreview() {
    MaterialTheme {
        Paso01SumaScreen()
    }
}
