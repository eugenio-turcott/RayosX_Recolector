//
//  recibos.swift
//  CaritasRayosX
//
//  Created by Alumno on 07/09/23.
//

import Foundation

struct recibos: Codable, Identifiable{
    let id: Int
    
    let IMPORTE, ESTATUS_PAGO: Int
    let COMENTARIOS: String
    let ID_DIRECCION_COBRO: Int
    let NOMBRE, A_PATERNO, EMAIL: String
    let TEL_MOVIL: Int
}
