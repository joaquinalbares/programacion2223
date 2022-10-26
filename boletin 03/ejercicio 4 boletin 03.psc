Algoritmo sin_titulo
	Escribir " introduce la nota del primer examen"
	Leer nota1
	Escribir "¿que nota quieres sacar en el trimestre?"
	Leer nota_objetivo
	nota40 = ((nota1*4)/10)
	nota_necesaria60 = (nota_objetivo-nota40)
	nota_necesaria100 = ((nota_necesaria60*10)/6)
	si nota_necesaria100>10 Entonces
		Escribir "no es posible "
	FinSi
	si nota_necesaria100<10 Entonces
		Escribir "la nota que necesito es" nota_necesaria100
	FinSi
	
FinAlgoritmo
