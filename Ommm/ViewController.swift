//
//  ViewController.swift
//  Ommm
//
//  Created by Jeremy Philippe on 13/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import UIKit
import JWT
import Alamofire
import SwiftyJSON
import paper_onboarding

class ViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate  {

    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColor = UIColor(red: 84/255, green: 0, blue: 255/255, alpha: 1)
		
		let font = UIFont(name: "Roboto-Bold", size: 24)
		
        let titleFont = UIFont(name: "Roboto-Bold", size: 24)!
        let descriptionFont = UIFont(name: "Roboto-Regular", size: 18)!
        
        return [
            ("Onboarding", "", "Relaxez-vous, méditez et respirez avec Ommm", "", backgroundColor, UIColor.white, UIColor.white,titleFont, descriptionFont),
            ("Onboarding", "", "Profitez des bienfaits de la méditation à tout moment au travers de simples exercices guidés de 5 minutes", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont),
            ("Onboarding", "", "Mesurez par vous même les bienfaits de Ommm sur votre corps grâce à un suivi de vos sessions", "", backgroundColor, UIColor.white, UIColor.white, titleFont, descriptionFont)
        ][index]
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    @IBAction func gotStarted(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")
        userDefaults.synchronize()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

