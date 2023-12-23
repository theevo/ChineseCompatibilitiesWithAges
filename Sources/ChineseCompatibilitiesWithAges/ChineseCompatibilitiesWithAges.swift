// The Swift Programming Language
// https://docs.swift.org/swift-book

import SexagenaryCycle1924
import ChineseZodiacCompatibility

public struct ChineseCompatibilitiesWithAges {
    public var animal: Animal
    public var age: Int
    public var compatibilities: [Compatibilities.Animal]
    
    public init(birthday: String) throws {
        let query = try ZodiacQuery(birthday: birthday)
        self.animal = Animal(name: query.animal.name)
        self.age = try AgeCalculator(birthday: birthday).age
        let animal = Compatibilities.Animal(name: query.animal.name)
        self.compatibilities = Compatibilities.of(animal: animal)
    }
}

extension ChineseCompatibilitiesWithAges {
    public enum Animal {
        case Rat
        case Ox
        case Tiger
        case Rabbit
        case Dragon
        case Snake
        case Horse
        case Goat
        case Monkey
        case Rooster
        case Dog
        case Pig
        
        init(name: SexagenaryAnimal.Name) {
            switch name {
            case .Rat:
                self = .Rat
            case .Ox:
                self = .Ox
            case .Tiger:
                self = .Tiger
            case .Rabbit:
                self = .Rabbit
            case .Dragon:
                self = .Dragon
            case .Snake:
                self = .Snake
            case .Horse:
                self = .Horse
            case .Goat:
                self = .Goat
            case .Monkey:
                self = .Monkey
            case .Rooster:
                self = .Rooster
            case .Dog:
                self = .Dog
            case .Pig:
                self = .Pig
            }
        }
    }
}

extension Compatibilities.Animal {
    init(name: SexagenaryAnimal.Name) {
        switch name {
        case .Rat:
            self = .Rat
        case .Ox:
            self = .Ox
        case .Tiger:
            self = .Tiger
        case .Rabbit:
            self = .Rabbit
        case .Dragon:
            self = .Dragon
        case .Snake:
            self = .Snake
        case .Horse:
            self = .Horse
        case .Goat:
            self = .Goat
        case .Monkey:
            self = .Monkey
        case .Rooster:
            self = .Rooster
        case .Dog:
            self = .Dog
        case .Pig:
            self = .Pig
        }
    }
}
