
import SwiftUI

struct ContentView: View {

    @State private var nombreEstudiante: String = ""
    @State private var edad: String = ""
    @State private var carrera: String = ""

    @State private var mostrarAlerta: Bool = false
    @State private var mensajeAlerta: String = ""

    @FocusState private var campoActivo: Campo?

    enum Campo {
        case nombre
        case edad
        case carrera
    }

    var body: some View {
           NavigationView {
               ScrollView {
                   VStack(spacing: 0) {

                       VStack(spacing: 8) {
                           Image(systemName: "person.3.fill")
                               .font(.system(size: 50))
                               .foregroundColor(.white)

                           Text("Registro de Estudiantes")
                               .font(.title)
                               .fontWeight(.bold)
                               .foregroundColor(.white)

                           Text("Completa tus datos")
                               .font(.subheadline)
                               .foregroundColor(.white.opacity(0.9))
                       }
                       .frame(maxWidth: .infinity)
                       .padding(.vertical, 40)
                       .background(
                           LinearGradient(
                               gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                           )
                       )

                       VStack(spacing: 25) {

                           VStack(alignment: .leading, spacing: 8) {
                               Label("Nombre Completo", systemImage: "person.fill")
                                   .font(.headline)
                                   .foregroundColor(.gray)

                               TextField("Ej: Juan Pérez", text: $nombreEstudiante)
                                   .textFieldStyle(CustomTextFieldStyle())
                                   .focused($campoActivo, equals: .nombre)
                                   .submitLabel(.next)
                                   .onSubmit {
                                       campoActivo = .edad
                                   }
                           }

                           // Campo Edad
                           VStack(alignment: .leading, spacing: 8) {
                               Label("Edad", systemImage: "calendar")
                                   .font(.headline)
                                   .foregroundColor(.gray)

                               TextField("Ej: 20", text: $edad)
                                   .textFieldStyle(CustomTextFieldStyle())
                                   .keyboardType(.numberPad)
                                   .focused($campoActivo, equals: .edad)
                           }

                           VStack(alignment: .leading, spacing: 8) {
                               Label("Carrera", systemImage: "book.fill")
                                   .font(.headline)
                                   .foregroundColor(.gray)

                               TextField("Ej: Ingeniería de Sistemas", text: $carrera)
                                   .textFieldStyle(CustomTextFieldStyle())
                                   .focused($campoActivo, equals: .carrera)
                                   .submitLabel(.done)
                                   .onSubmit {
                                       campoActivo = nil
                                   }
                           }

                           // Botón Registrar
                           Button(action: registrarEstudiante) {
                               HStack {
                                   Image(systemName: "checkmark.circle.fill")
                                   Text("Registrar Estudiante")
                                       .fontWeight(.semibold)
                               }
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color.blue)
                               .foregroundColor(.white)
                               .cornerRadius(12)
                               .shadow(color: Color.blue.opacity(0.3), radius: 5, x: 0, y: 3)
                           }
                           .padding(.top, 10)

                       }
                       .padding(25)
                       .background(Color.white)

                       Spacer(minLength: 20)
                   }
               }
               .background(Color(.systemGroupedBackground))
               .ignoresSafeArea(edges: .top)
               .navigationBarHidden(true)

               .onTapGesture {
                   ocultarTeclado()
               }
               .alert("Mensaje", isPresented: $mostrarAlerta) {
                   Button("OK", role: .cancel) { }
               } message: {
                   Text(mensajeAlerta)
               }
           }
    }
       
    
    func registrarEstudiante() {
        ocultarTeclado()
        
        if nombreEstudiante.trimmingCharacters(in: .whitespaces).isEmpty{
            mensajeAlerta = "Por favor ingres un nombre"
            mostrarAlerta = true
            return
        }
        
        if edad.trimmingCharacters(in: .whitespaces).isEmpty{
            mensajeAlerta = "Por favor ingresa una edad"
            mostrarAlerta = true
            return
        }
        
        guard let edadNumerica = Int(edad) else{
            mensajeAlerta = "La edad debe ser un numero valido"
            mostrarAlerta = true
            return
        }
        
        if edadNumerica <= 0 || edadNumerica > 120{
            mensajeAlerta = "La edad debe estar entre 1 y 120"
            mostrarAlerta = true
            return
             
        }
        
        print("Registro Existoso")
        print("Nombre: \(nombreEstudiante)")
        print("Edad: \(edad)")
        print("Carrera: \(carrera)")
        
    }
    func ocultarTeclado(){
        campoActivo = nil
    }
    
    struct CustomTextFieldStyle : TextFieldStyle {
        func _body (configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
    
}


struct Content_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
