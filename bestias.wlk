class Bestia {
  const fuerza
  //Podría considerarse que la bestia también tiene ubicacion

  //Pto 7
  method atacar(embarcacion) {
    if (self.puedeAtacar(embarcacion)) {
      self.daniarEmbarcacion(embarcacion)
    }
    //caso contrario no pasa nada
  }

  method puedeAtacar(embarcacion) = fuerza > embarcacion.poderDeDanio()

  method daniarEmbarcacion(embarcacion)

}

class BallenaAzul inherits Bestia {

  override method daniarEmbarcacion(embarcacion) {
    embarcacion.envejecerCaniones(8)
  }
}

class TiburonBlanco inherits Bestia {
  const miedoInfligido
  override method daniarEmbarcacion(embarcacion) {
    embarcacion.modificarCoraje(-miedoInfligido)
  }
}

object kraken inherits Bestia(fuerza=100000) {
  
  override method daniarEmbarcacion(embarcacion) {
    embarcacion.matarMasCorajudos(5)
  }

}