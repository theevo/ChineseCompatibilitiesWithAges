//
//  AgeCalculator.swift
//
//
//  Created by Theo Vora on 12/22/23.
//

import Foundation

internal struct AgeCalculator {
    var age: Int
    
    init(birthday: String, today: Date = Date()) throws {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: birthday) else {
            throw Error.invalidBirthdayInputString(date: birthday)
        }
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let today = today
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
