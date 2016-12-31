//
//  SignUpController.swift
//  Ommm
//
//  Created by Jeremy Philippe on 14/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    static let segue_identifier = "signup_viewcontroller_identifier"
    
    @IBOutlet weak var moonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = "PLS"
        emailTextField.text = "utopiad.jp@gmail.com"
        passwordTextField.text = "bisounours"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    @IBAction func signUp(_ sender: Any) {
        if let username = usernameTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
            if !username.isEmpty && !email.isEmpty && !password.isEmpty {
                
                let user_credentials: NSDictionary = NSMutableDictionary()
                
                user_credentials.setValue(username, forKey: "username")
                user_credentials.setValue(email, forKey: "email")
                user_credentials.setValue(password, forKey: "password")
                
                let user_data: NSDictionary = NSMutableDictionary()
                
                user_data.setValue(user_credentials, forKey: "user")
                
                let url:URL = URL(string: "https://dry-headland-65759.herokuapp.com/signup/")!
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONSerialization.data(withJSONObject: user_data)
                Alamofire.request(request)
                    .responseJSON{
                        response in
                        switch response.result {
                        case .failure(let error):
                            print(error)
                            
                            if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                                print(responseString)
                            }
                        case .success(let responseObject):
                            print(responseObject)
                            let currentUser = CurrentUser.sharedInstance
							currentUser.username = username
							currentUser.email = email
							currentUser.password = password
							
                            self.loginNow(username: username, password: password, sender: sender)
                        }
                }
            }
        } else {
            return
        }
    }
    
	func loginNow(username: String, password: String, sender: Any)
    {
        let user_data : NSDictionary = NSMutableDictionary()
        user_data.setValue(username, forKey: "username")
        user_data.setValue(password, forKey: "password")
        
        let url:URL = URL(string: "https://dry-headland-65759.herokuapp.com/signin/")!
        
        var request  = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONSerialization.data(withJSONObject: user_data)
        Alamofire.request(request)
            .responseJSON {
                (response) in
                switch response.result {
                case .failure(let error):
                    print("error")
                    print(error)
                    
                    if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                        print(responseString)
                    }
                case .success(let token):
                    print("success")
                    
                    let token = JSON(token)["token"].stringValue
                    CurrentUser.sharedInstance.token = token
                    
                    //Set user logged in
                    self.performSegue(withIdentifier: HomeViewController.segue_identifier, sender: sender)
                }
        }
    }
    
    //Keyboard shows
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField: textField, moveDistance: -175, up: true)
    }
    
    // Keyboard hidden
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField: usernameTextField, moveDistance: -175, up: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}
