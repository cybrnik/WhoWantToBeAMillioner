//
//  TableViewCell.swift
//  WWTBM
//
//  Created by Nikita on 12.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var COQLabel: UILabel!
    @IBOutlet weak var COALabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    func clearXib() {
        COQLabel.text = ""
        COALabel.text = ""
        TimeLabel.text = ""
    }
    override func awakeFromNib() {
        clearXib()
        super.awakeFromNib()
        
    }
    override func prepareForReuse() {
        clearXib()
        super.prepareForReuse()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(COQ: Int?, COA: Int?, Time: Int?) {
        if let COQ = COQ {
            COQLabel.text = String(COQ)
        }
        if let COA = COA {
            COALabel.text = String(COA)
        }
        if let Time = Time {
            TimeLabel.text = "\(String(Time)) Секунд"
        }
    }
}
