Algoritmo sin_titulo
	Escribir "calculo de triangulos"
	Escribir " a .calcula El valor del área de un triángulo, dada la base y la altura"
	Escribir " b .calcula El valor de la base de un triángulo, dada la altura y el área"
	Escribir " c .calcua  El valor de la altura de un triángulo, dada la base y el área"
	
	Escribir "elige tu opcion  (a),(b),(c): "
	Leer op
	si (op="a") Entonces
		Escribir "introduce la base: "
		Leer b1
		Escribir "introduce la altura: "
		Leer h1
		area = (b1*h1/2);
		Escribir " el area del triangulo es  " area , "cm"
	FinSi
	si (op="b") Entonces
		Escribir "introduce la ltura: "
		Leer h2
		Escribir "introduce el area: "
		Leer a2
		base = ((2*a2)/h2);
		Escribir " la base del triangulo es " base , "cm"
	FinSi
	si op = ("c") Entonces
		Escribir "introduce la base: "
		Leer b3
		Escribir "introduce el area: "
		Leer a3
		altura = ((2*a3)/b3);
		Escribir "la altura de un triangulo es"  altura , "cm"
		
		
	FinSi
FinAlgoritmo

	