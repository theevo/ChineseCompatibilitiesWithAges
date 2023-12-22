// The Swift Programming Language
// https://docs.swift.org/swift-book

import SexagenaryCycle1924

public struct ChineseCompatibilitiesWithAges {
    public var animal: SexagenaryAnimal.Name
    
    public init(birthday: String) throws {
        let query = try ZodiacQuery(birthday: birthday)
        self.animal = query.animal.name
    }
}
