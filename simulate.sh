#!/bin/bash

start=$(date +%s%N)

#Limpiar residuos
rm -f *.txt

# Bucle de deteccion
for I in $(seq 1 1 1000); do
        tiempo=$(date +"%Y-%m-%d %H:%M:%S") # Fecha y hora exacta
        neutrinos=$((RANDOM % 11)) # Eleccion al azar de cantidad de neutrinos en los eventos(0-10)
        echo "Tiempo: $tiempo - Neutrinos: $neutrinos" > "${I}.txt"
done
# reducir en results.txt
cat *.txt > results.txt

end=$(date +%s%N)
runtime=$(awk "BEGIN {print ($end - $start)/1000000000}")

# calculamos el promedio (tiempo total/999 eventos)
promedio=$(awk -v r="$runtime" "BEGIN {print r/999}")

# guardar informacion de la simulacion
echo "Tiempo total de la ejecucion: $runtime segundos" > performance.txt
echo "Tiempo promedio por evento: $promedio segundos" >> performance.txt
