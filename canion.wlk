class Canion {
  const danioFabricacion // = 350 // TODO ver pto 6
  var property antiguedad = 0

  method poder() = danioFabricacion - self.desgaste()
  method desgaste() = danioFabricacion * 0.01 * antiguedad

}

object canion {
  var property valorActualDanioFabricacion = 350

  method fabricar() =
    new Canion(danioFabricacion=valorActualDanioFabricacion)

}
