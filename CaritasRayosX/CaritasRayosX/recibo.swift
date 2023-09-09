//
//  recibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 07/09/23.
//

import Foundation

struct recibo: Codable, Identifiable{
    let A_PATERNO, COMENTARIOS, DIRECCION, EMAIL, ESTATUS_PAGO: String
    let ID_DIRECCION_COBRO: String
    let IMPORTE: Int
    let NOMBRE, TEL_MOVIL: String
    var id: String
}
