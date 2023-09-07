//
//  ModelData.swift
//  CaritasRayosX
//
//  Created by Alumno on 07/09/23.
//

import Foundation

func callAPI() -> Array<recibos>{
    var lista: Array<recibos> = []
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
                let recibosList = try jsonDecoder.decode([recibos].self, from: data!)
                lista = recibosList
                for recibosItem in recibosList{
                    print("Id: \(recibosItem.id) - Nombre: \(recibosItem.NOMBRE)")
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
