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
                                .padding([.top, .trailing], 40.0)
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
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                    Text(donante.A_PATERNO)//apellido
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                }
                //.padding(.horizontal, 5.0)
                //.padding(.leading, 20)
                .padding(.top, 25.0)
                Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Contacto:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    Spacer()
                    VStack{
                        Text(donante.TELEFONO)//telefono
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.leading)
                        Text(donante.EMAIL)//correo
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.leading)
                            .frame(width: 120)
                    }
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                HStack(alignment: .top){
                    Spacer()
                    Spacer()
                    Text("Monto:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    Text(String(recibo.IMPORTE))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 180.0)
                    Spacer()
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
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

struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(recibo: listaRecibos[0], donante: listaDonantes[0])
    }
}
