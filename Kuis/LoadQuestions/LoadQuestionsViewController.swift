//
//  LoadQuestionsViewController.swift
//  Kuis
//
//  Created by Albert Pangestu on 11/01/22.
//

import Foundation
import UIKit

protocol LoadQuestionsSceneView {
    func showQuestions(questions: Array<Question>)
    func showError()
}

class LoadQuestionsViewController: UIViewController {
    
    var presenter: LoadQuestionsPresenterInput?
    
    var questionArray = Array(repeating: "", count: 10)
    
    @IBAction func startGameButtonPressed(_ sender: Any) {
    }
}

// MARK: - View to Presenter
extension LoadQuestionsViewController: LoadQuestionsSceneView {
    
    func showQuestions(questions: Array<Question>) {
        
    }
    
    func showError() {
        
    }
}
