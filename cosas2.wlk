object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method nroBultos() = 1
    method reaccionAlTransporte(){}
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
    method nroBultos() = 2
    method reaccionAlTransporte() {
        forma = robot
    } 
}

object ladrillos {
    var property cantidad = 0
    method peso() = cantidad * 2
    method peligrosidad() = 2
    method nroBultos() {
        if (self.cantidad() <= 100)
            return 1
        else if (self.cantidad() > 100 && self.cantidad() < 301)
            return 2
        else 
            return 3
    }
    method reaccionAlTransporte() {
        cantidad += 12
    } 
}

object arena {
    var property peso = 500
    method peligrosidad() = 1
    method nroBultos() = 1
    method reaccionAlTransporte() {
        peso -= 10
    } 
}

object antiAereo {
    var tieneMisiles = false
    method cargar(){
        tieneMisiles = true
    }
    method tieneMisiles() = tieneMisiles
    method peso() = 0 + if (self.tieneMisiles()) 300 else 200
    method peligrosidad() = 0 + if (self.tieneMisiles()) 100 else 0
    method nroBultos() {
        if (self.tieneMisiles())
            return 2
        else
            return 1
    }
    method reaccionAlTransporte(){
        self.cargar()
    }
}

object contenedor {
    var cargamento = []
    method cargar(unaCosa) {
        cargamento.add(unaCosa)
    }
    method peso() = 100 + cargamento.sum({c => c.peso()}) 
    method estaVacio() = cargamento.isEmpty()
    method peligrosidad() = 0 + if (self.estaVacio()) 0 else cargamento.max({c => c.peligrosidad()})
    method nroBultos() = 1 + cargamento.sum({c => c.nroBultos()})
    method reaccionAlTransporte(){
        cargamento.forEach({c => c.reaccionAlTransporte()})
    }
}

object residuosRadiactivos {
    var property peso = 0
    method peligrosidad() = 200
    method nroBultos() = 1
    method reaccionAlTransporte(){
        peso += 15
    }
}

object embalajeDeSeguridad {
    var property cargaCubierta = null
    method peso() = cargaCubierta.peso()
    method peligrosidad() = cargaCubierta.peligrosidad() / 2
    method nroBultos() = 2
    method reaccionAlTransporte(){}
}
