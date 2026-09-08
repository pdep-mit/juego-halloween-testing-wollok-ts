import casa.*
import azar.*

/*
 * Los tres habitantes de la casa. Todos entienden `quiereDarleA(unChico)`, aunque
 * no todos necesiten mirar al chico para decidir cuántos caramelos darle.
 *
 * Ojo: solamente Azucena necesita saber si le gusta un disfraz.
 */

object azucena {
	method leGusta(unDisfraz) {
		// TODO: le gustan los disfraces adorables
		return false
	}

	method quiereDarleA(unChico) {
		// TODO: depende de si le gusta el disfraz que trae el chico
		return 0
	}
}

object sandra {
	method quiereDarleA(unChico) {
		// TODO: depende de si la casa está en orden
		return 0
	}
}

object jorge {
	// Jorge no tira los dados por su cuenta: se lo pide a este colaborador.
	// Como es una property, en las pruebas se lo podemos cambiar por uno predecible.
	var property generadorDeAzar = azar

	method quiereDarleA(unChico) {
		// TODO: cuando hay muchos caramelos en la casa le pide un número al azar
		// a su generadorDeAzar, y si no siempre da lo mismo
		return 0
	}
}
