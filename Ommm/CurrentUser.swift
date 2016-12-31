//
//  CurrentUser.swift
//  Ommm
//
//  Created by Jeremy Philippe on 16/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import Foundation
import KeychainSwift

class CurrentUser {
    static let sharedInstance = CurrentUser()
	
	private let keyUserName = "username"
	private let keyEmail	= "email"
	private let keyPassword = "password"
	private let keyToken	= "token"
	
	private lazy var keychainSwift = KeychainSwift()
	
	private init() {
		
	}
	
	var username: String? {
		get {
			return self.keychainSwift.get(keyUserName)
		}
		set(value) {
			if let newValue = value {
				self.keychainSwift.set(newValue, forKey: keyUserName)
			}
		}
	}
	
	var email: String? {
		get {
			return self.keychainSwift.get(keyEmail)
		}
		set(value) {
			if let newValue = value {
				self.keychainSwift.set(newValue, forKey: keyEmail)
			}
		}
	}
	
	var password: String? {
		get {
			return self.keychainSwift.get(keyPassword)
		}
		set(value) {
			if let newValue = value {
				self.keychainSwift.set(newValue, forKey: keyPassword)
			}
		}
	}
	
	var token: String? {
		get {
			return self.keychainSwift.get(keyToken)
		}
		set(value) {
			if let newValue = value {
				self.keychainSwift.set(newValue, forKey: keyToken)
			}
		}
	}
	
	

}
