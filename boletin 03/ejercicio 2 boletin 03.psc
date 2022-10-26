Algoritmo sin_titulo
	Escribir " calcule su seguro de automovil "
	Escribir " introduce su edad "
	Leer e
	Escribir " introduzca su genero "
	Leer g
	si (g="v") y (e<30) Entonces
		Escribir "el precio es 450$"
	FinSi
	si (g="v") y (e<50) y (31<e)Entonces
		Escribir "el precio es 400$"
	FinSi
	si (g="v") y (e>50) Entonces
		Escribir "el precio es 350$"
	FinSi
	si (g=m ) y (e<25) Entonces
		Escribir "el precio es 400$"
	FinSi
	si (g=m) y (e>25) Entonces
		Escribir "el precio es 350$"
	FinSi
FinAlgoritmo
//e: edad //g:genero