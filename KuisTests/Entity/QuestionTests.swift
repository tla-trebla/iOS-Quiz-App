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
    
    func test_InitialQuestion() {
        XCTAssertEqual(self.question.title, "")
    }
    
    func test_UpdateQuestion() {
        
        self.question.updateQuestion("Who invented the E = mc^2?")
        XCTAssertEqual(self.question.title, "Who invented the E = mc^2?")
    }
    
    func test_InitialAnswers() {
        XCTAssertEqual(self.question.answers, [String]())
    }
    
    func test_AddAnswer() {
        
        try? self.question.addAnswer("Albert Einstein")
        try? self.question.addAnswer("Abraham Lincoln")
        XCTAssertEqual(self.question.answers, ["Albert Einstein", "Abraham Lincoln"])
    }
    
    func test_AddMoreThanFourAnswersGetsAnError() {
        
        try? self.question.addAnswer("Albert Einstein")
        try? self.question.addAnswer("Abraham Lincoln")
        try? self.question.addAnswer("Mahatama Gandhi")
        try? self.question.addAnswer("Julius Robert Oppenheimer")
        
        XCTAssertThrowsError(try self.question.addAnswer("Michael Jordan")) { error in
            
            XCTAssertEqual(error as? QuestionError,
                           QuestionError.AnswerExceedsTheLimit)
        }
    }
    
    func test_InitialCorrectAnswer() {
        XCTAssertEqual(self.question.correctAnswer, "")
    }
    
    func test_UpdateCorrectAnswer() {
        
        self.question.updateCorrectAnswer("Albert Einstein")
        XCTAssertEqual(self.question.correctAnswer, "Albert Einstein")
    }
    
    func test_UpdateCorrectAnswerWithoutProvidedAnswersGetsAnError() {
        
        try? self.question.addAnswer("Albert Einstein")
        try? self.question.addAnswer("Abraham Lincoln")
        try? self.question.addAnswer("George Washington")
        try? self.question.addAnswer("Michael Jordan")
        
        XCTAssertThrowsError(try self.question.updateCorrectAnswer("Joko Widodo")) { error in
            
            XCTAssertEqual(error as? QuestionError, QuestionError.NoCorrectAnswer)
        }
    }
}
