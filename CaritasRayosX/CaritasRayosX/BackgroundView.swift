//
//  BackgroundView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        VStack(alignment: .center){
            HStack(){
                Spacer()
                
                Image("Logo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200.0)
                
                Spacer()
            }
            .background(Color("AccentColor"))
            
            Spacer()
        }
        .background(Color("AccentColor"))
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
