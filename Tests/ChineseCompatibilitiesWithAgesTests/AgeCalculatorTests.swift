//
//  AgeCalculatorTests.swift
//  
//
//  Created by Theo Vora on 12/22/23.
//

import XCTest
@testable import ChineseCompatibilitiesWithAges

final class AgeCalculatorTests: XCTestCase {
    var dec222023: Date {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: "12-22-2023") else {
            fatalError()
        }
        return swiftDate
    }
    
    var jan012023: Date {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: "01-01-2023") else {
            fatalError()
        }
        return swiftDate
    }
    
    func test_birthday_11_26_1978_isAge45() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: dec222023)
        XCTAssertEqual(sut.age, 45)
    }
    
    func test_birthday_10_31_1947_isPig() throws {
        let sut = try AgeCalculator(birthday: "10-31-1947", today: dec222023)
        XCTAssertEqual(sut.age, 76)
    }
    
    func test_birthday_11_26_1978_isAge44() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: jan012023)
        XCTAssertEqual(sut.age, 44)
    }
    
    func test_invalidBirthday_throwsError() throws {
        var thrownError: Error?
        
        XCTAssertThrowsError(try AgeCalculator(birthday: "1999-01-01")) {
            thrownError = $0
        }
        
        guard let localError = thrownError as? AgeCalculator.Error else {
            XCTFail("Expected \"AgeCalculator.Error\". Received instead type: \(type(of: thrownError))")
            return
        }
        
        guard case .invalidBirthdayInputString(_) = localError else {
            XCTFail("Expected \"failedToParseDate\" error, but was \(localError) instead.")
            return
        }

        XCTAssertTrue(true)
    }
}
