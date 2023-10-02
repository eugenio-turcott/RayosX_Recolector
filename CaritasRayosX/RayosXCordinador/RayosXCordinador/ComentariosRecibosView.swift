//
//  ComentariosRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 29/09/23.
//

import SwiftUI

struct ComentariosRecibosView: View {
    @State var listaRecibos: Array<RECIBOS> = []
    
    var body: some View {
        List(listaRecibos){
            recibosItem in
            ZStack {
                HStack {
                    Color("AccentColor")
                }
                .frame(width: 310.0, height: 80.0)
                .cornerRadius(20)
                .offset(y: 6)
                VStack{
                    HStack{
                        HStack{
                            Text(callNombreDonante(idD:recibosItem.ID_DONANTE))
                                .multilineTextAlignment(.leading)
                                .font(.system(size:20))
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical, 10.0)
                        }
                        Spacer()
                        HStack{
                            Text("\(recibosItem.id)")
                                .multilineTextAlignment(.leading)
                                .font(.system(size:20))
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical, 10.0)
                        }
                    }
                    HStack{
                        Text("\(recibosItem.COMENTARIOS)")
                            .multilineTextAlignment(.trailing)
                            .font(.system(size:20))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .overlay( RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 3))
                .cornerRadius(20)
                .padding(.vertical, 10.0)
                /*Text(callNombreDonante(idD:recibosItem.ID_DONANTE))
                 Text("\(recibosItem.id)")
                 Text("\(recibosItem.COMENTARIOS)")*/
            }
        }
    }
}


struct ComentariosRecibosView_Previews: PreviewProvider {
    static var previews: some View {
        ComentariosRecibosView()
    }
}

