//
//  AnswerTableViewCell.swift
//  Kuis
//
//  Created by Albert Pangestu on 13/01/22.
//

import Foundation
import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var answerTitleLabel: UILabel!
    
    // MARK: - Configuration
    func configure(with answer: String) {
        answerTitleLabel.text = answer
    }
}
