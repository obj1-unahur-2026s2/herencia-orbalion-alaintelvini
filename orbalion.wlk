class Equipos{
    var nombre1=""
    var nivDeEnergiaBase=0
    var entrenador1
    const listDeTecnologias=[]

    method nombre(){
        return nombre1
    }

    method asignarNombre(nuevoNombre){
        nombre1=nuevoNombre
    }

    method nivelDeEnergiaBase(){
        return nivDeEnergiaBase
    }

    method entrenador(){
        return entrenador1
    }

    method asignarNombreAlEntrenador(nuevoEntrenador){
        entrenador1=nuevoEntrenador
    }

    method listaDeTecnologias(){
        return listDeTecnologias
    }

    method agregarTecnologia(tecnologia){
        listDeTecnologias.add(tecnologia)
    }

    method energiaTotal(){
        return self.nivelDeEnergiaBase()+ listDeTecnologias.filter({l=>l.esActiva()}).sum
        ({l=>l.valorEnergetico()})
    }

    method esDePrestigioUniversal(){
        
    }
}

class Luminicos inherits Equipos{
    var nivelDeRadiacion=1
    const nombresDeCristales=[]

    method nivelDeRadiacionCapturada(){
        return nivelDeRadiacion
    }

    method cambiarNivelDeRadiacion(nuevoNivel){
        nivelDeRadiacion=nuevoNivel
    }

    method agregarNombresDeCristales(nuevoNombre){
        nombresDeCristales.add(nuevoNombre)
    }

    method listaDeCristales(){
        return nombresDeCristales
    }
    
    override method energiaTotal(){
        if(nivelDeRadiacion<=5000){
            return super() *1.10
        } else{
            return super()
        }
    }

    override method esDePrestigioUniversal(){
        return nombresDeCristales.size()>=3 and entrenador1.esDeEliteGalaxia() and
         listDeTecnologias.filter({l=>l.esActiva()}).size()>=1
    }
}

class Sinteticos inherits Equipos{

    var nivDeProcesamientoCentral=0
    var estanCertificados=true
    var cantModulosActivos=0

    method modulosActivos(){
        return cantModulosActivos
    }

    method cambiarCantDeModulosActivos(nuevaCant){
        cantModulosActivos=nuevaCant
    }

    method nivelDeProcesamientoCentral(){
        return nivDeProcesamientoCentral
    }

    method cambiarNivel(nuevoNivel){
        nivDeProcesamientoCentral=nuevoNivel
    }

    method estanCertificadosComoUnidad(){
        return estanCertificados
    }

    method noEstanCertificados(){
        estanCertificados=false
    }

    method siEstanCertificados(){
        estanCertificados=true
    }

    override method energiaTotal(){
        if(self.modulosActivos()>5){
            return super()*0.80
        } else{
            return super()
        }
    }
    override method esDePrestigioUniversal(){
       return self.estanCertificadosComoUnidad() and self.modulosActivos()>3 and not listDeTecnologias.isEmpty() and listDeTecnologias.all({l=>l.esActiva()})
    }
}

class Etericos inherits Equipos{
    var nivelDeFluctuacion=0
    var cantDePortalesAbiertos=0

    method nivelDeFluctuacionDimensional(){
        return nivelDeFluctuacion
    }

    method cambiarNivelDeFluctuacion(nuevoNivel){
        nivelDeFluctuacion=nuevoNivel
    }

    method cantidadDePortalesAbiertos(){
        return cantDePortalesAbiertos
    }

    method cambiarCantDePortalesAbiertos(nuevoNumero){
        cantDePortalesAbiertos=nuevoNumero
    }

    override method esDePrestigioUniversal(){
       return self.nivelDeFluctuacionDimensional()>75 and
        self.cantidadDePortalesAbiertos()>=2 and listDeTecnologias.filter({l=>l.esActiva()}).size()>=2
    }

    override method energiaTotal(){
        if(self.esDePrestigioUniversal()){
            return super()* 1.15
        } else{
            return super()
        }
    }
}

class Entrenadores{
    var experiencia=0
    var estaEnSintonia=true
    var nivelDePrecision=0
    var rol1

    method experienciaConEquipo(){
        return experiencia
    }

    method cambiarExperiencia(cantExperiencia){
        experiencia=cantExperiencia
    }

    method estaEnSintoniaConEquipo(){
        return estaEnSintonia
    }

    method noEstaEnSintoniaConEquipo(){
        estaEnSintonia=false
    }

    method siEstaEnSintonia(){
        estaEnSintonia=true
    }

    method nivelDePrecisionEstrategico(){
        return nivelDePrecision
    }

    method cambiarNivelDePrecision(nuevoNivel){
        nivelDePrecision=nuevoNivel.between(0,100)
    }

    method rol(){
        return rol1
    }

    method cambiarDeRol(nuevoRol){
        if(nuevoRol!=estrategaCuantico and nuevoRol!=arquitectoDeEnergia and nuevoRol!=guiaMental){
            self.error("rol no homologado por la foz")
        } else{
            rol1=nuevoRol
        }
    }

    method esDeEliteGalaxia(){
        experiencia>10 and rol1.cumplioSuRequisito(self)
    }
}

object estrategaCuantico{
    

    method cumplioSuRequisito(entrenador){
       return  entrenador.nivelDePrecisionEstrategico()>80
    }
}
object arquitectoDeEnergia{

    method cumplioSuRequisito(entrenador){
        return entrenador.estaEnSintoniaConEquipo()
    }
}
object guiaMental{

    method cumplioSuRequisito(entrenador){
        return true
    }
}

class TecnologiasEspeciales{
    var nombre1=""
    var valEnergetico=0
    var activa=true

    method nombre(){
        return nombre1
    }

    method asignarNombre(nuevoNombre){
        nombre1=nuevoNombre
    }

    method valorEnergetico(){
        return valEnergetico
    }

    method cambiarValorEnergetico(nuevoValor){
        valEnergetico=nuevoValor
    }

    method esActiva(){
        return activa
    }

    method siEsActiva(){
        activa=true
    }

    method noEsActiva(){
        activa=false
    }
}
