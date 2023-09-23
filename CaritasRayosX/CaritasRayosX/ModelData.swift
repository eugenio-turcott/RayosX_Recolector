//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation
import UIKit

func loginVer(usuario:String, contrasenaI:String) -> Bool{
    
    guard let url = URL(string: "http://10.14.255.65:10206/crud/loginCheck?usuario=\(usuario)&password=\(contrasenaI)") else{
        print("Error en hacer crud")
        return false
    }
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        if let error = error {
            print("Error")
        }
    }
    
    
    if let data = data, let responseString = String(data: data, encoding: .utf8)
        
    //var lista: Array<RECOLECTOR> = []
    //var contrasena: String = ""
    //guard let url = URL(string: "http://10.14.255.65:10206/crud/read?usuario=\(usuario)") else{
    //    print("Error en hacer crud")
    //    return false
    //}
    
    //let group = DispatchGroup()
    //group.enter()
    
    //let task = URLSession.shared.dataTask(with: url){
    //    data, response, error in
    //
    //    let jsonDecoder = JSONDecoder()
    //    if(data != nil){
    //        do{
    //            let recolectorList = try jsonDecoder.decode([RECOLECTOR].self, from: data!)
    //            lista = recolectorList
    //            for recolector in recolectorList{
    //                contrasena = recolector.CONTRASENA
    //                print("Id: \(recolector.id) - Titulo: \(recolector.NOMBRE)")
    //            }
    //        }catch{
    //            print(error)
    //        }
    //    }
    //    group.leave()
    //}
    //task.resume()
    //group.wait()
    //
    //if lista.isEmpty {
    //    return false
    //}
    //else{
    //    if (contrasena == contrasenaI){
    //        return true
    //    }
    //    else{
    //        return false
    //    }
    //}
    
}

func RecuperarIDRecolector(usuario:String, contrasenaI:String) -> Int{
    var lista: Array<RECOLECTOR> = []
    var IDRecolector: Int = 0
    guard let url = URL(string: "http://10.14.255.65:10206/crud/read?usuario=\(usuario)") else{
        print("Error en hacer crud")
        return 0
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let recolectorList = try jsonDecoder.decode([RECOLECTOR].self, from: data!)
                lista = recolectorList
                for recolector in recolectorList{
                    IDRecolector = recolector.id
                    print("Id: \(recolector.id) - Titulo: \(recolector.NOMBRE)")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    
    return IDRecolector
    
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

func traerDonante(idD:Int) -> DONANTES{
    var listaDonantes: Array<DONANTES> = []

    var donanteF = DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0)
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readDonante?id=\(idD)") else{
        print("Error en hacer crud")
        return donanteF
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let donanteList = try jsonDecoder.decode([DONANTES].self, from: data!)
                listaDonantes = donanteList
                for donante in donanteList{
                    donanteF = donante
                    print("Id: \(donante.id) - Titulo: \(donante.NOMBRE)")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    
    return donanteF
    
}

func enviarEstatus(estatus:Int, idRecibo:Int) {
    // Crear una instancia de la estructura MyData con los datos que deseas enviar
    let datos = ObtenerEstatus(ID_ESTATUS: estatus, id: idRecibo)

    // Convertir la estructura a JSON
    do {
        let jsonData = try JSONEncoder().encode(datos)
        
        // Crear la URL del servidor
        let url = URL(string: "http://10.14.255.65:10206/crud/update") // Reemplaza con la URL correcta de tu servidor

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
