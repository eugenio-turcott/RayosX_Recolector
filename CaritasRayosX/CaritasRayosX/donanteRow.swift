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
        if (recibo.ID_ESTATUS == 1) {
            VStack{
                HStack{ //Nombre                   Apellido
                    Text("\(donante.NOMBRE) \(donante.A_PATERNO)")
                        .font(.system(size: 25))
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
                        .font(.system(size: 23))
                        .padding(.leading, 15)
                        .offset(y: -10)
                }
                .padding(.top, 1.0)
            }
            .background(Color("Verde"))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 4))
        } else if (recibo.ID_ESTATUS == 2) {
            VStack{
                HStack{ //Nombre                   Apellido
                    Text("\(donante.NOMBRE) \(donante.A_PATERNO)")
                        .font(.system(size: 25))
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
                        .font(.system(size: 23))
                        .padding(.leading, 15)
                        .offset(y: -10)
                }
                .padding(.top, 1.0)
            }
            .background(Color("Rojo"))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 4))
        } else {
            VStack{
                HStack{ //Nombre                   Apellido
                    Text("\(donante.NOMBRE) \(donante.A_PATERNO)")
                        .font(.system(size: 25))
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
                        .font(.system(size: 23))
                        .padding(.leading, 15)
                        .offset(y: -10)
                }
                .padding(.top, 1.0)
            }
            .background(Color("Azul claro"))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 4))
        }
            
    }
}

/*
struct donanteRow_Previews: PreviewProvider {
    static var previews: some View {
        @State var estatus: Int = 1
        donanteRow(recibo: listaRecibos[0], donante: listaDonantes[0])
    }
}
*/
