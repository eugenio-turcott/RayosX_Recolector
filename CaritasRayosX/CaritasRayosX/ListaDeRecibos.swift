//
//  ListaDeRecibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct ListaDeRecibos: View {
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Spacer()
                }
                VStack {
//                    List(listaDonantes){
//                        donanteItem in
//                        NavigationLink{
//                            DetallesView(donante: donanteItem)
//                        }
//                    label:{
//                        donanteRow(donante: donanteItem)
//                    }
//                    }
//                    .listStyle(.inset)
                }
                .cornerRadius(10)
                .padding()
                Spacer()
            }
            .background(Color(red: 0/255, green: 156/255, blue: 166/255))
        }
    }
}

struct ListaDeRecibos_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeRecibos()
    }
}
