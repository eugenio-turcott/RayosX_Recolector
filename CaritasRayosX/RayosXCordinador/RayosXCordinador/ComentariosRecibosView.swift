//
//  ComentariosRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 29/09/23.
//

import SwiftUI

struct Elem: Codable, Identifiable{
    let id: Int
    let nombre: String
    let id_recibo: Int
    let comentario: String
}


struct ComentariosRecibosView: View {
    //@State var listaRecibos: Array<RECIBOS> = []
    @State var listaRecibos: [RECIBOS] = [
        RECIBOS(COMENTARIOS: "a", DIRECCION_COBRO: "b", FECHA_COBRO: "c", ID_DONANTE: 1, ID_ESTATUS: 2, ID_RECOLECTOR: 3, IMPORTE: 2.2, id:1),
        RECIBOS(COMENTARIOS: "a", DIRECCION_COBRO: "b", FECHA_COBRO: "c", ID_DONANTE: 4, ID_ESTATUS: 5, ID_RECOLECTOR: 6, IMPORTE: 2.2, id:2)
    ]
    
    // Nombre recolector, ID recibo, Comentario
    @State var nombres: [Elem] = [
        Elem(id: 1, nombre: "Roberta", id_recibo: 1, comentario: "Estaba enferma"),
        Elem(id: 2, nombre: "Roberto", id_recibo: 2, comentario: "No tenía dinero"),
        Elem(id: 3, nombre: "Roberti", id_recibo: 3, comentario: "Estaba enferma"),
    ]
    
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack(alignment: .center){
                HStack(alignment: .top){
                    
                }
                Spacer()
                VStack(alignment: .center) {
                    HStack {
                        Text("Comentarios de recibos no pagados")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("AzulOscuro"))
                            .padding()
                    }
                    ZStack{
                        VStack{
                            
                            List(nombres){
                                nombresItem in
                                VStack{
                                    HStack{
                                        Text(nombresItem.nombre)
                                        Text(nombresItem.comentario)
                                    }
                                }
                            }
                            
                            
                            /*
                            List(listaRecibos){
                                recibosItem in
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
                            }
                            */
                        }
                    }
                    
                }
                
            }
            .background(.white)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 5))
            .padding(.top, 130.0)
            .padding(.horizontal, 20.0)
            .padding(.bottom, 10.0)
            
            
        }
    }
}


struct ComentariosRecibosView_Previews: PreviewProvider {
    static var previews: some View {
        ComentariosRecibosView()
    }
}

