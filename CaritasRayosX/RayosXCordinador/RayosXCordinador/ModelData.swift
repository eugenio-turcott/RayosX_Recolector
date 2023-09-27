//
//  ModelData.swift
//  RayosXCordinador
//
//  Created by Alumno on 26/09/23.
//

import Foundation
import UIKit

func callRecolectores() -> Array<RECOLECTOR>{
    var listaRecolectores: Array<RECOLECTOR> = []
    print("Entre a funcion")
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readRecolectores") else{
        return listaRecolectores
    }

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in

        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let decodeRecolectores = try jsonDecoder.decode([RECOLECTOR].self, from: data!)
                listaRecolectores = decodeRecolectores
                for recolectoresItem in decodeRecolectores{
                    print("Id: \(recolectoresItem.id) ")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    print(listaRecolectores)
    return listaRecolectores

}

func callRecibos(idR: Int) -> Array<RECIBOS>{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    print("Entre a funcion")
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readRecibo?id=\(idR)") else{
        return listaRecibos
    }

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in

        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let decodeRecibos = try jsonDecoder.decode([RECIBOS].self, from: data!)
                listaRecibos = decodeRecibos
                for recibosItem in decodeRecibos{
                    print("Id: \(recibosItem.id) ")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    print(listaRecibos)
    return listaRecibos

}
