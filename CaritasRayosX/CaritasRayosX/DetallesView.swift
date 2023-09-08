//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    //var donante: donante
    
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(alignment: .center){
                HStack(alignment: .top){
                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "clear")
                            .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .padding([.top, .trailing], 40.0)
                            .padding(.leading, 240.0)
                            .padding(.bottom, 20.0)
                            .foregroundColor(Color("Rosa"))
                        Spacer()
                    }
                }
                HStack{
                    Text("Pancha Mama")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 20.0)
                    Spacer()
                    Text("Pagado")
                        .padding(5)
                        .overlay( RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Gris")))
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("Gris"))
                        .padding(.vertical, 20.0)
                    Spacer()
                }
                .padding(.horizontal, 5.0)
                .padding(.top, 10.0)
                Spacer()
                HStack(alignment: .top){
                    Spacer()
                    Text("Dirección:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    Spacer()
                    Text("Junco de la Vega, Tlaxcala, Apodaca #66634")
                        .foregroundColor(Color("Gris"))
                        .frame(width: 200.0)
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
                HStack(alignment: .top){
                    Spacer()
                    Text("Contacto:")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Azul oscuro"))
                    Spacer()
                    Text("+52 891 94 52 32 mariadrian@gmail.com")
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0)
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
                    Text("200 $")
                        .foregroundColor(Color("Gris"))
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0)
                    Spacer()
                }
                .padding(.bottom, 40.0)
                .padding(.leading, 20.0)
                .padding(.trailing, 5.0)
                
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
        DetallesView()
    }
}
