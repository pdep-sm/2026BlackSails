object cuchillo {
  var danio = 8
  method danio(pirata) = danio
}

class Espada {
  const danio
  method danio(pirata) = danio
}

class Pistola {
  const calibre
  const material

  method danio(pirata) = calibre * indicesMateriales.indicePara(material)

}

object indicesMateriales {
  method indicePara(material) = material.length() //TODO VER LISTA ROBADA
}

class Insulto {
  const frase

  method danio(pirata) = frase.words() * pirata.corajeBase() // <= ô_Ô
}