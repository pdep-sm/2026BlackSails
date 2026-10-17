class Contienda {

  method puedeTomar(atacante, defensor) = //TEMPLATE METHOD
    atacante.puedeEntrarEnConflicto(defensor) and
    self.cumpleCondicionDeToma(atacante, defensor)

  method cumpleCondicionDeToma(atacante, defensor)
  method tomar(atacante, defensor)

  method validarToma(atacante, defensor) {
    if (not self.puedeTomar(atacante, defensor))
      throw new ContiendaException(message="No se puede realizar la " + self.kindName())
  }

}
object negociacion inherits Contienda {
  /* Solución sin template
  override method puedeTomar(atacante, defensor) = 
    super(atacante, defensor) and atacante.tieneHabilNegociador()
*/
  override method cumpleCondicionDeToma(atacante, defensor) = 
    atacante.tieneHabilNegociador()

  override method tomar(atacante, defensor) {
    self.validarToma(atacante, defensor)
    atacante.tomarMedioBotinDe(defensor)
  }

}

object batalla inherits Contienda {
  /* Solución sin template
  override method puedeTomar(atacante, defensor) = 
    super(atacante, defensor) and
    atacante.poderDeDanio() > defensor.poderDeDanio()
  */
  override method cumpleCondicionDeToma(atacante, defensor) = 
    atacante.poderDeDanio() > defensor.poderDeDanio()

  override method tomar(atacante, defensor) {
    self.validarToma(atacante, defensor)
    
    atacante.modificarCoraje(5)
    defensor.matarTripulantesCobardes(3)
    defensor.capitan(atacante.contramaestre())
    atacante.ascenderContramaestre()
    atacante.transferirMasCorajudos(3, defensor)
  }
}


class ContiendaException inherits DomainException {}