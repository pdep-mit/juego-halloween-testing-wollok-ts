/*
 * Cada disfraz sabe cuánta ternura y cuánto terror genera, y además sabe su nombre,
 * que es el que se usa para armar el nombre del archivo de imagen del personaje
 * que lo está usando (la convención es "personaje-disfraz.png").
 *
 * El disfraz de superhéroe ya está resuelto, sirve como ejemplo de la forma que
 * tienen que tener los demás.
 */

object superheroe {
	method ternura() = 5
	method terror() = 0
	method nombre() = "superheroe"
}

// TODO: venom tiene 0 de ternura y 8 de terror
object venom {
	method ternura() = 0
	method terror() = 0
	method nombre() = ""
}

// TODO: harleyQuinn tiene 9 de ternura y 2 de terror
object harleyQuinn {
	method ternura() = 0
	method terror() = 0
	method nombre() = ""
}
