//
//  ViewController.swift
//  WWTBM
//
//  Created by Nikita on 10.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var getResults: UIButton!
    override func viewDidLoad() {
        newGame.layer.cornerRadius = 20
        getResults.layer.cornerRadius = 20
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

