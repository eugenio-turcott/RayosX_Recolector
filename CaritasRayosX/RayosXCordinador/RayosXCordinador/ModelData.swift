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

    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecolectores") else{
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
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecibo?id=\(idR)") else{
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
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecibo?id=\(idR)") else{
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
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecibosNoCobrados?id=\(idR)") else{
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
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readNombreDonante?id=\(idD)") else{
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


func enviarRecolector(idNuevo: Int, idRecibo: Int) {
    // Crear una instancia de la estructura MyData con los datos que deseas enviar
    let datos = ObtenerRecolector(ID_RECOLECTOR: idNuevo, id: idRecibo)

    // Convertir la estructura a JSON
    do {
        let jsonData = try JSONEncoder().encode(datos)
        
        // Crear la URL del servidor
        let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/updateRecolector") // Reemplaza con la URL correcta de tu servidor

        // Crear una solicitud HTTP POST
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Realizar la solicitud HTTP
        let group = DispatchGroup()
        group.enter()
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error al enviar los datos al servidor: \(error)")
            } else if let data = data {
                // Procesar la respuesta del servidor si es necesario
                let respuesta = String(data: data, encoding: .utf8)
                print("Respuesta del servidor: \(respuesta ?? "N/A")")
            }
            group.leave()

        }
        
        task.resume()
        group.wait()

    } catch {
        print("Error al codificar los datos como JSON: \(error)")
    }
}
