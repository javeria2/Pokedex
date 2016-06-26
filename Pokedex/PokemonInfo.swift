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
    @IBOutlet weak var evolutionLabel: UILabel!
    @IBOutlet weak var evolutionImage2: UIImageView!
    @IBOutlet weak var evolutionImage1: UIImageView!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonDefence: UILabel!
    @IBOutlet weak var pokemonAttack: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    /* IBAction for back button */
    @IBAction func backButton(sender: AnyObject) {
            dismissViewControllerAnimated(true) { 
                if playerSwitch {
                    player.play()
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
