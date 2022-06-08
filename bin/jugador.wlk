import wollok.game.*
import direcciones.*
import bombas.*
import juego.*

object jugador {
	var position = game.center()
	var direccion
	var estaVivo = true
	var imagenDinamica = "assets/bman/bman_sur0.png"
	var paso = 0
	
	// movimientos
	method mover(_direccion) {
		if (estaVivo) {
			direccion = _direccion
			self.avanzar(_direccion)
		}
	}
	method avanzar(_direccion) {
		position = direccion.siguiente(position)
		self.animar(_direccion)
	}
	method retroceder() { 
		position = direccion.opuesto().siguiente(position)
	}
	
	method plantarBomba() {
		new Bomba(position = position).plantar()
	}
	method position() = position
	method image() = imagenDinamica //"assets/bman/bman_" + direccion.toString() + "paso" +".png"
	
	method animar(_direccion){
//		if (paso == 0) {
//			paso += 1
//			paso = paso % 3
//		
//		}
		
		if (imagenDinamica == "assets/bman/bman_" + _direccion.toString() + "0.png") {
			imagenDinamica = "assets/bman/bman_" + _direccion.toString() + "1.png"
			game.schedule(200,{imagenDinamica = "assets/bman/bman_" + _direccion.toString() + "2.png"})
		}
		else{
			imagenDinamica = "assets/bman/bman_" + _direccion.toString() + "3.png"
			game.schedule(200,{imagenDinamica = "assets/bman/bman_" + _direccion.toString() + "0.png"})
		}
	}
	method morir() {
		estaVivo = false
	}
	method efectoDeColision() {
		self.morir()
	}
}