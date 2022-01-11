//
//  LoadQuestionsInteractor.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

protocol LoadQuestionsInteractor {
    typealias LoadQuestionsCompletion = (Result<[Question], Error>) -> Void
    func execute(completion: @escaping LoadQuestionsCompletion)
}

final class DefaultLoadQuestionsInteractor: LoadQuestionsInteractor {
    
    typealias Response = Question
    
    private let networkStore: GetQuestionsStore
    
    init(networkStore: GetQuestionsStore) {
        self.networkStore = networkStore
    }
    
    func execute(completion: @escaping (LoadQuestionsCompletion)) {
        
        networkStore.fetch { result in
            switch result {
            case .success(let questions):
                completion(.success(questions))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
