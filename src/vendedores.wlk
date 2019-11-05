import ciudades.*
import certificaciones.*

class Vendedor {

	var property ciudad
	var property certificaciones = #{}
	

	method puedeTrabajar(donde) {
		return false
	}

	method agregarCertificacion(certificacion){
		certificaciones.add(certificacion)
	}

	method cantidadDeCertificaciones() {
		return certificaciones.size()
	}

	method certificacionesSobreProductos() {
		return certificaciones.any({ c => c.esSobreProductos() })
	}

	method noEsSobreProductos() {
		return certificaciones.any({ c => not c.esSobreProductos() })
	}

	method esVersatil() {
		return self.cantidadDeCertificaciones() >= 3 and self.certificacionesSobreProductos() and self.noEsSobreProductos()
	}

	method cantidadTotalDePuntosDeCertificaciones() {
		return certificaciones.sum({ c => c.puntosQueOtorga() })
	}

	method esFirme() {
		return self.cantidadTotalDePuntosDeCertificaciones() >= 30
	}

	method esInfluyente() {
		return false
	}
	
	method esVendedorComercioCorresponsal(){
		return false
	} 
	
	method afinidadPorUnCentroDeDistribucion(centro) {
		return self.ciudad() == centro.ciudad()
	}
	

}

class VendedorFijo inherits Vendedor {

	const property ciudadDondeVive
	

	override method puedeTrabajar(donde) {
		return self.ciudadDondeVive() == donde
	}

	override method esInfluyente() {
		return false
	}

}

class VendedorViajante inherits Vendedor {

	var property provinciasDondePuedeTrabajar = #{}

	method agregarProvincia(provincia) {
		provinciasDondePuedeTrabajar.add(provincia)
	}

	override method puedeTrabajar(donde) {
		return provinciasDondePuedeTrabajar.contains(donde)
	}

	override method esInfluyente() {
		return provinciasDondePuedeTrabajar.sum({ provincia => provincia.poblacion() }) >= 1000000
	}

}

class ComercioCorresponsal inherits Vendedor {

	var property ciudadEnLaQueTieneSucursales = #{}

	method agregarCiudad(ciudad) {
		ciudadEnLaQueTieneSucursales.add(ciudad)
	}

	override method puedeTrabajar(donde) {
		return ciudadEnLaQueTieneSucursales.contains(donde)
	}

	method cantidadDeCiudadesConSucursales() {
		return ciudadEnLaQueTieneSucursales.size()
	}

	method cantProvinciasDeLasSucursales() {
		return ciudadEnLaQueTieneSucursales.map({ ciudad => ciudad.enQueProvinciaEsta() }).asSet().size()
	}

	override method esInfluyente() {
		return self.cantidadDeCiudadesConSucursales() >= 5 or
		self.cantProvinciasDeLasSucursales() >= 3
	}
	
	override method esVendedorComercioCorresponsal(){
		return true
	}
	
	override method afinidadPorUnCentroDeDistribucion(centro){
		return super(centro) and ciudadEnLaQueTieneSucursales.any({ ciudad =>ciudad == centro.ciudad() })
		
	}





}














