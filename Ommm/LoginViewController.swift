//
//  LoginViewController.swift
//  Ommm
//
//  Created by Jeremy Philippe on 14/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import UIKit
import JWT
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    static let segue_identifier = "login_viewcontroller_identifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = "abker"
        passwordTextField.text = "aaaaaa"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if let username = loginTextField.text, let password = passwordTextField.text {
            if !username.isEmpty && !password.isEmpty {
                let user_data : NSDictionary = NSMutableDictionary()
                
                user_data.setValue(loginTextField.text, forKey: "username")
                user_data.setValue(passwordTextField.text, forKey: "password")
                
                let url:URL = URL(string: "https://dry-headland-65759.herokuapp.com/signin/")!
                
                var request  = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try! JSONSerialization.data(withJSONObject: user_data)
                Alamofire.request(request)
                    .responseJSON {
                        response in
                        switch response.result {
                        case .failure(let error):
                            print(error)
                            
                            if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                                print(responseString)
                            }
                        case .success(let responseObject):
                            let user = UserDefaults.standard
                            user.set(username, forKey:"username")
                            user.set(password, forKey:  "password")
                            user.set(JSON(responseObject)["token"].stringValue, forKey: "token")
                            
                            
                            //Set user logged in
                            user.set(true, forKey: "isUserLoggedIn")
                            user.synchronize()
                            
                            self.performSegue(withIdentifier: HomeViewController.segue_identifier, sender: sender)
                        }
                }
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
