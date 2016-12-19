//
//  ExerciseResult.swift
//  Ommm
//
//  Created by Jeremy Philippe on 15/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExerciseResult {
    lazy var recents = [RecentExercises]()
    lazy var populars = [PopularExercises]()
}

extension ExerciseResult {
    convenience init(json: JSON) {
        self.init()
        
        let jsonRecents = json[0]["exercises"].arrayValue
        let jsonPopulars = json[1]["exercises"].arrayValue
        
        for jsonRecent in jsonRecents {
            let exercise = RecentExercises(json: jsonRecent)
            self.recents.append(exercise)
        }

        for jsonPopular in jsonPopulars {
            let exercise = PopularExercises(json: [jsonPopular])
            self.populars.append(exercise)
        }
    }
}
