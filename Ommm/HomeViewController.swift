//
//  HomeViewController.swift
//  Ommm
//
//  Created by Jeremy Philippe on 14/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var exercisesTableView: UITableView!
    static let segue_identifier = "home_viewcontroller_identifier"
    
    lazy var recentExercises = [RecentExercises]()
    lazy var popularExercises = [PopularExercises]()
//    let data = [self.recentExercises, self.popularExercises]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        exercisesTableView.reloadData()
        
        ExerciseService.retrieveRecentsExercises(success: { (recentExercises) in
            self.recentExercises.removeAll()
            self.recentExercises += recentExercises
            
            self.exercisesTableView.reloadData()
        }, failure: { (error) in
            print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//extension HomeViewController: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return recentExercises.count
//        case 1:
//            return popularExercises.count
//        default:
//            return 0
//        }
//    }
//    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: ExercisesTableViewCell.identifier, for: indexPath) as! ExercisesTableViewCell
////        
////        switch indexPath.section {
////        case 0:
////            cell.recentExercise = recentExercises[indexPath.row]
////        case 1:
////            cell.popularExercise = popularExercises[indexPath.row]
////        default:
////            cell = nil
////        }
////        /// Note à MOTÉ : J'ai deux groupes de données que je veux injecter dans la mêmte tableView, la data est prête mais je n'arrive pas à faire le lien :(
////        return cell
////    }
//    
//}
