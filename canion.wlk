class Canion {
  const danioFabricacion // = 350 // TODO ver pto 6
  var property antiguedad

  method poder() = danioFabricacion - self.desgaste()
  method desgaste() = danioFabricacion * 0.01 * antiguedad

  method envejecer(cantidadAnios) {
    antiguedad += cantidadAnios
  }

  override method initialize() {
    antiguedad = 0 // Ejemplo de uso método intialize de Wollok
    if (danioFabricacion != canion.valorActualDanioFabricacion()) {
      throw new DomainException(message="TAMAL!")
    }
  }
}

object canion {
  var property valorActualDanioFabricacion = 350

  method fabricar() =
    new Canion(danioFabricacion=valorActualDanioFabricacion)

}
