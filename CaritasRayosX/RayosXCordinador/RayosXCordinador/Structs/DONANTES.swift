//
//  DONANTES.swift
//  RayosXCordinador
//
//  Created by Alumno on 28/09/23.
//

import Foundation

struct DONANTES: Codable, Identifiable{
    let A_MATERNO, A_PATERNO, EMAIL, FECHA_NAC, NOMBRE, TELEFONO: String
    let id: Int
}
