import wollok.game.*
import habitantes.*

object casa {
	const property position = game.center().right(2).up(1)
	var property caramelos = 100
	var property caos = 0
	var property quienAbreLaPuerta = azucena

	method image() {
		//TODO: la casa debería verse distinta según cuánto caos tenga
		return "casa.png"
	}

	method estaEnOrden() {
		//TODO: la casa está en orden mientras el caos no sea demasiado
		return true
	}

	method abrirleA(alguien) {
		// TODO debería hacer lo que corresponda en base a quién visitó la casa
	}

	method cambiarQuienAbreLaPuerta(){
		//TODO le tiene que tocar al siguiente habitante
	}

	method saludo(){
		//TODO debería retornar un string con el saludo a mostrar
		return "..."
	}

	method seTerminoLaDiversion() {
		//TODO se cumple si no hay más caramelos en la casa o si el nivel de caos es muy alto
		return false
	}

	// El saludador va a ser el juego cuando se corra el programa de esa forma.
	// Desde los tests puede ser lo que más nos sirva para validar el funcionamiento del programa :D
	method teVisita(alguien, saludador){
		self.abrirleA(alguien)
		saludador.say(self, self.saludo())
		self.cambiarQuienAbreLaPuerta()
	}
}

/*
 * Un componente visual que no tiene imagen: lo único que muestra en pantalla es su texto.
 */
object contadorDeCaramelos {
	const property position = game.at(0, 9)
	method textColor() = "FFFFFFFF"

	method text() {
		//TODO debería mostrar cuántos caramelos quedan en la casa
		return ""
	}
}
