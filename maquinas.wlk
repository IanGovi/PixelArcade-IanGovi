import jugadores.*


object zombieAttack {
    var bateria = 100
    var cantidadDeUsos = 0
    var puntuacion = 0

    method bateria() = bateria
    method añoDeFabricacion() = 1989
    method esVintage() = self.añoDeFabricacion() < 2000
    method puedeJugar(jugador) = jugador.experiencia() >= 5
    method cargar(horas) {bateria = (40 * horas + bateria).min(100)}
    method usar(jugador) {
        if (jugador.experiencia() < 7) {
            bateria = (bateria - 30).max(0)
            self.puntuacionDe(jugador)
            cantidadDeUsos = cantidadDeUsos + 1
        }
    }
    method puntuacionDe(jugador) {
        if (jugador.experiencia() < 7) {
            puntuacion = puntuacion + 15
        }
        else {
            puntuacion = puntuacion + 25
        }
    }
    method necesitaReparacion() = cantidadDeUsos > 10
}

object vueloEspacial {
    var bateria = 100
    var cantidadDeUsos = 0
    var nave = naveDeCombate

    method bateria() = bateria
    method añoDeFabricacion() = 1995
    method esVintage() = self.añoDeFabricacion() < 2000
    method puedeJugar(jugador) = jugador.reflejos() >= 3
    method cargar(horas) {bateria = (bateria + 50 * horas).min(100)}
    method usar(jugador) {
        if (self.puedeJugar(jugador)) {
            bateria = (bateria - 50).max(0)
            jugador.mejorarReflejos()
            cantidadDeUsos = cantidadDeUsos + 1
        }
    }
    method cambiarNave(unaNave) {nave = unaNave}
    method tieneDificultadDificil() = nave.tieneDificultadDificil()
    method necesitaReparacion() = cantidadDeUsos > 10
}

object naveDeCombate {
    method tieneDificultadDificil() = true
}
object naveDeExploracion {
    method tieneDificultadDificil() = false
}
object naveDeUltraVelocidad {
    method tieneDificultadDificil() = true
}

object salaDeEscape {
    var pistasAcomodadas = true
    var cantidadDeUsos = 0

    method bateria() = 100
    method añoDeFabricacion() = 2018
    method esVintage() = self.añoDeFabricacion() < 2000
    method puedeJugar(jugador) = true
    method cargar(horas) {}
    method usar(unJugador) {
        self.desacomodarPistas()
        unJugador.mejorarInteligencia()
        cantidadDeUsos = cantidadDeUsos + 1
    }
    method pistasAcomodadas() = pistasAcomodadas
    method desacomodarPistas() {
        pistasAcomodadas = false
    }
    method acomodarPistas() {
        pistasAcomodadas = true
    }
    method necesitaReparacion() = cantidadDeUsos > 30
    
}