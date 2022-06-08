import wollok.game.*
import jugador.*

class BloqueResistente {
	var property position
	method image() = "assets/solidBlock.png"
	method initialize() {
		game.addVisual(self)
		//game.onCollideDo(self,{elemento => elemento.retroceder()})
	}
	method efectoDeColision() {
		jugador.retroceder()
	}
}

class BloqueVulnerable {
	var property position
	method image() = "assets/explodableBlock.png"
//	method colision() {
//		self.destruir()
//	}
	method destruir() {
		game.removeVisual(self)
	}
	method initialize() {
		game.addVisual(self)
		//game.onCollideDo(self,{elemento => elemento.retroceder()})
	}
	method efectoDeColision() {
		jugador.retroceder()
	}
}