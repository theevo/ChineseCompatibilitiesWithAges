// The Swift Programming Language
// https://docs.swift.org/swift-book

import SexagenaryCycle1924
import ChineseZodiacCompatibility

public struct ChineseCompatibilitiesWithAges {
    public var animal: Animal
    public var age: Int
    public var compatibilities: [Animal]
    
    public init(birthday: String) throws {
        let query = try ZodiacQuery(birthday: birthday)
        let animal = Animal(name: query.animal.name)
        self.animal = animal
        self.age = try AgeCalculator(birthday: birthday).age
        self.compatibilities = Compatibilities.of(agesAnimal: animal)
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
        
        init(compatibilitiesAnimal: Compatibilities.Animal) {
            switch compatibilitiesAnimal {
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
    init(animal: ChineseCompatibilitiesWithAges.Animal) {
        switch animal {
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

extension Compatibilities {
    static func of(agesAnimal: ChineseCompatibilitiesWithAges.Animal) -> [ChineseCompatibilitiesWithAges.Animal] {
        let animal = Compatibilities.Animal(animal: agesAnimal)
        
        let compatibilities = Compatibilities.of(animal: animal)
        
        let agesAnimals = compatibilities.map { compatAnimal in
            ChineseCompatibilitiesWithAges.Animal(compatibilitiesAnimal: compatAnimal)
        }
        
        return agesAnimals
    }
}
