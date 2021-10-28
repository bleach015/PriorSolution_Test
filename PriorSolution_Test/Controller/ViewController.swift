//
//  ViewController.swift
//  PriorSolution_Test
//
//  Created by Pathompong Subtechitmanee on 27/10/2564 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    var name = String()
    var status = String()
    var species = String()
    var gender = String()
    var origin = String()
    var location = String()
    var image = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: image)
        let data = try? Data(contentsOf: url!)

        self.nameLabel.text = "Name: " + name
        self.statusLabel.text = "Status: " + status
        self.speciesLabel.text = "Species: " + species
        self.genderLabel.text = "Gender: " + gender
        self.originLabel.text = "Origin: " + origin
        self.locationLabel.text = "Location: " + location
        self.characterImage.image = UIImage(data: data!)
    }


}
