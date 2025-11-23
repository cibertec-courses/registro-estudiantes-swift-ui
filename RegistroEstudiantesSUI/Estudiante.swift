//
//  Estudiante.swift
//  RegistroEstudiantesSUI
//
//  Created by Christiam Alberth Mendoza Ruiz on 23/11/25.
//
import Foundation

struct Estudiante: Identifiable{
    var id = UUID()
    var nombre: String
    var edad : Int
    var carrera: String
    var fechaRegistro: Date
    
    
    var fechaFormatead : String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: fechaRegistro )
        
    }
    
}
