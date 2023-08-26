Algoritmo Planilla_Alumnos
	//Variables Generales
	Definir profesor, examen Como Cadena
	Definir totalAlumnos, area, opcion, alumno, alumnos Como Entero
	//Variables Area calificaciones
	Definir nota, notaTotal, aprobados, reprobados Como Entero
	//Variables Area Trabajos Pracicos
	Definir tpPresentados, tpAusentes, tpReprobados, notaTp, tpAprobados Como Entero
	// Variables Promedios
	Definir promedio, promedioAsistencia Como Real
	//Bienvenida
	Escribir 'Buenas tardes, por favor identifiquese'
	Leer profesor
	Escribir 'Buenas tardes profesor/a - ', profesor
	totalAlumnos <- 15 //Total de alumnos inscriptos al curso
	Escribir "Cuantos alumnos asistieron hoy al curso?"
	Leer alumnos
	Escribir 'La asistencia ha sido registrada'
	Escribir '-----------------------------------'
	promedioAsistencia <- alumnos*100/totalAlumnos
	//Menu Principal
	Repetir
		Escribir 'Sobre que area desea trabajar?'
		Escribir '1 -> Evaluaciones'
		Escribir '2 -> Trabajos Practicos'
		Escribir '3 -> Asistencias'
		Escribir '4 -> Informe General y Salir'
		
		Leer area
		Según area Hacer
	1:
		Escribir '-----------------------------------'
		Escribir 'Eligio -Evaluaciones-'
		Escribir "Hoy fue dia de examen? (S/N)"
		Leer examen
		si (examen = "s" o examen = "S") Entonces
			
		//Sub-Menu
		Repetir
			Escribir 'Elija alguna de las opciones disponibles:'
			Escribir '1 -> Cargar calificaciones'
			Escribir '2 -> Promedio general'
			Escribir '3 -> Informe de aprobados'
			Escribir '4 -> Volver'
			Leer opcion
			Según opcion Hacer
			//Area Calificaciones
		1:
			Escribir '-----------------------------------'
			Escribir 'Eligio -Cargar calificaciones-'
			Si (reprobados=0 y aprobados=0) Entonces
				Si nota<11 Entonces
					Para alumno<-1 Hasta alumnos Con Paso 1 Hacer
						Escribir 'Ingrese la calificacion del alumno: ', alumno
						Leer nota
						Si nota<11 Entonces
							notaTotal <- notaTotal+nota
							Si nota>5 Entonces
								aprobados <- aprobados+1
							SiNo
								reprobados <- reprobados+1
							FinSi
						SiNo
							alumno <- alumno-1
							Escribir 'La nota maxima es 10'
						FinSi
					FinPara
				FinSi
			SiNo
				Escribir 'Ya ha cargado las calificaciones'
			FinSi
			
			
			Escribir '-----------------------------------'
		2:
			Escribir '-----------------------------------'
			Escribir 'Eligio -Promedio general-'
			Si (reprobados=0 y aprobados=0) Entonces
				Escribir 'Aun no ha ingresado las calificaciones para poder calcular el promedio'
			SiNo
				promedio <- notaTotal/alumnos
				Escribir 'El promedio general del curso de ', alumnos, ' alumnos es de: ', promedio
			FinSi
			Escribir '-----------------------------------'
		3:
			Escribir '-----------------------------------'
			Escribir 'Eligio -Informe de aprobados-'
			Si (reprobados=0 y aprobados=0) Entonces
				Escribir 'Aun no ha ingresado las calificaciones para saber cuantos han aprobado'
				Escribir '-----------------------------------'
			SiNo
				Escribir 'El numero de alumnos aprobados es: ', aprobados
				Escribir 'El numero de alumnos reprobados es: ', reprobados
				Escribir 'De un total de ', alumnos, ' alumnos evaluados'
				Escribir '-----------------------------------'
			FinSi
	FinSegún
Hasta Que opcion=4
SiNo
	Escribir '-----------------------------------'
	Escribir "Hoy no hay calificaciones por cargar"
FinSi

Escribir '-----------------------------------'
2:
	//Area Trabajos Practicos
	Escribir '-----------------------------------'
	Escribir 'Eligio -Trabajos Practicos-'
	//Sub-Menu
	Repetir
		Escribir 'Elija alguna de las opciones disponibles:'
		Escribir '1 -> Cargar trabajos practicos'
		Escribir '2 -> Informe de Trabajos Practicos'
		Escribir '3 -> Volver'
		Leer opcion
		Según opcion Hacer
	1:
		Escribir '-----------------------------------'
		Escribir 'Eligio -Cargar trabajos practicos-'
		Si tpPresentados=0 Entonces
			Escribir 'Cuantos Trabajos Practicos fueron presentados?'
			Leer tpPresentados
			Si tpPresentados<=alumnos Entonces
				tpAusentes <- alumnos-tpPresentados
				tpReprobados <- tpAusentes
				Si alumnos>=tpPresentados Entonces
					Para alumno<-1 Hasta tpPresentados Con Paso 1 Hacer
						Escribir 'Ingrese la calificacion del trabajo practico: ', alumno
						Leer notaTp
						Si notaTp<11 Entonces
							Si notaTp>3 Entonces
								tpAprobados <- tpAprobados+1
							SiNo
								tpReprobados <- tpReprobados+1
							FinSi
						SiNo
							alumno <- alumno-1
							Escribir 'La nota maxima es 10'
						FinSi
					FinPara
				FinSi
			SiNo
				Escribir 'Los trabajos presentados no pueden superar a los alumnos asistentes'
				Escribir 'Alumnos asistentes: ', alumnos
				tpPresentados <- 0
			FinSi
		SiNo
			Escribir 'Ya ha cargado los trabajos practicos'
		FinSi
		Escribir '-----------------------------------'
	2:
		Escribir '-----------------------------------'
		Escribir 'Eligio -Informe de Trabajos Practicos-'
		Si (tpAprobados=0 y tpReprobados=0) Entonces
			Escribir 'Aun no se ha ingresado los trabajos practicos'
			Escribir '-----------------------------------'
		SiNo
			Escribir 'El numero de trabajos aprobados es: ', tpAprobados
			Escribir 'El numero de trabajos reprobados es: ', tpReprobados
			Escribir 'estos incluyen los ', tpAusentes, ' trabajos ausentes'
			Escribir 'De un total de ', alumnos, ' alumnos'
			Escribir '-----------------------------------'
		FinSi
FinSegún
Hasta Que opcion=3
Escribir '-----------------------------------'
3:
	//Area Asistencias
	Escribir 'Eligio -Asistencias-'
	Escribir 'El promedio de asistencia el dia de hoy fue de: ' promedioAsistencia, '%'
	Escribir '-----------------------------------'
4:
	//Area Informe General
	Si (reprobados=0 y aprobados=0 y (examen = "s" o examen = "S")) Entonces // Si se realizaron los examanes y no se cargaron las notas
		Escribir '-----------------------------------'
		Escribir 'Faltan los datos de las evaluaciones'
		Escribir '-----------------------------------'
	SiNo
		Si (tpAprobados=0 y tpReprobados=0) Entonces
			Escribir 'Faltan los datos de los trabajos practicos' // La presentacion de trabajos practicas es diaria
			Escribir '-----------------------------------'
		SiNo
			Escribir '-Informe General-'
			Escribir 'La cantidad de alumnos asistentes fue de: ', alumnos, ' alumnos'
			Escribir 'Con un porcentaje de asistencia del: ', promedioAsistencia, '%'
			si  (examen = "s" o examen = "S") Entonces
				Escribir 'De ', alumnos, ' alumnos que se presentaron al examen, ', aprobados, ' aprobaron y ', reprobados, ' reprobaron'
			SiNo
				Escribir "Hoy no fue dia de evaluacion"
			FinSi
			Escribir "De los " tpPresentados ", " tpAprobados, ' trabajos practicos aprobaron, ', tpReprobados, ' reprobaron, estos incluyen ', tpAusentes, ' que no fueron presentados'
			Escribir '-----------------------------------'
		FinSi
	FinSi
FinSegún
Hasta Que area=4
Escribir 'Que tenga un buen dia'
FinAlgoritmo
