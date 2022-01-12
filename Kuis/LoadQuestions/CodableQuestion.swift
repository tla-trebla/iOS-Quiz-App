//
//  CodableQuestion.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

// MARK: - JSON Initializer

struct CodableQuestion: Codable {
    
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}
