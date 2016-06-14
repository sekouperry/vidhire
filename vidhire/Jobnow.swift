//
//  Jobnow.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/6/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import Foundation
import UIKit

class jobnow {
    var title = ""
    var featuredimage = UIImage()
    


    init(title:String, featuredimage:UIImage!) {
        self.title = title
        self.featuredimage = featuredimage
    }
    
    
    static func createInterests() -> [jobnow]
    {
        return [
            jobnow( title: "Wagner College", featuredimage: UIImage(named: "wagnertitle")!),
            
            
        ]
    }

}