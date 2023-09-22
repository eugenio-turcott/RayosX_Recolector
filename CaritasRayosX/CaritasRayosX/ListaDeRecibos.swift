//
//  ListaDeRecibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

//
//Llamar a callRecibos(idrecolector)
//

import SwiftUI

struct ListaDeRecibos: View {
    //@State public var idRecolectorEnLista: String
        
    @State private var listaRecibos: Array<RECIBOS> = []
    
    var body: some View {
        NavigationStack{
            ZStack {
                BackgroundView()
                VStack {
                    HStack {
                        Text("Recibos")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
    //                        .padding(.leading, 30.0)
    //                        .padding(.top, 10.0)
    //                        .padding(.horizontal,70)
                            //.offset(y:5)
                    }
                    Spacer()
                    VStack {
                        List(listaRecibos){
                            recibosItem in
                            NavigationLink{
                                DetallesView(recibo: recibosItem, donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))
                            }
                        label:{
                            donanteRow(recibo: recibosItem, donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))
                        }
                        }
                        .listStyle(.inset)
                    }
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Rosa"), lineWidth: 5))
                    .padding()
                    Spacer()
                    Spacer()
                }
                .onAppear(){
                    
                    
                    listaRecibos = callRecibos(idR: UserDefaults.standard.integer(forKey:"idR"))
                }
                .background(Color(red: 0/255, green: 156/255, blue: 166/255))
            }
        }
    }
}

struct ListaDeRecibos_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeRecibos()
    }
}
