import chicos.*
import disfraces.*
import habitantes.*
import casa.*
import vestidores.*

import movimientos.*

import wollok.game.*

object config {
	method alturaMaxima() = 10
	method anchoMaximo() = 10
	method alturaDelSuelo() = casa.position().y()

	method configurarJuego(){
		self.configurarVentana()
		self.agregarComponentesVisuales()
		self.configurarAcciones()
		self.configurarColisiones()
		self.configurarValidacionDeFinDeJuego()
	}

	method configurarVentana(){
		game.title("Halloween")
		game.height(self.alturaMaxima())
		game.width(self.anchoMaximo())
		game.boardGround("noche-estrellada.png")
	}

	method agregarComponentesVisuales(){
		game.addVisual(casa)
		game.addVisual(contadorDeCaramelos)
		game.addVisual(vestidorDeSuperheroes)
		game.addVisual(vestidorDeAntiheroes)
		game.addVisual(rolo)
		game.addVisual(tito)
		game.addVisual(juanita)
	}

	method configurarAcciones(){
		var personajeControlado = rolo
		keyboard.t().onPressDo({ personajeControlado = tito})
		keyboard.r().onPressDo({ personajeControlado = rolo})

		keyboard.up().onPressDo({ movimiento.mover(personajeControlado, haciaArriba) })
		keyboard.down().onPressDo({ movimiento.mover(personajeControlado, haciaAbajo) })
		keyboard.left().onPressDo({ movimiento.mover(personajeControlado, haciaLaIzquierda) })
		keyboard.right().onPressDo({ movimiento.mover(personajeControlado, haciaLaDerecha) })
	}

	method configurarColisiones(){
		game.onCollideDo(casa, { alguien =>
			casa.teVisita(alguien, game)
		})

		// TODO: Agregar colisiones para los vestidores
	}

	method configurarValidacionDeFinDeJuego(){
		game.onTick(2 * 1000, "fin?", {
			if(casa.seTerminoLaDiversion())
				self.mostrarFinDelJuego()
		})
	}

	method mostrarFinDelJuego() {
		// TODO: Hacer que aparezca un cartel con texto
		// BONUS: Habilitar opcion para reiniciar el juego
	}
}
