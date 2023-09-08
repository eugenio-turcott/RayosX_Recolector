//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

func loginVer(nombre:String, contrasenaI:String) -> Bool{
    var lista: Array<recolector> = []
    var contrasena: String = ""
    guard let url = URL(string: "http://10.14.255.65:10206/crud/read?NOMBRE=\(nombre)") else{
        print("Error en hacer crud")
        return false
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let recolectorList = try jsonDecoder.decode([recolector].self, from: data!)
                lista = recolectorList
                for recolector in recolectorList{
                    contrasena = recolector.CONTRASENA
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
    
    if lista.isEmpty {
        return false
    }
    else{
        if (contrasena == contrasenaI){
            return true
        }
        else{
            return false
        }
    }
    
}

var listaRecibos = callRecibos()

func callRecibos() -> Array<recibos>{
    var listaRecibos: Array<recibos> = []
    guard let url = URL(string: "http://10.14.255.65:10206/crud/readReciboxldR?ID_RECOLECTOR=30") else{
        /*listaRecibos[0] = recibos(id:3, aPaterno: "Mama", comentarios:"", email:"", estatusPago: "", idDireccionCobro: "1", idRecolector: "0", importe: 200, nombre: "eugenio", telMovil: "")*/
        return listaRecibos
    }

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: url){
        data, response, error in

        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let decodeRecibos = try jsonDecoder.decode([recibos].self, from: data!)
                listaRecibos = decodeRecibos
                for recibosItem in decodeRecibos{
                    print("Id: \(recibosItem.id) - Nombre: \(recibosItem.nombre)")
                }
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
