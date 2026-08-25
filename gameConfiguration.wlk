import chicos.*
import disfraces.*
import habitantes.*
import casa.*

import movimientos.*

import wollok.game.*

object config {
	method alturaMaxima() = 10
	method anchoMaximo() = 10
	
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
		
		// TODO: descomentar luego de declarar los disfraces
		/*
		keyboard.num(1).onPressDo({tito.disfraz(venom)})
		keyboard.num(2).onPressDo({tito.disfraz(superheroe)})
		keyboard.num(3).onPressDo({tito.disfraz(ironman)})
		
		keyboard.num(9).onPressDo({juanita.disfraz(superheroe)})
		keyboard.num(0).onPressDo({juanita.disfraz(harleyQuinn)})
		 */
	}
	
	method configurarColisiones(){
		game.onCollideDo(casa, { alguien => 
			casa.teVisita(alguien, game)
		})
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