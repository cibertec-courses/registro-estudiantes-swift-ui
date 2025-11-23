import SwiftUI

struct ListaEstudiantesView: View {
    
    @ObservedObject var viewModel = EstudiantesViewModel.shared
    
    var body: some View {
        List{
            ForEach(viewModel.estudiantes){
                estudiante in
                EstudianteRow(estudiante: estudiante)
            }
            .onDelete(perform: viewModel.eliminarEstudiante)
            
        }.navigationTitle(Text("Estudiantes Registrados"))
            .navigationBarTitleDisplayMode(.large)
            .overlay{
                if viewModel.estudiantes.isEmpty {
                    VStack (spacing: 20){
                        Image(systemName: "person.3.slash")
                            .font(.system(size:60))
                            .foregroundColor(.gray)
                        
                        Text("No hay estudiantes registrados")
                            .font(.title3)
                            .foregroundStyle(.gray)
                        
                        Text("Agrega estudiantes desde la pantalla principal")
                            .font(.caption)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,40)
                    }
                }
            }
    }
    

}

struct EstudianteRow: View {
    let estudiante: Estudiante
    
    var body: some View {
        HStack (spacing: 15){
            ZStack{
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 50, height: 50)
                
                Text(estudiante.nombre.prefix(1))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(estudiante.nombre)
                    .font(.headline)
                
                HStack(spacing:5){
                    Image(systemName: "calendar")
                        .font(.caption)
                    Text("\(estudiante.edad) años")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text("Registado: \(estudiante.fechaFormateada)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(8)
    }
}



#Preview {
    NavigationView {
        ListaEstudiantesView()
    }
}
