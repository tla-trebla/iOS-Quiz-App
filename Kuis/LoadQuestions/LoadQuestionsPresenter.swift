//
//  LoadQuestionsPresenter.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation
import UIKit

protocol LoadQuestionsPresenterInput {
    
    var view: LoadQuestionsViewController? { get set }
    var interactor: LoadQuestionsInteractor? { get set }
    var router: LoadQuestionsRouter? { get set }
    
    func startFetchingQuestions()
    func showQuestionController(navigationController: UINavigationController)
}

protocol LoadQuestionsPresenterOutput {
    
    func loadQuestionsSuccess(question: [Question])
    func loadQuestionsFailed()
}

// MARK: - View to Presenter
class DefaultLoadQuestionsPresenter: LoadQuestionsPresenterInput {
    
    var view: LoadQuestionsViewController?
    var interactor: LoadQuestionsInteractor?
    var router: LoadQuestionsRouter?
    
    func startFetchingQuestions() {
        interactor?.fetchQuestions()
    }
    
    func showQuestionController(navigationController: UINavigationController) {
        router?.pushToQuestionScreen(navigationController: navigationController)
    }
}

// MARK: - Interactor to Presenter
extension DefaultLoadQuestionsPresenter: LoadQuestionsPresenterOutput {
    
    func loadQuestionsSuccess(question: [Question]) {
        view?.showQuestions(questions: question)
    }
    
    func loadQuestionsFailed() {
        view?.showError()
    }
}
