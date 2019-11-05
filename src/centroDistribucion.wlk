import vendedores.*
import certificaciones.*

class Centro {

	var property ciudad
	var property vendedores = #{}

	method agregarVendedor(vendedor) {
		if (not vendedores.contains(vendedor)) {
			vendedores.add(vendedor)
		} else {
			self.error("el vendedor ya esta anotado en el centro")
		}
	}

	method vendedorEstrella() {
		return vendedores.max({ vendedor => vendedor.cantidadTotalDePuntosDeCertificaciones() })
	}

	method sePuedeCubrir() {
		return vendedores.any({ vendedor => vendedor.puedeTrabajar(self.ciudad()) })
	}

	method coleccionDeVendedoresGenericos() {
		return vendedores.filter({ vendedor => vendedor.noEsSobreProductos() })
	}

	method esRobusto() {
		return vendedores.count({ vendedor => vendedor.esFirme() }) >= 3
	}

	method repartirCertificacion(certificacion) {
		vendedores.forEach({ vendedor => vendedor.agregarCertificacion(certificacion)})
	}

//	method afinidadPorUnCentroDeDistribucion() {
//		return vendedores.filter({ vendedor => vendedor.puedeTrabajar(self.ciudad()) })
//	}
	
//	method vendedoresCorresponsalDelCentro(){
//		return vendedores.filter({ vendedor => vendedor.esVendedorComercioCorresponsal()})
//	}
//	
//	method noPuedeCubrir() {
//		return self.vendedoresCorresponsalDelCentro().filter({ 
//			vendedor => vendedor.puedeTrabajar(self.ciudad())}).isEmpty()
//		
//	}
	
	
	
	
	
	

	
	
}
