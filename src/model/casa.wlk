import habitantes.*

object casa {
	var property caramelos = 100
	var property caos = 0
	var property quienAbreLaPuerta = azucena
	
	method image() = "casa.png"
	
	method abrirleA(alguien) {
		// TODO debería hacer lo que corresponda en base a quién visitó la casa 
	}
	
	method cerrarLaPuerta(){
		//TODO debería hacer lo que corresponda para el fin de la visita
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
		self.cerrarLaPuerta()
	}
}