//
//  recibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 07/09/23.
//

import Foundation

struct RECIBOS: Codable, Identifiable{
    let COMENTARIOS, DIRECCION_COBRO, FECHA_COBRO: String
    let ID_DONANTE, ID_ESTATUS: Int
    let ID_RECOLECTOR: Int
    let IMPORTE: Float
    let LATITUD, LONGITUD: Double
    let id: Int
}
