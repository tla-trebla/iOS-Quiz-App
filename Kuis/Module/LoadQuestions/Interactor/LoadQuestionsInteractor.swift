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
    
    private let store: GetQuestionsStore
    
    init(store: GetQuestionsStore) {
        self.store = store
    }
    
    func fetchQuestions() {
        
        store.fetch { result in
            switch result {
            case .success(let questions):
                self.presenter?.loadQuestionsSuccess(question: questions)
            case .failure(_):
                self.presenter?.loadQuestionsFailed()
            }
        }
    }
}
