//
//  DetallesView.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import SwiftUI

struct DetallesView: View {
    var donante: donante
    
    var body: some View {
        VStack{
            Text("Datos del donante")
            Text("Nombre = \(donante.nombre)")
        }
    }
}

struct DetallesView_Previews: PreviewProvider {
    static var previews: some View {
        DetallesView(donante: listaDonantes[0])
    }
}
