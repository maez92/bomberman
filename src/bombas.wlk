 import wollok.game.*
 import jugador.*
 
 class Bomba {
 	const property position
 	var animacion = "assets/bomba/bomba0.png"
 	method plantar() {
 		game.addVisual(self)
 		game.onTick(800,"animarBomba",{self.animar()})
 		game.schedule(3000,{self.explotar()})
 	}
 	method explotar() {
 		game.removeVisual(self)
 		game.removeTickEvent("animarBomba")
 		new Explosion(position = position).desencadenar()
 		
 	}
 	method image() = animacion
 	method animar() {
 		if (animacion == "assets/bomba/bomba0.png") {
 			animacion = "assets/bomba/bomba1.png"
 		}
 		else if (animacion == "assets/bomba/bomba1.png") {
 			animacion = "assets/bomba/bomba2.png"
 		}
 		else {
 			animacion = "assets/bomba/bomba3.png"
 		}
 	}
 	method efectoDeColision() {
 		jugador.retroceder()
 	}
 }
 
 class Explosion {
 	const property position
 	var animacion = "assets/bomba/flama0.png"
 	method desencadenar() {
 		self.dibujar()
 		new Explosion(position = position.up(1)).dibujar()
 		new Explosion(position = position.right(1)).dibujar()
 		new Explosion(position = position.left(1)).dibujar()
 		new Explosion(position = position.down(1)).dibujar()
 	}
 	method dibujar() {
 		game.addVisual(self)
 		game.onTick(100,"animarFlama",{self.animar()})
 		//game.onCollideDo(self,{elemento => elemento.explotar()})
 		game.schedule(2000,{game.removeVisual(self) game.removeTickEvent("animarFlama")})
 	}
 	method image() = animacion
 	method animar() {
 		if (animacion == "assets/bomba/flama0.png") {
 			animacion = "assets/bomba/flama1.png"
 		}
 		else if (animacion == "assets/bomba/flama1.png") {
 			animacion = "assets/bomba/flama2.png"
 		}
 		else if (animacion == "assets/bomba/flama2.png") {
 			animacion = "assets/bomba/flama3.png"
 		}
 		else if (animacion == "assets/bomba/flama3.png") {
 			animacion = "assets/bomba/flama4.png"
 		}
 		else {
 			animacion = "assets/bomba/flama0.png"
 		}
 	}
 	method efectoDeColision() {
 		jugador.morir()
 	}
 }