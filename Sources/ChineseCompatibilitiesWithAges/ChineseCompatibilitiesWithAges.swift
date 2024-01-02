// The Swift Programming Language
// https://docs.swift.org/swift-book

import SexagenaryCycle1924
import ChineseZodiacCompatibility

public struct ChineseCompatibilitiesWithAges {
    public var animal: Animal
    public var age: Int
    public var compatibilities: [Animal]
    public var nearestNeighbors: [Animal: Set<Int>]
    
    public init(birthday: String) throws {
        let query = try ZodiacQuery(birthday: birthday)
        let animal = Animal(name: query.animal.name)
        self.animal = animal
        self.age = try AgeCalculator(birthday: birthday).age
        self.compatibilities = Compatibilities.of(agesAnimal: animal)
        var dict: [Animal: Set<Int>] = [:]
        for compatibility in compatibilities {
            dict[compatibility] = [1]
        }
        dict[.Rooster] = [-5, 7]
        self.nearestNeighbors = dict
    }
}

extension ChineseCompatibilitiesWithAges {
    public enum Animal: Int {
        case Rat = 1
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

extension ChineseCompatibilitiesWithAges.Animal {
    public static func ...(lhs: ChineseCompatibilitiesWithAges.Animal, rhs: ChineseCompatibilitiesWithAges.Animal) -> [Int] {
        let diff1 = lhs.rawValue - rhs.rawValue
        let diff2 = -(12 - diff1)
        return [diff1, diff2]
    }
}
