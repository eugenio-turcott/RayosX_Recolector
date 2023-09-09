//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    //var donante: donante
    @State private var estatus: String = ""
    var recibos: recibo

    var body: some View {
        ZStack{
            BackgroundView()
            VStack(alignment: .center){
                HStack(alignment: .top){
                    Spacer()
                    Button {
                        
                    } label: {
                        NavigationLink (destination: ListaDeRecibos()){
                            Image(systemName: "clear")
                                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .padding([.top, .trailing], 40.0)
                                .padding(.leading, 240.0)
                                .padding(.bottom, 20.0)
                                .foregroundColor(Color("Rosa"))
                        }
                        Spacer()
                    }
                }
                HStack{
                    Text(recibos.NOMBRE)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 20.0)
                    Text(recibos.A_PATERNO)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 20.0)
                    Spacer()
                }
                .padding(.horizontal, 5.0)
                .padding(.top, 10.0)
                Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Contacto:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    Spacer()
                    VStack{
                        Text(recibos.TEL_MOVIL)
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.leading)
                        Text(recibos.EMAIL)
                            .foregroundColor(Color("Gris"))
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                HStack(alignment: .top){
                    Spacer()
                    Text("Monto:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    Spacer()
                    Text(String(recibos.IMPORTE))
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0)
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                HStack{
                    Spacer()
                    Picker(selection: $estatus, label: Text("Picker")){
                        Text("No localizado").tag("No localizado")
                        Text("Pagado").tag("Pagado")
                        Text("No pagado").tag("No pagado")
                    }
                    .padding(.leading, 10.0).frame(width: 330.0, height: 50.0).pickerStyle(.segmented)
                    Spacer()
                }
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
}

struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(recibos: listaRecibos[0])
    }
}
