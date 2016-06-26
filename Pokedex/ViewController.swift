//
//  ViewController.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit
import AVFoundation


var player = AVAudioPlayer()
var playerSwitch: Bool = true

/* implement protocols */
class ViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collection: UICollectionView!
    var parser = parsePokemon()
    var music:Bool = false
    var searchResult = [Pokemon]()
    var searching:Bool = false
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    /* start-up */
    override func viewDidLoad() {
        parser.CSVParser()
        if let musicPath = NSURL(string: NSBundle.mainBundle().pathForResource("Pokemon", ofType: "mp3")!) {
            do{
                player = try AVAudioPlayer(contentsOfURL: musicPath)
                player.numberOfLoops = -1 //play infinitely
                player.play()
                if !music{
                    setImage("pause.png")
                }
                music = !music
            } catch let error{
                print(error)
            }
        }
        
        searchBar.returnKeyType = UIReturnKeyType.Go
        let tap = UITapGestureRecognizer(target: self, action : Selector("handleTap:"))
        tap.numberOfTapsRequired = 1
        tap.cancelsTouchesInView = false
        collection.addGestureRecognizer(tap)
        super.viewDidLoad()
    }

    /* set the button image */
    func setImage(named: String) {
        musicButton.setImage(UIImage(named: named), forState: UIControlState.Normal)
    }
    
    /* IBAction for music button */
    @IBAction func music(sender: AnyObject) {
        if music{
            player.pause()
            setImage("playButton.png")
            playerSwitch = false
        } else {
            setImage("pause.png")
            player.play()
            playerSwitch = true
        }
        music = !music
    }
    
    /* searching and pokemon filtering */
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            searching = false
            view.endEditing(true)
        } else {
            let getText = searchBar.text!.lowercaseString
            searchResult = parser.pokemon.filter({$0.name.rangeOfString(getText) != nil})
            searching = true
        }
        collection.reloadData()
    }
    
    /* very very similar to configuirng UITableView */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? CollectionCell
        if !searching {
            cell?.cellSetup(parser.pokemon[indexPath.row])
        } else {
            cell?.cellSetup(searchResult[indexPath.row])
        }
        return cell!
    }
    
    /* handle action when a cell is tapped */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if !searching {
            performSegueWithIdentifier("info", sender: parser.pokemon[indexPath.row])
        } else {
            performSegueWithIdentifier("info", sender: searchResult[indexPath.row])
        }
        if player.playing {
            player.pause()
            playerSwitch = true
        }
    }
    
    /* how many cells in one section? */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searching{
            return searchResult.count
        } else {
            return parser.pokemon.count
        }
    }
    
    /* hide keyboard when tapped on the collection view */
    func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    /* pass the pokemon clicked on to the segued VC */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "info" {
            let destination = segue.destinationViewController as? PokemonInfo
            destination?.pokemon = sender as? Pokemon
        }
    }
    
    /* this closes on pressing anywhere in the view */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /* this closes keyboard on hitting the go key */
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    /* number of sections, just 1 */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* set the size of each cell in the collection view */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(107, 107)
    }
}

