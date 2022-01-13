//
//  NetworkGetQuestionsStore.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

enum NetworkFetchError: Error {
    case invalidURL
}

protocol GetQuestionsStore {
    typealias GetQuestionsCompletion = (Result<[Question], Error>) -> Void
    func fetch(completion: @escaping GetQuestionsCompletion)
}

class NetworkGetQuestionsStore: GetQuestionsStore {
    
    func fetch(completion: @escaping GetQuestionsCompletion) {
        
        // TODO: Create Array based on the user request of how many Questions they asked.
        var questions = Array(repeating: Question(), count: 10)
        
        guard let url = URL(string: API_OPEN_TRIVIA_DB) else {
            return completion(.failure(NetworkFetchError.invalidURL))
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
    
        completion(.success(questions))
    }
}
