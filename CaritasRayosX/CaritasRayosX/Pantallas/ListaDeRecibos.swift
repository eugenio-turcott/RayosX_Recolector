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
                BackgroundView()
                
                VStack{
                    NavigationLink (destination: sesionView(cambio: $cambio, recibo: RECIBOS(COMENTARIOS: "", DIRECCION_COBRO: "", FECHA_COBRO: "", ID_DONANTE: 0, ID_ESTATUS: 0, ID_RECOLECTOR: 0, IMPORTE: 0.0, LATITUD: 0.0, LONGITUD: 0.0, id: 0), donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))){
                        Image("sesion")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50.0, height: 50.0)
                    }
                    .toolbar(.hidden)
                    .onChange(of: cambio){ value in
                        self.presentationMode.wrappedValue.dismiss()

                    }
                    
                    
                }
                .foregroundColor(.white)
                .padding(.top, -380.0)
                .padding(.leading, 270)
                
                
                VStack(alignment: .center) {
                    

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
                                    .toolbar(.hidden)
                            }
                            label:{
                                donanteRow(recibo: recibosItem, donante: DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0))
                                    .toolbar(.hidden)
                            
                        }
                        .padding(.top, -5.0)
                        .listStyle(.inset)

                    }
                    
                }
                .padding(.bottom, 30.0)
                .onAppear(){
                    listaRecibos = callRecibos(idR: UserDefaults.standard.integer(forKey:"idR"))
                }
                Spacer()
                
                }
                .background(.white)
                .cornerRadius(35)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color("Rosa"), lineWidth: 4))
                .padding(.top, 110.0)
                .padding(.horizontal, 20.0)
                      
                    
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
