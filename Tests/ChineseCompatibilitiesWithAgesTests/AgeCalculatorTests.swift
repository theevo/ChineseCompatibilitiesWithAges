//
//  AgeCalculatorTests.swift
//  
//
//  Created by Theo Vora on 12/22/23.
//

import XCTest
@testable import ChineseCompatibilitiesWithAges

final class AgeCalculatorTests: XCTestCase {
    func test_birthday_11_26_1978_isAge45() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: date("12-22-2023"))
        XCTAssertEqual(sut.age, 45)
    }
    
    func test_birthday_10_31_1947_isAge76() throws {
        let sut = try AgeCalculator(birthday: "10-31-1947", today: date("12-22-2023"))
        XCTAssertEqual(sut.age, 76)
    }
    
    func test_birthday_11_26_1978_isAge44() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: date("01-01-2023"))
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
    
    func test_1dayOld_isAgeZero() throws {
        let sut = try AgeCalculator(birthday: "01-02-2023", today: date("01-01-2023"))
        XCTAssertEqual(sut.age, 0)
    }
    
    func test_364daysOld_isAgeZero() throws {
        let sut = try AgeCalculator(birthday: "01-01-2022", today: date("12-31-2022"))
        XCTAssertEqual(sut.age, 0)
    }
    
    func test_dates1YearApart_isAgeOne() throws {
        let sut = try AgeCalculator(birthday: "01-01-2022", today: date("01-01-2023"))
        XCTAssertEqual(sut.age, 1)
    }
    
    func test_futureBirthdate_isNegative() throws {
        let sut = try AgeCalculator(birthday: "01-01-2023", today: date("01-01-2000"))
        XCTAssertEqual(sut.age, -23)
    }
    
    // MARK: - Helpers
    
    func date(_ string: String) -> Date {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: string) else {
            fatalError()
        }
        return swiftDate
    }
}
