//
//  donativos.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

struct donativos: Codable, Identifiable{
    let idAsignacion, idCampanaFinanciera, idCategoria, idDonante: String
    let idEstatus, idFormaPago, idFrecuencia, idTipoFrecuencia: String
    let importe: Int
    let numFrecuencia: String
    let pagoUnico: Bool
    let uid, id: String
}
