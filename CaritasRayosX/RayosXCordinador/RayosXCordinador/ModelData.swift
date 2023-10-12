//
//  ModelData.swift
//  RayosXCordinador
//
//  Created by Alumno on 26/09/23.
//

import Foundation
import UIKit
func callRecolectores() -> Array<RECOLECTOR> {
    var listaRecolectores: Array<RECOLECTOR> = []

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
                
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return listaRecolectores

}


func callRecibosHechos(idR: Int) -> Int{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Int = 0
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readRecibo?id=\(idR)") else{
        return cant
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
                for recibosItem in listaRecibos{
                    if recibosItem.ID_ESTATUS==1 || recibosItem.ID_ESTATUS==2{
                        cant+=1
                    }
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return cant

}

func callRecibosTotales(idR: Int) -> Int{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Int = 0
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readRecibo?id=\(idR)") else{
        return cant
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
                for _ in listaRecibos{
                    cant+=1
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return cant

}


func callRecibosNoCobrados(idR: Int) -> Array<RECIBOS>{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readRecibosNoCobrados?id=\(idR)") else{
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
                
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return listaRecibos

}



func callNombreDonante(idD: Int) -> String{ //recibir como input idrecolector
    var listaDonantes: Array<DONANTES> = []
    var nombre: String=""
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readNombreDonante?id=\(idD)") else{
        return nombre
    }

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in

        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let decodeRecibos = try jsonDecoder.decode([DONANTES].self, from: data!)
                listaDonantes = decodeRecibos
                for donante in listaDonantes{
                    nombre=donante.NOMBRE
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return nombre

}

