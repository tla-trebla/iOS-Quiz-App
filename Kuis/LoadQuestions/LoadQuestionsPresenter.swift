//
//  LoadQuestionsPresenter.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation

protocol LoadQuestionsPresenter {
    func showLoadQuestionsSuccessful(question: [Question])
    func showLoadFailed(message: String)
}

final class DefaultLoadQuestionsPresenter: LoadQuestionsPresenter {
    
    var viewController: LoadQuestionsSceneView?
    
    func showLoadQuestionsSuccessful(question: [Question]) {
        
    }
    
    func showLoadFailed(message: String) {
        
    }
}
