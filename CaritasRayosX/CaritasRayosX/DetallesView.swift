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
                HStack{
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("X")
                            .font(.custom("", size: 60.0))
                            .fontWeight(.bold)
                            .foregroundColor(Color("AccentColor"))
                            .padding([.top, .trailing], 40.0)
                    }
                }
                HStack{
                    Text("Pancha mama")
                        .font(.largeTitle)
                        .foregroundColor(Color("Azul oscuro"))
                        .padding(.leading, 20.0)
                    Spacer()
                    Text("Pagado")
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Text("Dirección:")
                    Spacer()
                    Text("Junco de la vega, Tlaxcala, Apodaca #66634")
                        .frame(width: 200.0)
                    Spacer()
                }
                Spacer()
                Spacer()
            }
            .background(.white)
            .cornerRadius(30)
            .padding(.top, 130.0)
            .padding(.horizontal, 20.0)
            .padding(.bottom, 70.0)
        }
        
    }
}

struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView()
    }
}
