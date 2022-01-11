//
//  APIStore.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

enum StoreError: Error {
    case invalidURL
}

struct APIStore: Store {
    
    typealias Entity = Question
    
    func fetch() throws -> [Entity] {
        
        var questions = Array(repeating: Question(), count: 10)
        
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=28&type=multiple") else {
            throw StoreError.invalidURL
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data, let questionsJSON = try? JSONDecoder().decode([CodableQuestion].self, from: data) {
                
                for (index, item) in questionsJSON.enumerated() {
                        
                    questions[index].updateQuestion(item.question)
                    questions[index].updateCorrectAnswer(item.correct_answer)
                    // TODO: This doesn't throw an error from the Question Entity.
                    try? questions[index].addIncorrectAnswers(item.incorrect_answers)
                }
            }
        }.resume()
        
        return questions
    }
}
