// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import SexagenaryCycle1924

public struct ChineseCompatibilitiesWithAges {
    public var animal: SexagenaryAnimal.Name
    public var age: Int
    
    public init(birthday: String) throws {
        let query = try ZodiacQuery(birthday: birthday)
        self.animal = query.animal.name
        self.age = try AgeCalculator(birthday: birthday).age
    }
}

internal struct AgeCalculator {
    var age: Int
    
    init(birthday: String) throws {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: birthday) else {
            throw Error.invalidBirthdayInputString(date: birthday)
        }
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let today = Date()
        let dateComponents = gregorianCalendar.dateComponents([.year], from: swiftDate, to: today)
        
        guard let years = dateComponents.year else { throw Error.invalidBirthdayInputString(date: birthday) }
        
        self.age = years
    }
}

extension AgeCalculator {
    enum Error: LocalizedError {
        case invalidBirthdayInputString(date: String)
        
        var description: String {
            switch self {
            case .invalidBirthdayInputString(let date):
                return "Invalid birthdate: \(date). Format must be MM-DD-YYYY."
            }
        }
    }
}
