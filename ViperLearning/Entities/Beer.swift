//
//  Beer.swift
//  ViperLearning
//
//  Created by Yuri Saboia Felix Frota on 05/12/17.
//  Copyright © 2017 ExpressU. All rights reserved.
//

import Foundation

struct Beer: Decodable {
    var name: String?
    var id: Int?
    var tagline: String?
    var description: String?
    var imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case name
        case id
        case tagline
        case description
    }
}
