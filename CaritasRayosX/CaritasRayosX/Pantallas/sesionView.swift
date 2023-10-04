//
//  sesionView.swift
//  CaritasRayosX
//
//  Created by Alumno on 04/10/23.
//

import SwiftUI

struct sesionView: View {
    @State private var usuario: String = ""
    @State private var contraseña: String = ""
    @State var dataPie: [(Double, Color)] = []
  
    var body: some View {
        VStack{
            TextField("", text: $usuario, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            TextField("", text: $contraseña, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Button {
                enviarUsuario(usuario: usuario, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
                enviarContrasena(contrasena:contraseña, idRecolector: UserDefaults.standard.integer(forKey:"idR"))
            }
            label: {
                Text("Guardar")
                    .padding(20)
                    .frame(width: 300.0, height: 70.0)
                    .font(.headline)
                    .background(Color("Azul oscuro"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20.0)
                    .padding(.bottom, 20.0)
            }
            
            PieChartView(slices:[
                (callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR")), Color.red),
                ((callRecibosTotales(idR: UserDefaults.standard.integer(forKey:"idR")) - callRecibosHechos(idR: UserDefaults.standard.integer(forKey:"idR"))), Color.green)
                ])

        }
        .onAppear(){
            usuario=UserDefaults.standard.string(forKey:"usuario") ?? ""
            contraseña=UserDefaults.standard.string(forKey:"contraseña") ?? ""
           
        }
    }
}

struct sesionView_Previews: PreviewProvider {
    static var previews: some View {
        sesionView()
    }
    
}
