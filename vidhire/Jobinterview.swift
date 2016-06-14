//
//  Jobinterview.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/6/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import UIKit

class Jobinterview: UIView {

    var job: jobnow! {
    didSet {
    updateUI()
    }
    }
    
    private func updateUI() {
        backgroundimage?.image! = job.featuredimage
    
       
        
    }
    
    @IBOutlet weak var backgroundimage: UIImageView!
    @IBOutlet weak var  closebuttonimage: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        closebuttonimage.layer.cornerRadius = closebuttonimage.bounds.width / 2
        
    }
   
    
    
}
