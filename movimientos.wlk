import gameConfiguration.*

/*
* Acá se define cómo se mueven los personajes cuando se usan las flechitas.
* Las posiciones son objetos inmutables, pero los personajes controlados pueden
* moverse setteándose la nueva posición cuando sea necesario.
*
* Esta versión anda, pero deja que los chicos se vayan de la pantalla.
* Cada dirección tiene que hacerse cargo de su propio borde.
*/

object movimiento {
	method mover(personajeLibre, direccion){
		const nuevaPosicion = direccion.posicionSiguiente(personajeLibre.position())
		personajeLibre.position(nuevaPosicion)
	}
}

object haciaArriba {
	// TODO: no se puede subir más arriba del suelo, donde está la casa
	method posicionSiguiente(posicion) = posicion.up(1)
}

object haciaAbajo {
	// TODO: no se puede bajar más allá del y = 0
	method posicionSiguiente(posicion) = posicion.down(1)
}

object haciaLaDerecha {
	// TODO: saliendo por el borde derecho se da la vuelta a la manzana
	method posicionSiguiente(posicion) = posicion.right(1)
}

object haciaLaIzquierda {
	// TODO: saliendo por el borde izquierdo se da la vuelta a la manzana
	method posicionSiguiente(posicion) = posicion.left(1)
}
