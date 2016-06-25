//
//  parsePokemon.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit

class parsePokemon: UIViewController {

    var pokemon = [Pokemon]()
    
    func CSVParser() {
        let csv = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        do{
            let fetchCSV = try CSV(contentsOfURL: csv)
            let rows = fetchCSV.rows
            for eachRow in rows {
                let name = eachRow["identifier"]
                let id = eachRow["id"]
                pokemon.append(Pokemon(name: name!,id: Int(id!)!))
            }
        } catch let error{
            print(error)
        }
    }
}
