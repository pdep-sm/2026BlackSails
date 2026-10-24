import armas.*
import pirata.*
class Embarcacion {
  var property capitan
  var property contramaestre 
  const tripulacion = #{}
  const caniones = []
  var property ubicacion
  var botin
  
  method poderDeDanio() = self.poderDeCaniones() + self.corajeTotal()

  method tripulacionTotal() = #{capitan, contramaestre}.union(tripulacion)

  method corajeTotal() = self.tripulacionTotal().sum{ t => t.coraje() }

  method poderDeCaniones() = caniones.sum{ c => c.poder() }

  //Pto 2
  method masCorajudo() = tripulacion.max{ t => t.coraje() }

  method puedeEntrarEnConflicto(otra) = ubicacion.puedeEntrarEnConflicto(otra.ubicacion())

  method tieneHabilNegociador() = 
    self.tripulacionTotal().any{ t => t.esHabilNegociador() }

  method tomarMedioBotinDe(otra) {
    const medioBotin = otra.medioBotin()
    otra.modificarBotin(-medioBotin)
    self.modificarBotin(medioBotin)
  }

  method medioBotin() = botin * 0.5
  
  method modificarBotin(cantidad){
    botin += cantidad
  }

  method modificarCoraje(cantidad){
    self.tripulacionTotal().forEach{ t => t.modificarCoraje(cantidad)}
  }

  method matarTripulantesCobardes(cantidad){
    const aBorrar = self.tripulacionOrdenadaPorCoraje().reverse().take(cantidad)
    tripulacion.removeAll(aBorrar)
  }

  method tripulacionOrdenadaPorCoraje() =
    tripulacion.sortedBy{ t1, t2 => t1.coraje() > t2.coraje() }

  method ascenderContramaestre() {
    contramaestre = self.masCorajudo()
    tripulacion.remove(contramaestre)
  }

  method matarMasCorajudos(cantidad) {
    tripulacion.removeAll(self.masCorajudos(cantidad))
  }

  method masCorajudos(cantidad) = self.tripulacionOrdenadaPorCoraje().take(cantidad)

  method transferirMasCorajudos(cantidad, otra) {
    const aTransferir = self.masCorajudos(cantidad)
    tripulacion.removeAll(aTransferir)
    otra.agregarTripulacion(aTransferir)
  }

  method agregarTripulacion(tripulantes) {
    tripulacion.addAll(tripulantes)
  }

  method generarMotin() {
    if (capitan.coraje() < contramaestre.coraje())
      self.derrocarCapitan()
    else
      self.degradarContramaestre()
  }

  method derrocarCapitan() {
    capitan = contramaestre
    self.ascenderContramaestre()
  }

  method degradarContramaestre() {
    const viejoContramaestre = contramaestre
    contramaestre.degradar()
    self.ascenderContramaestre()
    tripulacion.add(viejoContramaestre)
  }

  method envejecerCaniones(cantidadAnios) {
    caniones.forEach{ canion => canion.envejecer(cantidadAnios) }
  }
}

class Ubicacion {
  const property oceano
  const property x
  const property y

  method puedeEntrarEnConflicto(otra) = oceano == otra.oceano() and self.estaCercaDe(otra)

  method estaCercaDe(otra) = self.distanciaA(otra) < conflicto.distanciaMaxima()
  
  method distanciaA(otra) = ((x - otra.x()).square() + (y - otra.y()).square()).squareRoot()
}

object conflicto {
  var property distanciaMaxima = 88
}
