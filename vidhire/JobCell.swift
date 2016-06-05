//
//  JobCell.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/5/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import UIKit

class JobCell: UICollectionViewCell {
    @IBOutlet weak var thumbimage: UIImageView!
    @IBOutlet weak var Title:UILabel!
   
    
    
    
    var Jobs: jobs!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    
    
    layer.cornerRadius = 5.0
    
    }
    
    
    
    func configureCell(Jobs:jobs) {
        self.Jobs = Jobs
        Title.text = self.Jobs.name.capitalizedString
        thumbimage.image = UIImage(named: "\(self.Jobs.joboffer)")
        
    }
    
}
