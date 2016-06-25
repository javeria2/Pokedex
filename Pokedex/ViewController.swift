//
//  ViewController.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit
import AVFoundation

/* implement protocols */
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collection: UICollectionView!
    var parser = parsePokemon()
    var player = AVAudioPlayer()
    var music:Bool = false
    @IBOutlet weak var musicButton: UIButton!
    
    override func viewDidLoad() {
        parser.CSVParser()
        if let musicPath = NSURL(string: NSBundle.mainBundle().pathForResource("Pokemon", ofType: "mp3")!) {
            do{
                player = try AVAudioPlayer(contentsOfURL: musicPath)
                player.numberOfLoops = -1 //play infinitely
                player.play()
                if !music{
                    musicButton.setImage(UIImage(named: "pause.png"), forState: UIControlState.Normal)
                }
                music = !music
            } catch let error{
                print(error)
            }
        }
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func music(sender: AnyObject) {
        if music{
            player.pause()
            musicButton.setImage(UIImage(named: "button.png"), forState: UIControlState.Normal)
        } else {
            musicButton.setImage(UIImage(named: "pause.png"), forState: UIControlState.Normal)
            player.play()
        }
        music = !music
    }
    
    /* very very similar to configuirng UITableView */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? CollectionCell
        cell?.cellSetup(parser.pokemon[indexPath.row])
        return cell!
    }
    
    /* handle action when a cell is tapped */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /* how many cells in one section? */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parser.pokemon.count
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

