object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object auto {
    method peligrosidad() = 15
}
object robot {
    method peligrosidad() = 30
}
object bumblebee {
    var property forma = auto
    method peso() = 800
    method peligrosidad() = forma.peligrosidad() 
}

object ladrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
}

object arena {
    var property peso = 500
    method peligrosidad() = 1
}

object antiAereo {
    var tieneMisiles = false
    method cargar(){
        tieneMisiles = true
    }
    method tieneMisiles() = tieneMisiles
    method peso() = 0 + if (self.tieneMisiles()) 300 else 200
    method peligrosidad() = 0 + if (self.tieneMisiles()) 100 else 0
}

object contenedor {
    var cargamento = []
    method cargar(unaCosa) {
        cargamento.add(unaCosa)
    }
    method peso() = 100 + cargamento.sum({c => c.peso()}) 
    method estaVacio() = cargamento.isEmpty()
    method peligrosidad() = 0 + if (self.estaVacio()) 0 else cargamento.max({c => c.peligrosidad()})
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalajeDeSeguridad {
    var property cargaCubierta = null
    method peso() = cargaCubierta.peso()
    method peligrosidad() = cargaCubierta.peligrosidad() / 2
}
