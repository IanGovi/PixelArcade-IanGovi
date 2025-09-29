import maquinas.*
import arcade.*


object milo {
    var inteligencia = 2
    var reflejos = 3
    method experiencia() = (inteligencia + reflejos) / 2
    method estaContento() = true
    method inteligencia() = inteligencia
    method reflejos() = reflejos
    method mejorarInteligencia() {inteligencia = inteligencia + 1}
    method mejorarReflejos() {reflejos = reflejos + 1}
    method tieneGanasDejugarVueloEspacial() = !vueloEspacial.tieneDificultadDificil()
}

object dana {
    var inteligencia = 5
    var reflejos = 1
    var ultimoJuegoQueJugo = salaDeEscape

    method experiencia() = (inteligencia + reflejos) / 2
    method estaContento() = ultimoJuegoQueJugo == salaDeEscape
    method inteligencia() = inteligencia
    method reflejos() = reflejos
    method mejorarInteligencia() {inteligencia = inteligencia + 1}
    method mejorarReflejos() {reflejos = reflejos + 1}
    method jugarA(unaMaquina) {
        ultimoJuegoQueJugo = unaMaquina
        unaMaquina.usar(self)
    }
}

object zoe {
    var inteligencia = 5
    var reflejos = 5

    method experiencia() = (inteligencia + reflejos) / 2
    method estaContento() = arcade.maquinas().all({maquina => maquina.puedeJugar(self)})
    method inteligencia() = inteligencia
    method reflejos() = reflejos
    method mejorarInteligencia() {inteligencia = inteligencia + 1}
    method mejorarReflejos() {reflejos = reflejos + 1}
    method mejorarInteligenciaDe(unJugador) {unJugador.mejorarInteligencia()}
    method mejorarReflejosDe(unJugador) {unJugador.mejorarReflejos()}
}