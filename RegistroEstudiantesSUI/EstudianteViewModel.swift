import Foundation
import Combine
import SwiftUI

class EstudiantesViewModel: ObservableObject {
    
    @Published var estudiantes: [Estudiante] = []
    
    static let shared = EstudiantesViewModel()
    
    private init() {
        cargarEstudiantesDePrueba()
    }
    
    func agregarEstudiante(nombre: String, edad: Int, carrera: String) {
        let nuevoEstudiante = Estudiante(
            nombre: nombre,
            edad: edad,
            carrera: carrera,
            fechaRegistro: Date()
        )
        estudiantes.append(nuevoEstudiante)
        estudiantes.sort { $0.fechaRegistro > $1.fechaRegistro }
    }
    
    func eliminarEstudiante(at offsets: IndexSet) {
        estudiantes.remove(atOffsets: offsets)
    }
    
    func cargarEstudiantesDePrueba() {
        let ayer = Date().addingTimeInterval(-86400)
        let antesDeAyer = Date().addingTimeInterval(-172800)
        
        estudiantes = [
            Estudiante(nombre: "Ana García", edad: 22, carrera: "Medicina", fechaRegistro: ayer),
            Estudiante(nombre: "Carlos Ruiz", edad: 20, carrera: "Ingeniería", fechaRegistro: antesDeAyer)
        ]
    }
}
