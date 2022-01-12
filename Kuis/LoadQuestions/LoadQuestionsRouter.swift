//
//  LoadQuestionsRouter.swift
//  Kuis
//
//  Created by Albert Pangestu on 12/01/22.
//

import Foundation
import UIKit

protocol LoadQuestionsRouter {
    func createModule() -> LoadQuestionsViewController
    func pushToQuestionScreen(navigationController: UINavigationController)
}

class DefaultLoadQuestionsRouter: LoadQuestionsRouter {
    
    func createModule() -> LoadQuestionsViewController {
        
        
    }
    
    func pushToQuestionScreen(navigationController: UINavigationController) {
        
    }
}
