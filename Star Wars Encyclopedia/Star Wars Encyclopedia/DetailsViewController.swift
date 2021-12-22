//
//  DetailsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by admin on 22/12/2021.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameOrTitle: UILabel!
    @IBOutlet weak var genderOrRelease: UILabel!
    @IBOutlet weak var birthOrDirector: UILabel!
    @IBOutlet weak var massOrOpening: UILabel!
    
    var n = ""
    var g = ""
    var b = ""
    var m = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOrTitle.text = n
        genderOrRelease.text = g
        birthOrDirector.text = b
        massOrOpening.text = m
        // Do any additional setup after loading the view.
    }

}
