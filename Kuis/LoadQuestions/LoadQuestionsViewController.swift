//
//  LoadQuestionsViewController.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation
import UIKit

protocol LoadQuestionsSceneView {
    func showQuestions(questions: [String])
    func showFailureLoadQuestions(message: String)
}

final class LoadQuestionsViewController: UIViewController {
    
    var presenter: LoadQuestionsPresenter?
    
    var questionArray = Array(repeating: "", count: 10)
}

extension LoadQuestionsViewController: LoadQuestionsSceneView {
    
    func showQuestions(questions: [String]) {
        
    }
    
    func showFailureLoadQuestions(message: String) {
        
    }
}
