Algoritmo sin_titulo
	Escribir "¿cuantos teclados vas a comprar?"
	Leer t
	a = (t*20)
	b = (t*26)
	c = (t*30)
	si t>8 Entonces
		Escribir "teclado cuesta 20"
		Escribir "el precio final sera " b ,"$"
	FinSi
	si t>4 y t<8 Entonces
		Escribir "el teclado cuesta 26"
		Escribir " el precio final sera " b , "$"
	FinSi
	si t < 4 Entonces
		Escribir "el teclado costara 30$"
		Escribir "el pecio final sera " c , "$"
	FinSi
FinAlgoritmo
 //t: tecladoFinSi