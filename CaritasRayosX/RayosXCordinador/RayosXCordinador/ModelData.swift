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
                for recolectoresItem in listaRecolectores{/*
                    recibosHechos=callRecibosHechos(idR: recolectoresItem.id)
                    recibosTotales=callRecibosTotales(idR: recolectoresItem.id)

                    if recibosHechos == 0{
                        color1="Rojo"
                        color2="RojoOpaco"

                    }
                    else if recibosHechos == recibosTotales{
                        color1="Verde"
                        color2="VerdeOpaco"

                    }
                    else{
                        color1="Amarillo"
                        color2="AmarilloOpaco"

                    }
                    listaRecolectores2[contador] = RECOLECTORcolor(recolector: listaRecolectores[contador], color1: color1, color2:color2)
                    contador+=1*/
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


func callRecibosHechos(idR: Int) -> Int{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Int = 0
    print("Entre a funcion")
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
                    print("Id: \(idR) - Titulo: \(cant)")
                    if recibosItem.ID_ESTATUS==1{
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
    print(listaRecibos)
    return cant

}

func callRecibosTotales(idR: Int) -> Int{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Int = 0
    print("Entre a funcion")
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
    print(listaRecibos)
    return cant

}

