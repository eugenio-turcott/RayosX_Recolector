//
//  donanteRow.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct donanteRow: View {
    var recibo: RECIBOS
    @State var donante: DONANTES
    @State private var estatus: Int = 0

    var body: some View {
        ZStack {
            HStack {
                if (recibo.ID_ESTATUS == 1) {
                    Color("Verde")
                } else if (recibo.ID_ESTATUS == 2) {
                    Color("Rojo")
                } else {
                    Color("Gris claro")
                }
            }
            .frame(width: 300.0, height: 115.0)
            .cornerRadius(10)
            .offset(y: 10)
            VStack{
                HStack{ //Nombre                   Apellido
                    Text("\(donante.NOMBRE) \(donante.A_PATERNO)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0/255, green: 59/255, blue: 92/255))
                        .padding(.leading, 15.0)
                        .padding(.top, 10.0)
                        .offset(y: 5)
                    Spacer()
                }
                .onAppear(){
                    donante = traerDonante(idD: recibo.ID_DONANTE)
                }
                HStack{
                    Text(recibo.DIRECCION_COBRO)
                        .font(.title3)
                        .padding(.leading, 15)
                }
                .padding(.top, 1.0)
            }
        }
    }
}


struct donanteRow_Previews: PreviewProvider {
    static var previews: some View {
        @State var estatus: Int = 1
        donanteRow(recibo: listaRecibos[0], donante: listaDonantes[0])
    }
}
