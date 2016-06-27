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
    @IBOutlet weak var pokemonName2: UILabel!
    @IBOutlet weak var pokemonName: UILabel!
    
    /* IBAction for back button */
    @IBAction func backButton(sender: AnyObject) {
            dismissViewControllerAnimated(true) { 
                if playerSwitch {
                    player.play()
                }
        }
    }
    
    override func viewDidLoad() {
        
        pokemonName.text = pokemon.name
        pokemonName2.text = pokemon.name
        pokemonId.text = "\(pokemon.id)"
        pokemonImage.image = UIImage(named: "\(pokemon.id)")
        pokemon.download {
            self.pokemonHeight.text = self.pokemon.height
            self.pokemonType.text = self.pokemon.type
            self.pokemonAttack.text = self.pokemon.attack
            self.pokemonDefence.text = self.pokemon.defence
            self.pokemonWeight.text = self.pokemon.weight
            self.pokemonDescription.text = self.pokemon.pokDescription
            if self.pokemon.evolution["text"] == "" {
                self.evolutionLabel.text = "No evolution found, current is:"
                self.evolutionImage1.image = UIImage(named: "\(self.pokemonId.text!)")
                self.evolutionImage2.hidden = true
            } else {
                if self.pokemon.evolution["level"] != "" {
                    self.evolutionLabel.text = "Evolves to \(self.pokemon.evolution["text"]!), Level: \(self.pokemon.evolution["level"]!)"
                } else {
                    self.evolutionLabel.text = "Evolves to \(self.pokemon.evolution["text"]!)"
                }
                self.evolutionImage2.hidden = false
                self.evolutionImage1.image = UIImage(named: "\(self.pokemonId.text!)")
                self.evolutionImage2.image = UIImage(named: "\(self.pokemon.evolution["id"]!)")
            }
        }
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

}
