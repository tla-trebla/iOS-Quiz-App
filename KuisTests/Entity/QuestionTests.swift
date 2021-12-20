//
//  QuestionTests.swift
//  KuisTests
//
//  Created by Albert Pangestu on 20/12/21.
//

import XCTest
@testable import Kuis

class QuestionTests: XCTestCase {
    
    func test_InitialQuestion() {
        
        let question = Question()
        
        XCTAssertEqual(question.title, "")
    }
    
    func test_UpdateQuestion() {
        
        var question = Question()
        
        question.updateQuestion("Who invented the E = mc^2?")
        
        XCTAssertEqual(question.title, "Who invented the E = mc^2?")
    }
}
