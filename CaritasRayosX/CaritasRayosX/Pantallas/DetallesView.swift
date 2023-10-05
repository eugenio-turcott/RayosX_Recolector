//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    @State private var estatus: Int = 1
    @State var recibo: RECIBOS
    @State var donante: DONANTES
    @State private var isValid = false
    @State private var texto : String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack(alignment: .center){
                
                HStack { //Nombre
                    Text(donante.NOMBRE + " " + donante.A_PATERNO)
                        .font(.system(size: 35))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                }
                .padding(.top, 50.0)
                .padding(.bottom, 20.0)
                .padding(.horizontal, 10.0)
                
                
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
                        .bold()
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 150.0)
                }
                .padding(.bottom, 30.0)
                .padding(.horizontal, 30.0)
                
                
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
                            .font(.system(size: 20))
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 180)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal, 20.0)
                .padding(.bottom, 70.0)
                
                
                
                
                
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
                            Text("Cobrado").tag(1)
                            Text("No cobrado").tag(2)
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
                    TextField("", text: $texto, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 275.0)
                        .font(.system(size: 22))
                        .onChange(of: texto) {value in
                            
                        }
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color.black, lineWidth: 0.35))
                }
                .onAppear(){
                    texto = recibo.COMENTARIOS
                }
                
                .padding(.bottom, 30.0)
                .padding(.horizontal, 30.0)
                
                
                
                
                NavigationStack{
                    HStack(alignment: .top){
                        Button{}
                        label: {
                            Text("Actualizar")
                                .padding(20)
                                .frame(width: 330.0, height: 70.0)
                                .font(.headline)
                                .background(Color("Azul oscuro"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal, 20.0)
                                .padding(.bottom, 20.0)
                                .onTapGesture {
                                    self.isValid = validate()
                                    if self.isValid {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
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
