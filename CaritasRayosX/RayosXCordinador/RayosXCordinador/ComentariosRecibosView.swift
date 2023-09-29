//
//  ComentariosRecibosView.swift
//  RayosXCordinador
//
//  Created by Alumno on 29/09/23.
//

import SwiftUI

struct ComentariosRecibosView: View {
    @State var listaRecibos: Array<RECIBOS> = []
    
    var body: some View {
        List(listaRecibos){
            recibosItem in
            Text(callNombreDonante(idD:recibosItem.ID_DONANTE))
            Text("\(recibosItem.id)")
            Text("\(recibosItem.COMENTARIOS)")
        }
    }
}


struct ComentariosRecibosView_Previews: PreviewProvider {
    static var previews: some View {
        ComentariosRecibosView()
    }
}

