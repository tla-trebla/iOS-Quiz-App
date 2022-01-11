//
//  QuestionTests.swift
//  KuisTests
//
//  Created by Albert Pangestu on 20/12/21.
//

import XCTest
@testable import Kuis

class QuestionTests: XCTestCase {
    
    private var question: Question!
    
    override func setUp() {
        
        self.question = Question()
    }
    
    func test_InitialQuestionTitle() {
        XCTAssertEqual(self.question.title, "")
    }
    
    func test_UpdateQuestionTitle() {
        
        self.question.updateQuestion("Who invented the E = mc^2?")
        XCTAssertEqual(self.question.title, "Who invented the E = mc^2?")
    }
    
    func test_InitialQuestionAnswers() {
        XCTAssertEqual(self.question.incorrectAnswers, Array(repeating: "", count: 3))
    }
    
    func test_AddMoreThanThreeAnswersGetsAnError() {
        
        addAnswers()
        
        XCTAssertThrowsError(try self.question.addIncorrectAnswers("Michael Jordan")) { error in
            
            XCTAssertEqual(error as? QuestionError,
                           QuestionError.AnswerExceedsTheLimit)
        }
    }
    
    func test_InitialQuestionCorrectAnswer() {
        XCTAssertEqual(self.question.correctAnswer, "")
    }
    
    // MARK: - Helpers
    
    private func addAnswers() {
        
        try? self.question.addIncorrectAnswers(["Albert Einstein", "Abraham Lincoln", "Mahatama Gandhi"])
    }
}
