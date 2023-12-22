// The Swift Programming Language
// https://docs.swift.org/swift-book

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
