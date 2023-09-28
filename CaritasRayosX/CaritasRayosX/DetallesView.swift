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
    @State private var texto = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            HStack {
                Image("logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    
            }
            .frame(width: 205.0)
            .padding(.top, -410.0)
            
            VStack(alignment: .center){
                NavigationStack{
                    HStack(alignment: .top){
                        Button(action: {}) {
                            Image(systemName: "multiply")
                            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("Rosa"))
                            .frame(width: 75.0)
                            .padding(.top, 25.0)
                            .padding(.leading, 200.0)
                            .onTapGesture {
                                self.isValid = validate()
                                if self.isValid {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }
                HStack { //Nombre
                    Text(donante.NOMBRE + " " + donante.A_PATERNO)
                        .font(.system(size: 35))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                }
                .padding(.top, 15.0)
                .padding(.bottom, 20.0)
                .padding(.horizontal, 10.0)
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("Contacto:")
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    VStack{
                        Text(donante.TELEFONO)//telefono
                            .font(.system(size: 25))
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 180)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal, 20.0)
                
                HStack(alignment: .top) {
                    Text(donante.EMAIL)//correo
                        .font(.system(size: 18))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 286)
                }
                .padding(.bottom, 15.0)
                
                HStack(alignment: .center) {
                    Spacer()
                    Text("Monto:")
                        .font(.system(size: 23))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 5)
                    Spacer()
                    Text("$" + String(recibo.IMPORTE))
                        .font(.system(size: 25))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 150.0)
                }
                .padding(.bottom, 30.0)
                .padding(.horizontal, 30.0)
                
                ZStack{
                    Spacer()
                    HStack {
                        if (estatus == 1) {
                            Color(red: 64/255, green: 146/255, blue: 97/255)
                        } else if (estatus == 2) {
                            Color(red: 235/255, green: 87/255, blue: 87/255)
                        } else {
                            Color(red: 10/255, green: 10/255, blue: 10/255)
                        }
                    }
                    .frame(width: 290.0, height: 45.0)
                    .cornerRadius(10)
                    HStack {
                        Picker(selection: $estatus, label: Text("Picker")){
                            Text("Pagado").tag(1)
                            Text("No pagado").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 275.0, height: 30.0)
                        .background(RoundedRectangle(cornerRadius: 5.0).fill(Color.white))
                    }
                    Spacer()
                }
                Spacer()
                Spacer()
                
                VStack(alignment: .center){
                    Text("Comentarios:")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    TextField("", text: $texto)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 275.0)
                        .onChange(of: texto) {value in
                            
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                }
                .padding(.bottom, 30.0)
                .padding(.horizontal, 30.0)
            }
            .background(.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Rosa"), lineWidth: 5))
            .padding(.top, 65.0)
            .padding(.horizontal, 20.0)
            .padding(.bottom, 125.0)
            
        }
        .background(Color(red: 17/255, green: 151/255, blue: 165/255))
        .onAppear(){
            estatus = recibo.ID_ESTATUS
            donante = traerDonante(idD: recibo.ID_DONANTE)
        }
    }
    
        
    
    private func validate() -> Bool {
        enviarEstatus(estatus: estatus, idRecibo: recibo.id)
        enviarComentarios(comentarios: texto, idRecibo: recibo.id)
        return true
    }
    
}

struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(recibo: listaRecibos[0], donante: listaDonantes[0])
    }
}
