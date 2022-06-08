import wollok.game.*
import jugador.*
import direcciones.*
import bloque.*

object nivel1 {
	
	method configurar() {		
		// Bloques fijos del nivel
		const posicionesBloquesFijos = [[1,1],[3,1],[5,1],[7,1],[9,1],[11,1],[1,3],[3,3],[5,3],[7,3],[9,3],[11,3],[1,5],[3,5],[5,5],[7,5],[9,5],[11,5],[1,7],[3,7],[5,7],[7,7],[9,7],[11,7]]
		posicionesBloquesFijos.forEach({listaPosicion => new BloqueResistente(position = game.at(listaPosicion.get(0),listaPosicion.get(1)))})
		// Bloques vulnerables
		const posicionesBloquesVulnerables = [[0,0],[1,0],[2,0],[5,0],[6,2],[8,2]]
		posicionesBloquesVulnerables.forEach({listaPosicion => new BloqueVulnerable(position = game.at(listaPosicion.get(0),listaPosicion.get(1)))})
		// JUGADOR
		game.addVisual(jugador)
		// TECLADO
		keyboard.up().onPressDo({jugador.mover(norte)})
		keyboard.right().onPressDo({jugador.mover(este)})
		keyboard.left().onPressDo({jugador.mover(oeste)})
		keyboard.down().onPressDo({jugador.mover(sur)})
		keyboard.d().onPressDo({jugador.plantarBomba()})
		// COLISIONES
		game.onCollideDo(jugador,{elemento => elemento.efectoDeColision()})
	}
}