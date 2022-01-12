//
//  LoadQuestionsInteractor.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

protocol LoadQuestionsInteractor {
    var presenter: LoadQuestionsPresenterOutput? { get set }
    func fetchQuestions()
}

// MARK: - Interactor to Presenter
class DefaultLoadQuestionsInteractor: LoadQuestionsInteractor {
    
    
    var presenter: LoadQuestionsPresenterOutput?
    
    private let networkStore: GetQuestionsStore
    
    init(networkStore: GetQuestionsStore) {
        self.networkStore = networkStore
    }
    
    func fetchQuestions() {
        
        networkStore.fetch { result in
            switch result {
            case .success(let questions):
                self.presenter.showLoadQuestionsSuccessful(question: questions)
            case .failure(let error):
                self.presenter.showLoadFailed(message: error.localizedDescription)
            }
        }
    }
}
