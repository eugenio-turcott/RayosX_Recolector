//
//  RECIBOS.swift
//  RayosXCordinador
//
//  Created by Alumno on 26/09/23.
//

import Foundation

struct RECIBOS: Codable, Identifiable{
    let COMENTARIOS, DIRECCION_COBRO, FECHA_COBRO: String
    let ID_DONANTE, ID_ESTATUS: Int
    let ID_RECOLECTOR: Int
    let IMPORTE: Float
    let id: Int
}
