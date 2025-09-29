import maquinas.*
import jugadores.*



object arcade {
    const maquinas = #{zombieAttack, vueloEspacial, salaDeEscape}
    const jugadores = #{}

    method maquinas() = maquinas
    method jugadores() = jugadores
    method registrarEntrada(unJugador) {jugadores.add(unJugador)}
    method registrarSalida(unJugador) {jugadores.remove(unJugador)}
    method arcadeEstaLleno() = jugadores.size() >= 3
    // isEmpty() sirve para saber si una lista es vacia
    method arcadeEstaVacio() = jugadores.isEmpty()
    // filter sirve para filtar por los que cumplen la condicion
    method maquinasQueNecesitanReparacion() = maquinas.filter({maquina => maquina.necesitaReparacion()})
    method maquinaMasNueva() = maquinas.max({maquina => maquina.añoDeFabricacion()})
    method maquinaMasAntigua() = maquinas.min({maquina => maquina.añoDeFabricacion()})
    // count sirve para contar la cantidad de elementos que cumplen la condicion
    method cantidadDeMaquinasVintage() = maquinas.count({maquina => maquina.esVintage()})
    // find sirve para encontrar el primer elemento que cumple la condicion
    method maquinaQueTieneMenosDe50DeEnergia() = maquinas.find({maquina => maquina.bateria() < 50})
    method cerrarElLocal() {
        jugadores.clear()
        maquinas.forEach({maquina => maquina.cargar(8)})
    }
}