//
//  ViewController.swift
//  Pokedex
//
//  Created by Sanchay  Javeria on 6/25/16.
//  Copyright © 2016 SanchayJaveria. All rights reserved.
//

import UIKit

/* implement protocols */
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* very very similar to configuirng UITableView */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? CollectionCell
        return cell!
    }
    
    /* handle action when a cell is tapped */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /* how many cells in one section? */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    /* number of sections, just 1 */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* set the size of each cell in the collection view */
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
}

