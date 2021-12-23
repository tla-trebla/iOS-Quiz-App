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
        XCTAssertEqual(self.question.answers, [String]())
    }
    
    func test_AddMoreThanFourAnswersGetsAnError() {
        
        addAnswers()
        
        XCTAssertThrowsError(try self.question.addAnswer("Michael Jordan")) { error in
            
            XCTAssertEqual(error as? QuestionError,
                           QuestionError.AnswerExceedsTheLimit)
        }
    }
    
    func test_InitialQuestionCorrectAnswer() {
        XCTAssertEqual(self.question.correctAnswer, "")
    }
    
    func test_UpdateCorrectAnswerWithoutProvidedAnswersGetsAnError() {
        
        addAnswers()
        
        XCTAssertThrowsError(try self.question.updateCorrectAnswer("Joko Widodo")) { error in
            
            XCTAssertEqual(error as? QuestionError, QuestionError.NoCorrectAnswer)
        }
    }
    
    // MARK: - Helpers
    
    private func addAnswers() {
        
        try? self.question.addAnswer("Albert Einstein")
        try? self.question.addAnswer("Abraham Lincoln")
        try? self.question.addAnswer("Mahatama Gandhi")
        try? self.question.addAnswer("Julius Robert Oppenheimer")
    }
}
