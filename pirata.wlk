import armas.*

class Pirata {
  var corajeBase
  const armas = []
  const inteligencia
  
  method coraje() = corajeBase + self.poderDeArmas()

  method poderDeArmas() = armas.sum{ arma => arma.danio(self) }

  method esHabilNegociador() = inteligencia > 50

  method modificarCoraje(cantidad) {
    corajeBase += cantidad
  }

  method degradar() {
    armas.clear()
    armas.add(new Espada(danio=1))
  }

}

