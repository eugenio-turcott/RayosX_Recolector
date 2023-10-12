//
//  ComentariosRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 29/09/23.
//

import SwiftUI


struct ComentariosRecibosView: View {
    //@State var listaRecibos: Array<RECIBOS> = []
    @State var listaRecibos: [RECIBOS] = []
    
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
                            HStack{
                                Text("Nombre")
                                Text("ID de recibo")
                                Text("Comentario")
                            }
                            
                            List(listaRecibos){
                                recibosItem in
                                VStack{
                                    
                                    HStack{
                                        
                                        Text(callNombreDonante(idD:recibosItem.ID_DONANTE))
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size:20))
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 10.0)
                                        
                                        Text("\(recibosItem.id)")
                                            .multilineTextAlignment(.leading)
                                            .font(.system(size:20))
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .padding(.vertical, 10.0)
                                        
                                        Spacer()
                                        
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

