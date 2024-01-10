//
//  AgeCalculator.swift
//
//
//  Created by Theo Vora on 12/22/23.
//

import Foundation

internal struct AgeCalculator {
    var age: Int
    var birthDate: Date
    let referenceDate: Date
    var dateComponents: DateComponents
    
    init(birthday: String, on: Date = Date()) throws {
        let formatter = DateFormatter.inUTCTimeZone(dateFormat: "MM-dd-yyyy")
        guard let swiftDate = formatter.date(from: birthday) else {
            throw Error.invalidBirthdayInputString(date: birthday)
        }
        
        self.birthDate = swiftDate
        self.referenceDate = on
        
        let gregorianCalendar = Calendar.gregorianUTC
        let dateComponents = gregorianCalendar.dateComponents([.year, .month, .day], from: swiftDate, to: on)
        
        self.dateComponents = dateComponents
        
        guard let years = dateComponents.year else {
            throw Error.dateComponentsFailedToGetYear(dateComponents: dateComponents)
        }
        
        self.age = years
    }
}

extension AgeCalculator {
    enum Error: LocalizedError {
        case invalidBirthdayInputString(date: String)
        case dateComponentsFailedToGetYear(dateComponents: DateComponents)
        
        var description: String {
            switch self {
            case .invalidBirthdayInputString(let date):
                return "Invalid birthdate: \(date). Format must be MM-DD-YYYY."
            case .dateComponentsFailedToGetYear(let dateComponents):
                return "DateComponents failed to get years. DateComponents = \(dateComponents)"
            }
        }
    }
}

extension Calendar {
    public static var gregorianUTC: Calendar {
        var gregorianCalendar = Calendar(identifier: .gregorian)
        gregorianCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return gregorianCalendar
    }
}
