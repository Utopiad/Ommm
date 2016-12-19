//
//  RecentExercises.swift
//  Ommm
//
//  Created by Jeremy Philippe on 16/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import Foundation
import SwiftyJSON

class RecentExercises : Exercise {
    override init() {
        
    }
    
    init(title: String, thumbnail: String) {
        super.init()
        self.title = title
        self.thumbnail = thumbnail
    }
}

extension RecentExercises {
    convenience init(json: JSON) {
        self.init()
        
        self.title = json["title"].stringValue
        self.thumbnail = json["thumbnail"].stringValue
    }
}

