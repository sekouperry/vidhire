//
//  ViewController.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/4/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var backgroundimage:UIImageView!
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var job = [jobs]()
    var inSearchMode = false
    var filteredJob = [jobs]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchbar.delegate = self
        searchbar.returnKeyType = UIReturnKeyType.Done
        
        parsejobsCSV()
    }
    
    func parsejobsCSV() {
        
        let path = NSBundle.mainBundle().pathForResource("job", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            for row in rows {
                let jobid = Int(row["id"]!)!
                let name = row["identifier"]!
                let jobb = jobs(name: name, joboffer: jobid)
                job.append(jobb)
            }
                    
        }catch let err as NSError {
            print(err.debugDescription)
        }
        
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("JobCell", forIndexPath: indexPath) as? JobCell {
            
            let jobb: jobs!
            
            if inSearchMode {
                jobb = filteredJob[indexPath.row]
            }else {
                jobb = job[indexPath.row]
            }
            
            cell.configureCell(jobb)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let jobb: jobs!
        
        if inSearchMode {
            jobb = filteredJob[indexPath.row]
            
        } else {
            jobb = job[indexPath.row]
            
        }
        print(jobb.name)
        performSegueWithIdentifier("JobOfferVC", sender: jobb)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredJob.count
        }
        
        return job.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchbar.text == nil || searchbar.text == ""{
            inSearchMode = false
            view.endEditing(true)
            collection.reloadData()
        } else {
            inSearchMode = true
            let lower = searchbar.text!.lowercaseString
            filteredJob = job.filter({$0.name.rangeOfString(lower) != nil})
            collection.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "JobOfferVC" {
            if let detailVC = segue.destinationViewController as?  JobOfferVC {
                if let jobb = sender as? jobs {
                    detailVC.job = jobb
                }
            }
        }
    }
}

