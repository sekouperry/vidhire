//
//  Jobs.swift
//  vidhire
//
//  Created by Kenneth Okereke on 6/4/16.
//  Copyright © 2016 Kenneth Okereke. All rights reserved.
//

import Foundation

class jobs {
    private var _name: String!
    private var _joboffer: Int!
    


var name: String {
return _name
}
    
    
    var joboffer: Int {
        return _joboffer
    }
    
    

    init(name:String, joboffer:Int) {
    self._name = name
    self._joboffer = joboffer
    
}

}
