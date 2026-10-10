import armas.*
class Embarcacion {
  var capitan
  var contramaestre 
  const tripulacion = #{}
  const caniones = []
  var property ubicacion
  
  method poderDeDanio() = self.poderDeCaniones() + self.corajeTotal()

  method tripulacionTotal() = #{capitan, contramaestre}.union(tripulacion)

  method corajeTotal() = self.tripulacionTotal().sum{ t => t.coraje() }

  method poderDeCaniones() = caniones.sum{ c => c.poder() }

  method masCorajudo() = tripulacion.max{ t => t.coraje() }

  method puedeEntrarEnConflicto(otra) = ubicacion.puedeEntrarEnConflicto(otra.ubicacion())

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

class Pirata {
  const corajeBase
  const armas = []
  
  method coraje() = corajeBase + self.poderDeArmas()

  method poderDeArmas() = armas.sum{ arma => arma.danio(self) }

}


class Canion {
  const danioFabricacion = 350 // TODO ver pto 6
  var property antiguedad = 0

  method poder() = danioFabricacion - self.desgaste()
  method desgaste() = danioFabricacion * 0.01 * antiguedad

}

