//
//  ExerciseService.swift
//  Ommm
//
//  Created by Jeremy Philippe on 15/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import JWT

class ExerciseService {
    
    typealias RecentExercisesSuccess = (_ exerciceses: [RecentExercises]) -> ()
    typealias PopularExercisesSuccess = (_ exerciceses: [PopularExercises]) -> ()
    typealias ExerciseFailure = (_ error: Error) -> ()
    
    static func retrieveRecentsExercises(success: @escaping RecentExercisesSuccess, failure: @escaping ExerciseFailure) {
        let url:URL = URL(string: "https://dry-headland-65759.herokuapp.com/list")!
        let user = UserDefaults.standard
        let token = user.object(forKey: "token")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("JWT \(token)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request)
            .responseJSON{
                (response) in
                switch response.result {
                case .success(let result):
                    print("success")
                    let data = JSON(result)
                    let exerciseResult = ExerciseResult(json: data)
                    success(exerciseResult.recents)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
    
    static func retrievePopularExercises(success: @escaping PopularExercisesSuccess, failure: @escaping ExerciseFailure) {
        let url:URL = URL(string: "https://dry-headland-65759.herokuapp.com/list")!
        let user = UserDefaults.standard
        let token = user.object(forKey: "token")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("JWT \(token)", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(request)
            .responseJSON{
                (response) in
                switch response.result {
                case .success(let result):
                    print("success")
                    
                    let data = JSON(result)
                    let exerciseResult = ExerciseResult(json: data)
                    success(exerciseResult.populars)
                    break
                case .failure(let error):
                    failure(error)
                    break
                }
        }
    }
}
