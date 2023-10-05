//
//  CambiarRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 28/09/23.
//

import SwiftUI

struct CambiarRecibosView: View {
    @State var listaRecolectoresV: Array<RECOLECTOR>
    //@State var cont: Int
    @State private var seleccionRecolector = 0
    @State private var seleccionRecolectorFinal = 0
    @State private var seleccionDonante = 0
    @Environment(\.dismiss) private var dismiss
    
    @State var listaRecibos: Array<RECIBOS> = []
    @State var listaDonantes: Array<DONANTES> = []
    
    var body: some View {
        
        ZStack{
            BackgroundView()
            VStack(alignment: .center){
                NavigationStack{
                    HStack(alignment: .top){
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "multiply")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .trailing], 40.0)
                                .padding(.leading, 240.0)
                                .padding(.bottom, 20.0)
                                .foregroundColor(Color("Rosa"))
                                .frame(height: 120.0)
                                
                                .onTapGesture {
                                    dismiss()
                                }
                        }
                    }
                }
                //.padding(.horizontal, 5.0)
                //.padding(.leading, 20)
                //.padding(.top, 25.0)
                Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Recolector:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                    Spacer()
                    Picker(selection: $seleccionRecolector, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        ForEach(listaRecolectoresV.indices, id: \.self){ index in
                            Text(self.listaRecolectoresV[index].NOMBRE)
                        }
                    }
                    .offset(y: -5.0)
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                //Text("index: \(seleccionRecolector)")
                
                HStack(alignment: .top){
                    Spacer()
                    Text("Donante:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                    Spacer()
                    Picker(selection: $seleccionDonante, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        ForEach(listaDonantes.indices, id: \.self){ index in
                            Text(self.listaDonantes[index].NOMBRE)
                        }
                    }
                    .offset(y: -5.0)
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                /*HStack(alignment: .top){
                    Spacer()
                    Spacer()
                    Text("Recibo:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)*/
                                
                VStack{
                    Image(systemName: "arrow.down.app.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color("AzulOscuro"))
                        .padding(.bottom, 20)
                        .frame(width: 40.0, height: 130.0)
                    
                }
                //Image(systemName: "globe")
                //Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Recolector Final:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                    Spacer()
                    Picker(selection: $seleccionRecolectorFinal, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/) {
                        ForEach(listaRecolectoresV.indices, id: \.self){ index in
                            Text(self.listaRecolectoresV[index].NOMBRE)
                        }
                    }
                    .offset(y: -5.0)
                    Spacer()
                }
                .padding(.top, 20.0)
                .padding(.bottom, 20.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                Spacer()
                
                
                Button("Cambiar Recibo"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .frame(width: 400.0)
                .tint(Color("AzulOscuro"))
                .padding(.bottom, 20.0)
                
            }
            .background(.white)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("Rosa"), lineWidth: 5))
            .padding(.top, 115.0)
            .padding(.horizontal, 10.0)
            .padding(.bottom, 20.0)
            
        }
        /*.onAppear(){
            estatus = recibo.ID_ESTATUS
            donante = traerDonante(idD: recibo.ID_DONANTE)

        }*/
        }
    }

/*
struct CambiarRecibosView_Previews: PreviewProvider {
    static var previews: some View {
        CambiarRecibosView(listaRecolectoresV: )
    }
}
*/
