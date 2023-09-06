//
//  bitacora.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

struct bitacora: Codable, Identifiable{
    let comentarios, estatusPago, estatusPagoTmp, fechaCobro: String
    let fechaConfirmacion, fechaPago, fechaReprogramacion, fechaStatusPagado: String
    let fechaVisita, id, idDireccionCobro, idDonativo: String
    let idFormaPago, idNumPago, idRecibo, idRecolector: String
    let importe: Int
    let reprogramacionTelefonista, usuarioCancelacion, usuarioConfirmacion, usuarioPagadoIngresos: String
}
