//
//  CurrentUser.swift
//  Ommm
//
//  Created by Jeremy Philippe on 16/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import Foundation

class CurrentUser {
    static var sharedInstance = CurrentUser()
    var user: UserDefaults?

}
