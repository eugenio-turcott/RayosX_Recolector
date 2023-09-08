//
//  recibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 07/09/23.
//

import Foundation

struct recibos: Codable, Identifiable{
    var id: Int
    let aPaterno, comentarios, email, estatusPago: String
    let idDireccionCobro, idRecolector: String
    let importe: Int
    let nombre, telMovil: String
}
