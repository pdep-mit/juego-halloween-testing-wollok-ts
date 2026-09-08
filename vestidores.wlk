import wollok.game.*

/*
 * Los vestidores del barrio. Cuando un chico pasa por encima de uno,
 * el vestidor lo viste... pero cada vestidor tiene lo suyo para ofrecer,
 * y no todos los chicos reaccionan igual.
 */

object vestidorDeSuperheroes {
	const property position = game.at(1, 3)
	method image() = "vestidor-superheroes.png"

	method vestir(alguien) {
		// TODO: ¿qué le tiene que pedir este vestidor al chico que pasó por acá?
	}
}

object vestidorDeAntiheroes {
	const property position = game.at(8, 3)
	method image() = "vestidor-antiheroes.png"

	method vestir(alguien) {
		// TODO: ¿qué le tiene que pedir este vestidor al chico que pasó por acá?
	}
}
