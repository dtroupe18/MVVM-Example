//
//  App.swift
//  MVVM Example
//
//  Created by Dave on 5/6/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

struct App: Codable {
    
    let name: String
    let releaseDate: String
    
    // Api response from Apple has variables named using camel case so this isn't required, but is very useful when
    // variables names are not camel case or if the JSON and Struct names do not match
    //
    enum CodingKeys : String, CodingKey {
        case name = "name"
        case releaseDate = "releaseDate"
    }
    
    init?(dict: NSDictionary) {
        if let name = dict["name"] as? String, let releaseDate = dict["releaseDate"] as? String {
            self.name = name
            self.releaseDate = releaseDate
        } else {
            return nil
        }
    }
    
    init(name: String, releaseDate: String) {
        self.name = name
        self.releaseDate = releaseDate
    }
}

