//
//  Question.swift
//  Kuis
//
//  Created by Albert Pangestu on 20/12/21.
//

import Foundation

struct Question {
    var title = ""
    
    mutating func updateQuestion(_ title: String) {
        
        self.title = title
    }
}
