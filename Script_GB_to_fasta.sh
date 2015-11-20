#!/usr/bin/env bash
#José Luis Pinzón
#jose.pinzon@outlook.com
#
# Escogemos todos los archivos *.gb que haya en el directorio
# copiamos el codigo de acceso precedido del símbolo >
# Luego identificamos las lineas que tienen las secuencias
#Estas  inician por un numero y además no contienen ningun
#caracter no alfanumerico
#Generamos un nuevo archivo fasta con las secuencias unidas
  awk '/ACCESSION/  {print ">" $2};
 /^ *[0-9]/ && !/\,/ && !/\./ {print $2 $3 $4 $5 $6 $7} '  *.gb > juntas



#Reportamos el numero de secuencias que hay en el archivo
echo "este archivo tiene:  $(grep -c ">" juntas) secuencias"

#Reportamos la longitud de cada secuencia

awk 'BEGIN {print "longitud de las secuencias"}
NR>1 {bases=(length($0)-length($1))}
{print $1, bases}'  RS=">" FS="\n" juntas

#Para alinear se usa el siguiente comando.
#(requiere tener muscle instalado)
