//
//  SettingsViewController.swift
//  WWTBM
//
//  Created by Nikita on 19.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    private var selectedSubsequence: Subsequence {
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            SubsequenceSettingsCareTaker().save(state: .inCource)
            return .inCource
        case 1:
            SubsequenceSettingsCareTaker().save(state: .random)
            return .random
        default:
            SubsequenceSettingsCareTaker().save(state: .inCource)
            return .inCource
        }
            
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
