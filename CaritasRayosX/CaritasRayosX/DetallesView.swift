//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    @State private var estatus: Int = 0
    @State var recibo: RECIBOS
    @State var donante: DONANTES
    @State private var isValid = false
    @Environment(\.presentationMode) var presentationMode

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
                                .padding([.top, .trailing], 50.0)
                                .padding(.leading, 240.0)
                                .padding(.bottom, 20.0)
                                .foregroundColor(Color("Rosa"))
                                .onTapGesture {
                                    self.isValid = validate()
                                    if self.isValid {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                }
                        }
                    }
                }
                HStack{ //Nombre
                    Text(donante.NOMBRE)
                        .font(.custom("Trebuchet MS", size: 33).weight(.heavy))
                        .foregroundColor(Color("Azul oscuro"))
                    Text(donante.A_PATERNO)//apellido
                        .font(.custom("Trebuchet MS", size: 33).weight(.heavy))
                        .foregroundColor(Color("Azul oscuro"))
                }
                .padding(.top, 25.0)
                .padding(.bottom, 20.0)
                
                Spacer()
                
                HStack(alignment: .center){
                    Spacer()
                    Text("Contacto:")
                        .font(.custom("Trebuchet MS", size: 23).weight(.bold))
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    VStack{
                        Text(donante.TELEFONO)//telefono
                            .font(.custom("Trebuchet MS", size: 25))
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 180)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal, 30.0)
                HStack(alignment: .top) {
                    Text(donante.EMAIL)//correo
                        .font(.custom("Trebuchet MS", size: 18))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 286)
                }
                .padding(.bottom, 15.0)
                
                HStack(alignment: .center){
                    Spacer()
                    Text("Monto:")
                        .font(.custom("Trebuchet MS", size: 23).weight(.bold))
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    Text("$" + String(recibo.IMPORTE))
                        .font(.custom("Trebuchet MS", size: 25))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 150.0)
                }
                .padding(.bottom, 30.0)
                .padding(.horizontal, 30.0)
                
                HStack{
                    Spacer()
                    Picker(selection: $estatus, label: Text("Picker")){
                        Text("Pagado").tag(1)
                        Text("No pagado").tag(2)
                    }
                    .padding(.leading, 10.0).frame(width: 330.0, height: 50.0).pickerStyle(.segmented)
                    Spacer()
                }
                
                Spacer()
                Spacer()
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
        .onAppear(){
            estatus = recibo.ID_ESTATUS
            donante = traerDonante(idD: recibo.ID_DONANTE)

        }
        
    }
    
    private func validate() -> Bool {
        enviarEstatus(estatus: estatus, idRecibo: recibo.id)
        return true
    }
    
}

/*struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(recibo: listaRecibos[0], donante: listaDonantes[0])
    }
}*/
