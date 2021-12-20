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
        
        self.question.addAnswer("Albert Einstein")
        XCTAssertEqual(self.question.answers, ["Albert Einstein"])
    }
}
