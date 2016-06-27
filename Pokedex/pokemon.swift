//
//  pokemon.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import Foundation
import Alamofire

/* create pokemon class and initializer */
class Pokemon {
    /* all our private variables */
    private var pokemonName: String!
    private var pokemonId: Int!
    private var pokemonHeight: String!
    private var pokemonWeight: String!
    private var pokemonDefence: String!
    private var pokemonAttack: String!
    private var pokemonType: String!
    private var pokemonDescription: String!
    private var Evolution: Dictionary<String, String>!
    private var pokemonUrl: String!
    typealias customBlock = () -> ()
    
    /* create all the getters */
    var name: String {
        if pokemonName == nil {
            pokemonName = ""
        }
        return pokemonName
    }
    
    var id: Int{
        if pokemonId == nil {
            pokemonId = 0
        }
        return pokemonId
    }
    
    var height: String {
        if pokemonHeight == nil {
            pokemonHeight = ""
        }
        return pokemonHeight
    }
    
    var weight: String {
        if pokemonWeight == nil {
        pokemonWeight = ""
        }
        return pokemonWeight
    }
    
    var defence: String {
        if pokemonDefence == nil {
            pokemonDefence = ""
        }
        return pokemonDefence
    }
    
    var attack: String {
        if pokemonAttack == nil {
            pokemonAttack = ""
        }
        return pokemonAttack
    }
    
    var type: String {
        if pokemonType == nil {
            pokemonType = ""
        }
        return pokemonType
    }
    
    var pokDescription: String {
        if pokemonDescription == nil {
            pokemonDescription = ""
        }
        return pokemonDescription
    }
    
    var evolution: Dictionary<String, String> {
        if Evolution == nil {
            Evolution = ["text":"", "id":"", "level":""]
        }
        return Evolution
    }
    
    /* create the setter */
    init(name: String, id: Int) {
        pokemonUrl = "\(url)\(id)/"
        pokemonName = name
        pokemonId = id
    }
    
    /* now lets download all the data */
    func download(Block: customBlock) {
        Alamofire.request(.GET, NSURL(string: pokemonUrl)!).responseJSON { (Response) in //response is of type <AnyObject, NSError>
            let pokemonDictionary = Response.result.value as? Dictionary<String, AnyObject>
            if let weight = pokemonDictionary?["weight"] {
                self.pokemonWeight = "\(weight)"
            }
            if let height = pokemonDictionary?["height"] {
                self.pokemonHeight = "\(height)"
            }
            if let attack = pokemonDictionary?["attack"] {
                self.pokemonAttack = "\(attack)"
            }
            if let defence = pokemonDictionary?["defense"] {
                self.pokemonDefence = "\(defence)"
            }
            if let type = pokemonDictionary!["types"] as? [Dictionary<String, String>]{
                    self.pokemonType = type[0]["name"]?.capitalizedString
                if type.count > 1 {
                    for i in 1 ..< type.count {
                        self.pokemonType = self.pokemonType + "/" + (type[i]["name"]?.capitalizedString)!
                    }
                }
            }
            
            if let evolution = pokemonDictionary!["evolutions"] as? [Dictionary<String, AnyObject>] {
                if evolution.count > 0 {
                    if let fetch = evolution[0]["to"] as? String {
                        if fetch.rangeOfString("mega") != nil {
                            if self.Evolution == nil {
                                self.Evolution = ["text":"", "id":"", "level":""]
                            }
                            self.Evolution["text"] = ""
                            self.Evolution["id"] = ""
                            self.Evolution["level"] = ""
                    } else {
                        if self.Evolution == nil {
                            self.Evolution = ["text":"", "id":"", "level":""]
                        }
                            
                        self.Evolution["text"] = fetch
                            
                        if let level = evolution[0]["level"] as? Int {
                            self.Evolution["level"] = "\(level)"
                        }
                            
                        if let uri = evolution[0]["resource_uri"] as? String {
                            self.Evolution["id"] = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                            self.Evolution["id"] = self.Evolution["id"]!.stringByReplacingOccurrencesOfString("/", withString: "")
                        }
                    }
                }
            }
        }
            
            if let description = pokemonDictionary!["descriptions"] as? [Dictionary<String, String>] {
                if let urlString = NSURL(string: "http://pokeapi.co" + "\(description[0]["resource_uri"]!)") {
                    Alamofire.request(.GET, urlString).responseJSON(completionHandler: { (response) in
                        if let dict = response.result.value as? Dictionary<String, AnyObject> {
                            self.pokemonDescription = (dict["description"]! as? String)?.stringByReplacingOccurrencesOfString("POKMON", withString: "pokemon", options: NSStringCompareOptions.LiteralSearch, range: nil)
                        }
                        Block()
                    })
                }
            } else {
                self.pokemonDescription = "Hey there explorer! Mankind doesn't know enough about this majestic pokemon."
                Block()
            }
        }
    }
    
}