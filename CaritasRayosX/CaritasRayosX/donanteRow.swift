//
//  donanteRow.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct donanteRow: View {
    var donante: donante
    @State private var estatus: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Text(donante.nombre + " " + donante.apellidoP)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0/255, green: 59/255, blue: 92/255))
                    .padding(.leading, 30.0)
                
                Spacer()
                Image("simboloInfo2")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45.0)
                    //.offset(y: -10)
                Spacer()
            }
            HStack{
                Spacer()
                Picker(selection: $estatus, label: Text("Picker")){
                    Text("No localizado").tag("No localizado")
                    Text("Pagado").tag("Pagado")
                    Text("No pagado").tag("No pagado")
                }.padding(.leading, 10.0).frame(width: 330.0, height: 50.0).pickerStyle(.segmented)
                Spacer()
            }
            // Opciones de estatus
        }
        
    }
}

struct donanteRow_Previews: PreviewProvider {
    static var previews: some View {
        donanteRow(donante: listaDonantes[0])
    }
}
