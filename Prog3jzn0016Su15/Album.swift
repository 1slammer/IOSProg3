//
//  Album.swift
//  Prog3jzn0016Su15
//
//  Created by Jeffrey Nolen on 7/12/15.
//  Copyright (c) 2015 Jeffrey Nolen. All rights reserved.
//

import Foundation

class Album: NSObject {
    var name: String!
    var label: String!
    var year:String!
    var artist: String!

    
    init(nameIn:String!, yearIn:String!, artistIn:String!, labelIn:String!){
        name = nameIn
        label = labelIn
        year = yearIn
        artist = artistIn
        
    }

}
