#!/bin/bash

# Establece el número máximo de intentos
max_intentos=5

# Genera un número aleatorio entre 1 y 100
numero_secreto=$(($RANDOM % 100 + 1))

# Inicializa el contador de intentos
contador=0

# Función para verificar el intento del usuario
verificar_numero() {
    if [[ $1 -eq $numero_secreto ]]; then
        echo "¡Has acertado! El número era $numero_secreto."
        exit 0
    elif [[ $1 -lt $numero_secreto ]]; then
        echo "El número es mayor que $1."
    else
        echo "El número es menor que $1."
    fi
}

# Bucle principal del juego
while [[ $contador -lt $max_intentos ]]; do
    echo -n "Intenta adivinar el número (Intento $((contador+1))/$max_intentos): "
    read intento
    ((contador++))
    verificar_numero $intento
done

echo "se supero el número máximo de intentos. El número secreto era $numero_secreto."
