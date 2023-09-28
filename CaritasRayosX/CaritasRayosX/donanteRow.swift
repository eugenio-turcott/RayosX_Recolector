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

    var body: some View {
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


struct donanteRow_Previews: PreviewProvider {
    static var previews: some View {
        donanteRow(recibo: listaRecibos[8], donante: listaDonantes[2])
    }
}
