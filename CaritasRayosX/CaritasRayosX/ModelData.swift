//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

var listaDonantes = cargarDato()

func cargarDato() -> Array<donante>{
    let listaDonantes = [donante(id: 1, nombre: "Eugenio", apellidoP: "Turcott"),
                         donante(id: 2, nombre: "Paty", apellidoP: "P de Pato"),
                         donante(id: 3, nombre: "Ainy", apellidoP: "Legarreta")]
    return listaDonantes
}
