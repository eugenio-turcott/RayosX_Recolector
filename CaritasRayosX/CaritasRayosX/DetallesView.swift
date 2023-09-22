//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    //var donante: donante
    @State private var estatus: Int = 0
    var recibo: RECIBOS
    @State var donante: DONANTES
    @Environment(\.dismiss) private var dismiss
    @State private var isValid = false

    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack(alignment: .center){
                NavigationStack{
                HStack(alignment: .top){
                    Spacer()
                    
                    /*NavigationLink(destination: ListaDeRecibos()){
                        Image(systemName: "xmark")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50.0)
                            .padding(.trailing, 30)
                            .padding(.top, 15)
                    }
                    Button ("Cerrar"){
                        enviarEstatus(estatus: estatus, idR: recibo.id)
                       //dismiss()

                    }
                    
                   
                        
                    NavigationLink (destination: ListaDeRecibos()){
                            Image(systemName: "clear")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .trailing], 40.0)
                                .padding(.leading, 240.0)
                                .padding(.bottom, 20.0)
                                .foregroundColor(Color("Rosa"))
                    }*/
                    
                    Button("Iniciar Sesión") {
                        self.isValid = validate()
                    }
                    .background( //mandar recuperarIDRecolector en listarecibos()
                        
                        NavigationLink(destination: ListaDeRecibos(), isActive: $isValid) {
                            
                        }
                    )
                    


                    
                        
                    
                }
            }
                HStack{ //Nombre
                    Spacer()
                    Text(donante.NOMBRE)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 30.0)
                    Text(donante.A_PATERNO)//apellido
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 7.0)
                    Spacer()
                    Spacer()
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
                .onAppear(){
                    donante = traerDonante(idD: recibo.ID_DONANTE)
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
                        Text("No localizado").tag(3)
                        Text("Pagado").tag(2)
                        Text("No pagado").tag(1)
                    }
                    .padding(.leading, 10.0).frame(width: 330.0, height: 50.0).pickerStyle(.segmented)
                    Spacer()
                }
                .onAppear(){
                    estatus = recibo.ID_ESTATUS
                    
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
        
    }
    
    private func validate() -> Bool {
        
        print("------------ antes de ENVIAR ESTATUS \(estatus) - \(recibo.id)")
        enviarEstatus(estatus: estatus, idR: recibo.id)
        print("------------ despues de ENVIAR ESTATUS")
        return true
    }
    
}
/*
struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(recibos: listaRecibos[0])
    }
}*/
