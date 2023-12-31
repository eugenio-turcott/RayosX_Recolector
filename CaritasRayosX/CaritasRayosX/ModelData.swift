//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation
import UIKit

func loginVer(usuario:String, contrasenaI:String) -> Bool{
    var res2: Bool = false

    guard let url = URL(string:"https://equipo01.tc2007b.tec.mx:10206/crud/loginCheck?usuario=\(usuario)&password=\(contrasenaI)") else{
        return false
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let res = String(decoding:data!, as:UTF8.self)

                if res == "\"yes\"\n"{
                    res2=true
                }
                else{
                    res2=false
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return res2
    
    
}

func RecuperarIDRecolector(usuario:String, contrasenaI:String) -> Int{
    var lista: Array<RECOLECTOR> = []
    var IDRecolector: Int = 0
    guard let url = URL(string:"https://equipo01.tc2007b.tec.mx:10206/crud/read?usuario=\(usuario)") else{
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

var listaRecibos = callAllRecibos()

func callAllRecibos() -> Array<RECIBOS>{
    var lista: Array<RECIBOS> = []
    
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecibos")
    else {
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil) {
            do{
                let reciboList = try jsonDecoder.decode([RECIBOS].self, from: data!)
                lista = reciboList
            } catch {
                print(error)
            }
            
        }
        group.leave()
    }
    task.resume()
    
    group.wait()
    
    return lista
}

var listaDonantes = callAllDonantes()

func callAllDonantes() -> Array<DONANTES>{
    var lista: Array<DONANTES> = []
    
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readDonantes")
    else {
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil) {
            do{
                let donanteList = try jsonDecoder.decode([DONANTES].self, from: data!)
                lista = donanteList
            } catch {
                print(error)
            }
            
        }
        group.leave()
    }
    task.resume()
    
    group.wait()
    
    return lista
}

func callRecibos(idR: Int) -> Array<RECIBOS>{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readRecibo?id=\(idR)") else{
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

func traerDonante(idD:Int) -> DONANTES{
    var listaDonantes: Array<DONANTES> = []
    var donanteF = DONANTES(A_MATERNO: "", A_PATERNO: "", EMAIL: "", FECHA_NAC: "", NOMBRE: "", TELEFONO: "", id: 0)
    guard let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/readDonante?id=\(idD)") else{
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
        let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/updateEstatus") // Reemplaza con la URL correcta de tu servidor

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

func enviarComentarios(comentarios: String, idRecibo: Int) {
    // Crear una instancia de la estructura MyData con los datos que deseas enviar
    let datos = ObtenerComentarios(COMENTARIOS: comentarios, id: idRecibo)

    // Convertir la estructura a JSON
    do {
        let jsonData = try JSONEncoder().encode(datos)
        
        // Crear la URL del servidor
        let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/updateComentarios") // Reemplaza con la URL correcta de tu servidor

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

func enviarUsuario(usuario: String, idRecolector: Int) {
    // Crear una instancia de la estructura MyData con los datos que deseas enviar
    let datos = ObtenerUsuario(USUARIO: usuario, id: idRecolector)

    // Convertir la estructura a JSON
    do {
        let jsonData = try JSONEncoder().encode(datos)
        
        // Crear la URL del servidor
        let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/updateUsuario") // Reemplaza con la URL correcta de tu servidor

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

func enviarContrasena(contrasena: String, idRecolector: Int) {
    // Crear una instancia de la estructura MyData con los datos que deseas enviar
    let datos = ObtenerContrasena(CONTRASENA: contrasena, id: idRecolector)

    // Convertir la estructura a JSON
    do {
        let jsonData = try JSONEncoder().encode(datos)
        
        // Crear la URL del servidor
        let url = URL(string: "https://equipo01.tc2007b.tec.mx:10206/crud/updateContrasena") // Reemplaza con la URL correcta de tu servidor

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

func callRecibosHechos(idR: Int) -> Double{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Double = 0
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

func callRecibosTotales(idR: Int) -> Double{ //recibir como input idrecolector
    var listaRecibos: Array<RECIBOS> = []
    var cant: Double = 0
    guard let url = URL(string:"https://equipo01.tc2007b.tec.mx:10206/crud/readRecibo?id=\(idR)") else{
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

extension String {
    func removeAccents() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .current)
    }
}

func callLocation(direccion: String, completion: @escaping (LOCATION) -> Void) {
  
    var formattedAddress = direccion.removeAccents()
    var finalAddress = formattedAddress.replacingOccurrences(of: " ", with: "%20")
    
    var string1 = "https://equipo01.tc2007b.tec.mx:10206/servicioGoogle?DIRECCION_COBRO=\(finalAddress)"
    
    guard let url = URL(string: string1)
    else {
        print("No funciona")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if (data != nil) {
            do{
                let postItem = try jsonDecoder.decode(LOCATION.self, from: data!)
                completion(postItem)
                print("Google Request: Latitud = \(postItem.lat) - Longitud: \(postItem.lng)")
            } catch {
                print(error)
            }
            
        }
    }
    task.resume()
    
    return
}


