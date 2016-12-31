//
//  ExercisesTableViewCell.swift
//  Ommm
//
//  Created by Jeremy Philippe on 15/12/2016.
//  Copyright © 2016 Utopiad. All rights reserved.
//

import UIKit

class ExercisesTableViewCell: UITableViewCell {
    
    static let identifier = "exercise_cell_identifier"

    @IBOutlet weak var titleLabel: UILabel!
    
    var exercise:Exercise! {
        didSet {
            titleLabel.text = exercise.title
			
			// Impossible to load an image with UIImage(named:) when you are using a url
			// You should use hanakeswift to load image
			// https://github.com/Haneke/HanekeSwift
			// imageView.hnk_setImageFromURL(url)
			
            //let thumbnail:UIImage = UIImage(named: exercise.thumbnail)!
            //let thumbnailView = UIImageView(image: thumbnail)
            //thumbnailView.frame = CGRect(x: 0, y: 0, width: 43, height: 43)
            //self.addSubview(thumbnailView)
        }
    }

}
