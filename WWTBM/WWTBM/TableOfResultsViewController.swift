//
//  TableOfResultsViewController.swift
//  WWTBM
//
//  Created by Nikita on 12.08.2021.
//

import UIKit

class TableOfResultsViewController: UIViewController {
    var results: [Result] = ResultsCareTaker().retrieveRecords()
    @IBOutlet var myTableView: UITableView!
    override func viewDidLoad() {
        myTableView.delegate = self
        myTableView.dataSource = self
        super.viewDidLoad()
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        myTableView.reloadData()
        // Do any additional setup after loading the view. TableViewCell
    }
    
}
extension TableOfResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configure(COQ: results[indexPath.row].countOfQuestions, COA: results[indexPath.row].countOfCorrectAnswers, Time: results[indexPath.row].timeOfGame)
        return cell
    }
    
    
}
