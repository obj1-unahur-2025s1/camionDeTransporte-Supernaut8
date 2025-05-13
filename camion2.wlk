object camion {
    const carga = []
    const bultos = []
    method cargar(unaCosa) {
        carga.add(unaCosa)
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method peso() = 1000 + carga.sum({c => c.peso()})
    method pesosDeCosasSonPares() = carga.all({c => c.peso() % 2 == 0})
    method cargaDePesoIgualA(unPeso) = carga.any({c => c.peso() == unPeso})
    method primerCargaDePeligro(unNivel) = carga.find({c => c.peligrosidad() >= unNivel})
    method cosasQueSuperanElNivelDePeligro(unNivel) = carga.filter({c => c.peligrosidad() > unNivel})
    method cosasQueSuperenLaPeligrosidadDe(unaCosa) = carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
    method estaExcedido() = self.peso() > 2500
    method puedeCircularPorRuta(unNivel) = not self.estaExcedido() and carga.all({c => c.peligrosidad() < unNivel}) 
    method cosaDePesoEntre(valor1, valor2) = carga.any({c => c.peso().between(valor1, valor2)})
    method cosaMasPesada() = carga.max({c => c.peso()})
}