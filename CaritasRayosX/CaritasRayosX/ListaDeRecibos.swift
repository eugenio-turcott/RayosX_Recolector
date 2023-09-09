//
//  ListaDeRecibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct ListaDeRecibos: View {
    //@State public var idRecolectorEnLista: String
    
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
                            .offset(y:5)
                    }

                    VStack {
                        List(listaRecibos){
                            recibosItem in
                            NavigationLink{
                                DetallesView(recibos: recibosItem)
                            }
                        label:{
                            donanteRow(recibos: recibosItem)
                        }
                        }
                        .listStyle(.inset)
                    }
                    .cornerRadius(10)
                    .padding()
                    Spacer()
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
