//
//  CollectionCell.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    var pokemon: Pokemon!
    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 7.0
    }
    
    func cellSetup(fetchPokemon: Pokemon) {
        pokemon = fetchPokemon
        pokemonLabel.text = pokemon.name.capitalizedString
        pokemonImage.image = UIImage(named: "\(pokemon.id)")
    }
}
