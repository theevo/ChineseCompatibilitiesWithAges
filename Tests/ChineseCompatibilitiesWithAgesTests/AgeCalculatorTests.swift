//
//  AgeCalculatorTests.swift
//  
//
//  Created by Theo Vora on 12/22/23.
//

import XCTest
@testable import ChineseCompatibilitiesWithAges

final class AgeCalculatorTests: XCTestCase {
    func test_birthday_10_31_1947_isAge76() throws {
        let sut = try AgeCalculator(birthday: "10-31-1947", today: date("12-22-2023"))
        XCTAssertEqual(sut.age, 76)
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
    
    func test_birthday_01_01_2023_whenTodayIsYear2000_isNegative23() throws {
        let sut = try AgeCalculator(birthday: "01-01-2023", today: date("01-01-2000"))
        XCTAssertEqual(sut.age, -23)
    }
    
    func test_birthday_11_26_1978_on_11_26_2023_isAge45() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: date("11-26-2023"))
        print(sut)
        XCTAssertEqual(sut.age, 45)
    }
    
    func test_birthday_11_26_1978_on_11_26_2024_isAge46() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: date("11-26-2024"))
        print(sut)
        XCTAssertEqual(sut.age, 46)
    }
    
    func test_birthday_11_26_1978_on_11_25_2023_isAge44() throws {
        let sut = try AgeCalculator(birthday: "11-26-1978", today: date("11-25-2023"))
        print(sut)
        XCTAssertEqual(sut.age, 44)
    }
    
    func test_birthday_01_23_1974_on_01_22_2024_isAge49() throws {
        let sut = try AgeCalculator(birthday: "01-23-1974", today: date("01-22-2024"))
        XCTAssertEqual(sut.age, 49)
    }
    
    func test_birthday_01_23_1974_on_01_23_2023_isAge49() throws {
        let sut = try AgeCalculator(birthday: "01-23-1974", today: date("01-23-2023"))
        print(sut)
        XCTAssertEqual(sut.age, 49)
    }
    
    func test_birthday_01_23_1974_on_01_24_2023_isAge50() throws {
        let sut = try AgeCalculator(birthday: "01-23-1974", today: date("01-24-2024"))
        print(sut)
        XCTAssertEqual(sut.age, 50)
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

extension AgeCalculator: CustomStringConvertible {
    public var description: String {
"""
📆     Birthday: \(birthDate)
             On: \(referenceDate)
            Age: \(age)
 dateComponents: \(dateComponents)
"""
    }
}
