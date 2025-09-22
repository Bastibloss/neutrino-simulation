#!/bin/bash

star=$(date +$s)

#Limpiar residuos
rm -f *.txt

#Bucle de deteccion
for I in $(seq 1 1 1000); do 
	tiempo=$(date +"%Y-%m-%d %H:%M:%S") #Fecha y hora exacta
	neutrinos=$((RANDOM % 11) #Eleccion al azar de cantidad de neutrinos en los eventos(0-10)
	echo "Tiempo: $tiempo - Neutrinos" > "{I}.txt" 
done
#Compactar en results.txt
cat *.txt > results.txt

end=$(date +%s)
rundtime=$((end - start))

#calculamos el promedio (tiempo total/1000 eventos)
Promedio=$(echo "scale=4: $runtime / 1000" | bc)

#guardar informacion de la simulacion
echo "Tiempo total de la ejecucion:$runtime segundos" > performance.txt
echo "Tiempo promedio por evento:$promedio segundos" >> performance.txt
