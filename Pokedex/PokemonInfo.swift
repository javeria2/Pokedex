//
//  PokemonInfoViewController.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit

class PokemonInfo: UIViewController {
    var pokemon:Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokemon.name)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     /*   if segue.identifier == "info" {
         if let fetchPokemon = segue.destinationViewController as? P
        } */
    }

}
