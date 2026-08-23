import wollok.game.*
import disfraces.*

object rolo {
	var property position = game.origin()
	method image() = "rolo.png"
	
	method cuantosCaramelosPuedeConseguir(unHabitante){
		return 1
	}
	
}

object juanita {
	method position(){
		// TODO: debería estar siempre una celda a la derecha de tito
		return game.at(1, 0)
	}
	method image(){
		// TODO: debería cambiar cuando se cambia el disfraz
		return "juanita-superheroe.png"
	}
	method cuantosCaramelosPuedeConseguir(unHabitante) {
		//TODO: debería depender de quién abre la puerta de la casa
		return 0
	}
}

object tito {
	var property position = game.at(2, 0)
	
	method image(){
		// TODO: debería cambiar cuando se cambia el disfraz
		return "tito-superheroe.png"
	}
	
	method cuantosCaramelosPuedeConseguir(unHabitante) {
		//TODO: debería depender de quién abre la puerta de la casa y si se disfrazó igual que juanita 
		return 0
	}
}