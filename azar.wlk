/*
 * El objeto que sabe dar números al azar.
 *
 * Está resuelto: no hay nada para hacer acá. Lo interesante es que quien lo necesite
 * no tire los dados por su cuenta, sino que se lo pida a este colaborador, para poder
 * reemplazarlo por otro más predecible cuando estemos escribiendo pruebas.
 */

object azar {
	method numeroEntre(unMinimo, unMaximo) = (unMinimo .. unMaximo).anyOne()
}
