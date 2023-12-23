//
//  Compatibilities+LocalAnimals.swift
//
//
//  Created by Theo Vora on 12/22/23.
//

import ChineseZodiacCompatibility

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
