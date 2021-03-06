import Presentacion.*
import lugares.*
import musico.*
import requisitos.*
import cantantes.*

object pdpalooza inherits Presentacion(new Date(15,12,2017), lunaPark, #{}) {
	
	var requisitos = #{habilidadMayorA70, compusoUnaCancion, interpretaBienAlicia}
	
    override method agregarArtista(musico){
		requisitos.forEach{requisito => requisito.aplicarA(musico)}
		artistas.add(musico)
	}

	method agregarRequisito(requisito){
		requisitos.add(requisito)
	}
	
	method sacarRequisito(requisito){
		requisitos.remove(requisito)
	}

}
