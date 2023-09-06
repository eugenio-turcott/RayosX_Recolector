//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 06/09/23.
//

import Foundation

//var listaDonantes = cargarDato()

func callAPI2() -> Array<donante>{
    var lista: Array<donante> = []
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
        return lista
    }
    
    let group = DispatchGroup()
    group.enter()
    
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let jsonDecoder = JSONDecoder()
        if(data != nil){
            do{
                let postList = try jsonDecoder.decode([Post].self, from: data!)
                lista = postList
                for postItem in postList{
                    print("Id: \(postItem.id) - Titulo: \(postItem.title)")
                }
            }catch{
                print(error)
            }
        }
        group.leave()
    }
    task.resume()
    group.wait()
    return lista
    
}

/*func cargarDato() -> Array<donante>{
    let listaDonantes = [donante(id: 1, nombre: "Eugenio", apellidoP: "Turcott"),
                         donante(id: 2, nombre: "Paty", apellidoP: "P de Pato"),
                         donante(id: 3, nombre: "Ainy", apellidoP: "Legarreta")]
    return listaDonantes
}*/
