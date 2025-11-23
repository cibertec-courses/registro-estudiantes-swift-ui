//
//  EstudianteViewModel.swift
//  RegistroEstudiantesSUI
//
//  Created by Christiam Alberth Mendoza Ruiz on 23/11/25.
//

import Foundation
import Combine
internal import SwiftUI

class EstudianteViewModel: ObservableObject {
    
    @Published var estudiantes: [Estudiante] = []
    
    static let shared = EstudianteViewModel()
    
    private init() {
        cargarEstudiantesPrueba()
    }
    
    func agregarEstudiante(nombre:String, edad: Int, carrera: String){
        let nuevoEstudiante = Estudiante(
            nombre: nombre,
            edad: edad,
            carrera: carrera,
            fechaRegistro: Date())
    }
    
    func eliminarEstudiante(at offsets: IndexSet){
        estudiantes.remove(atOffsets: offsets)
    }
    
    
    func cargarEstudiantesPrueba(){
        estudiantes = [
            Estudiante(nombre: "Carlos", edad: 22, carrera: "Medicina", fechaRegistro: Date().addingTimeInterval(-86400)),
            Estudiante(nombre: "Ana", edad: 21, carrera: "Igneieria", fechaRegistro: Date().addingTimeInterval(-172800))
        ]
    }
    
}
