//
//  CambiarRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 05/10/23.
//

import SwiftUI

struct CambiarRecibosView: View {
    @State var listaRecolectoresV: Array<RECOLECTOR>
    //@State var cont: Int
    @State private var seleccionRecolector = -1
    @State private var seleccionRecolectorFinal = -1
    @State private var seleccionDonante = 0
    @State private var seleccionid = -1
    @State private var showAlert = false
    @State private var showAlert2 = false

    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
        
    @State var listaRecibos: Array<RECIBOS> = []
    @State var listaDonantes: Array<DONANTES> = []
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack{
                Button(action: {}){
                    HStack{
                        Image(systemName: "arrowshape.turn.up.backward.2")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                        Text("Atrás")
                            .font(.title3)
                        
                    }
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                
            }
            .foregroundColor(.white)
            .padding(.top, -380.0)
            .padding(.leading, -170)
            
            VStack(alignment: .center){
                Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Recolector:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                        Spacer()
                        Picker(selection: $seleccionRecolector, label: Text("Recolector")) {
                            Text("").tag(-1)
                            ForEach(listaRecolectoresV.indices, id: \.self){ index in
                                Text(self.listaRecolectoresV[index].NOMBRE)
                            }
                        }
                        .offset(y: -5.0)
                        .cornerRadius(10)
                        .font(.system(size: 22))
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                        Spacer()
                    }
                    .padding(.bottom, 40.0)
                    .padding(.leading, 20.0)
                    .padding(.trailing, 5.0)
                    .onChange(of: seleccionRecolector) { newValue in
                        // Llama a la función para actualizar la lista de donantes
                        listaRecibos = callRecibosNoCobrados(idR: listaRecolectoresV[newValue].id)
                    }
                HStack(alignment: .top){
                    Spacer()
                    Text("ID de recibo:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                    Spacer()
                    Picker(selection: $seleccionid, label: Text("ID")) {
                        Text("").tag(-1)

                        ForEach(listaRecibos.indices, id: \.self){ index in
                            Text("\(self.listaRecibos[index].id)")
                        }
                    }
                    .offset(y: -5.0)
                    .cornerRadius(10)
                    .font(.system(size: 22))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                VStack{
                    Image(systemName: "arrow.down.app.fill")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color("AzulOscuro"))
                        .padding(.bottom, 20)
                        .frame(width: 40.0, height: 130.0)
                }
                HStack(alignment: .top){
                    Spacer()
                    Text("Recolector Final:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("AzulOscuro"))
                    Spacer()
                    Picker(selection: $seleccionRecolectorFinal, label: Text("Picker")) {
                        Text("").tag(-1)
                        ForEach(listaRecolectoresV.indices, id: \.self){ index in
                            Text(self.listaRecolectoresV[index].NOMBRE)
                        }
                    }
                    .offset(y: -5.0)
                    .cornerRadius(10)
                    .font(.system(size: 22))
                    .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                    Spacer()
                }
                .padding(.top, 20.0)
                .padding(.bottom, 20.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                Spacer()
                    
                Button {
                    
                }
                label: {
                    Text("Cambiar Recibo")
                        .buttonStyle(.borderedProminent)
                        .frame(width: 400.0)
                        .tint(Color("AzulOscuro"))
                        .padding(.bottom, 20.0)
                        .onTapGesture {
                            if seleccionRecolector == -1 || seleccionRecolectorFinal == -1 || seleccionid == 0{
                                showAlert.toggle()
                            }
                            else if listaRecibos.isEmpty{
                                showAlert2.toggle()
                            }
                            else{
                                enviarRecolector(idNuevo: listaRecolectoresV[seleccionRecolectorFinal].id, idRecibo: listaRecibos[seleccionid].id)
                                dismiss()
                            }
                        }

                }
                    
                }
                .background(.white)
                .cornerRadius(35)
                .overlay(RoundedRectangle(cornerRadius: 35).stroke(Color("Rosa"), lineWidth: 4))
                .padding(.top, 110.0)
                .padding(.horizontal, 90.0)
            }
            .background(Color(red: 17/255, green: 151/255, blue: 165/255))
            .alert("Tienes que ingresar todos los datos", isPresented: $showAlert){ }
            .alert("El recolector no tiene recibos", isPresented: $showAlert2){ }

        }
}

struct CambiarRecibosView_Previews: PreviewProvider {
    static var previews: some View {
        CambiarRecibosView(listaRecolectoresV: callRecolectores())
    }
}
