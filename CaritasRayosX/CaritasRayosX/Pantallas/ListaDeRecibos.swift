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
    @State private var listaRecibos: Array<RECIBOS> = []
    @State var estatus: Int = 0
    let fechaActual = Date()
    @State var cambio: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                HStack{
                    HStack {
                        Image("logo")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                        
                        NavigationLink (destination: sesionView(cambio: $cambio)){
                            Image("sesion")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50.0, height: 50.0)
                        }
                        .onChange(of: cambio){ value in
                            self.presentationMode.wrappedValue.dismiss()

                        }
                                
                        
                    }
                    .frame(width: 205.0)
                    .padding(.top, -380.0)
                   
                }
                
                VStack {
                    HStack {
                    }
                    .padding(.bottom, 45.0)
                    VStack {
                        HStack {
                            Text("Recibos")
                                .font(.system(size: 40))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("Azul oscuro"))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 15.0)
                        
                        
                        List(listaRecibos){
                            recibosItem in
                            NavigationLink{
                                DetallesView(recibo: recibosItem, donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))
                            }
                            label:{
                                donanteRow(recibo: recibosItem, donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))
                        }
                    }
                    .padding(.top, -5.0)
                    .listStyle(.inset)
                }
                .background(.white)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("Rosa"), lineWidth: 5))
                .padding(.top, 30.0)
                .padding(.horizontal, 20.0)
                .padding(.bottom, 10.0)
            }
            .onAppear(){
                listaRecibos = callRecibos(idR: UserDefaults.standard.integer(forKey:"idR"))
            }
            }
            .background(Color(red: 17/255, green: 151/255, blue: 165/255))
        }
    }
    
    func formatearFecha(fechaBase: Date) -> String {
        let formato = DateFormatter()
            formato.timeStyle = DateFormatter.Style.none
            formato.dateFormat = "dd / MMMM / YYYY"
            formato.locale = Locale(identifier: "es_MX")
            
            let fechaString = formato.string(from: fechaBase)
            return fechaString
    }
}

struct ListaDeRecibos_Previews: PreviewProvider {
    static var previews: some View {
        ListaDeRecibos()
    }
}
