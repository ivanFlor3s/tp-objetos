import Albumes.*
import Presentacion.*
import Cancion.*

class Musico {

	var grupo
	var habilidad
	var albumes = #{}
	
	constructor(unGrupo, unaHabilidad, unosAlbumes){
		grupo = unGrupo
		habilidad = unaHabilidad
		albumes= unosAlbumes
		
	}
	
	method agregarAlbum(album){
	albumes.add(album)	
	}
	
	method cantaEnGrupo(presentacion) {
		return presentacion.cantaEnGrupo(self)
	}
	
	method esMinimalista(){
		return albumes.all({ album => album.tieneCancionesCortas()})	
	}
	
	method cancionesConPalabra(palabra){
  		return albumes.flatMap({ album => album.cancionesConLaPalabra(palabra) })
 }
	
	method duracionObra(){
		return albumes.sum({album => album.duracion()})
	}
	
	method laPego(){
		return albumes.all({ album => album.esBuenaVenta() })		
	}

	method habilidadMenorA(unaHablildad){ return habilidad < unaHabilidad }
	
	method habilidad(){
		return habilidad
	}
	
	method compusoAlMenosUnaCancion(){ return albumes.size() > 0 }
		
	method puedeEjecutarAliciaEnElPais(){
		var cancionAlicia = new Cancion("Canci�n de Alicia en el pa�s", "Qui�n sabe Alicia, este pa�s no estuvo
 hecho porque s�. Te vas a ir, vas a salir pero te quedas, �d�nde m�s vas a ir?
 Y es que aqu�, sabes el trabalenguas, trabalenguas, el asesino te asesina, y 
es mucho para ti. Se acab� ese juego que te hac�a feliz.", 510)
		return self.interpretaBien(cancionAlicia)
	}
	
	method interpretaBien(cancion) {
		if(habilidad > 60){
			return true
		}else{
			return albumes.any({album=>album.estaEnAlbum(cancion)})
		}
	}
	
}

class MusicoVocalista inherits Musico {

	var palabra

	constructor(unGrupo, unaHabilidad, unosAlbumes , unaPalabra) = super(unGrupo, unaHabilidad, unosAlbumes) {
		palabra = unaPalabra
	}
	
	override method interpretaBien(cancion) {
    if(cancion.tienePalabra(palabra)){
        return true
    }else{
        return super(cancion)
    }
}

	method cobra(presentacion) {
		if (presentacion.esConcurrida()) {
			return 500
		}
		else return 400
	}
	
	method habilidad(presentacion) {
		if (self.cantaEnGrupo(presentacion)) {
			return habilidad - 20
		}
		else return habilidad
	}
}

class MusicoDeGrupo inherits Musico {
	var plus	
	
	constructor(unGrupo, unaHabilidad, unosAlbumes ,unPlus) = super(unGrupo, unaHabilidad, unosAlbumes){ 
		plus = unPlus
	}

		override method interpretaBien(cancion) {
    if(cancion.duraMasDe(300)){
        return true
    }else{
        return super(cancion)
    }
}

	method habilidad(presentacion) { 
		if (self.cantaEnGrupo(presentacion)) {
			return habilidad += plus
		} else {
			return habilidad
		}
	}
	method cobra(presentacion) { 
    	if(self.cantaEnGrupo(presentacion)){ 
      		return 50 
    } else { 
      		return 100 
    } 
   } 
	
}