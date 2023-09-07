//
//  donante.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

struct recolector: Codable, Identifiable{ // RECOLECTORES!!!
    let ACTIVO: Int
    let CONTRASENA: String
    let ID_TIPO_RECOLECTOR, ID_ZONA, ID_ZONA_2, INDICE: Int
    let NOMBRE, id: String
}
