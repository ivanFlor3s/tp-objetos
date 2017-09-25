import Presentacion.*
import guitarras.*
import lugares.*
import musico.*

object luisAlberto inherits Musico( null , null, null){

	var guitarra

	
	method tocarCon(guitar){
		guitarra = guitar
	}
	method interpretaBien(cancion) {
		return true
	}
	method habilidad(presentacion) {
		habilidad = 100.min(8 * guitarra.valor())
		
		}
	method cobra(presentacion){
		if(presentacion.antesDe(1, 9, 2017)){
			return 1000
		} else {
			return 1200
		}
	}
	
	method tratarMal(guitar){
		guitar.romperse()
	}
	
	method guitarra(){
		return guitarra
	}
}
