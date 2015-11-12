#!/bin/bash
#José Luis Pinzón
#12/11/2015
#Script para hacer tablas  a partir de archivos fasta
#
#-------------------------------------------------------------------------------
#Copyright (c) <2015> <cJosé Luis Pinzón>
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.
#-------------------------------------------------------------------------------
# El siguiente es un script para realizar tablas con el ID, el código ISO y el año.
# a partir de  un archivo en formato fasta.

#Seleccionamos sólo las líneas que tengan encabezado fasta, es decir ">", modificar
#el nombre del archivo si se usa otro

grep  -E ">" DNAdata.fas  | tr -d ">"  > encabezado

# Dividimos los campos en columnas usando  como delimitador: _ y guardamos
#cada una en un archivo diferente

cut -f 1 -d _ encabezado >  ID
cut -f 2 -d _ encabezado > iso
cut -f 3 -d _ encabezado > año

# Ahora generamos dos archivos, uno que contenga los ID y los códigos ISO y el otro
#que contenga los ID y loa años, además indicamos que ";" sea el nuevo delimitador de
#campos. En seguida los ordenamos por ISO y año.

paste ID iso  -d ";" > poriso | sort -k 2  poriso > poriso
paste ID año  -d ";" > poraño | sort -k 2  poraño > poraño

#Añadimos luego los encabezados para cada columnas en los archivos finales.

sed -i  "1i\ID;Año" poraño
sed -i  "1i\ID;ISO" poriso
