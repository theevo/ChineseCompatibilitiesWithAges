import XCTest
import ChineseCompatibilitiesWithAges

final class ChineseCompatibilitiesWithAgesTests: XCTestCase {
    func test_birthday_11_26_1978_isHorse() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "11-26-1978")
        XCTAssertEqual(sut.animal, .Horse)
    }
    
    func test_birthday_10_31_1947_isPig() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "10-31-1947")
        XCTAssertEqual(sut.animal, .Pig)
    }
    
    func test_birthday_08_01_1976_isDragon_compatibleWith_Rat_Monkey_Rooster() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(sut.animal, .Dragon)
        XCTAssertTrue(sut.compatibilities.contains(.Rat))
        XCTAssertTrue(sut.compatibilities.contains(.Monkey))
        XCTAssertTrue(sut.compatibilities.contains(.Rooster))
    }
    
    func test_birthday_08_01_1976_nearestRoostersAre5yearsYoungerAnd7yearsOlder() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(sut.animal, .Dragon)
        XCTAssertEqual(sut.nearestNeighbors[.Rooster], [-5, 7])
    }
    
    func test_birthday_08_01_1976_nearestNeighborsContainRat_Monkey_rooster() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(sut.animal, .Dragon)
        let neighbors = sut.nearestNeighbors.keys
        XCTAssertEqual(neighbors.count, 3)
        XCTAssertTrue(neighbors.contains(.Rooster))
        XCTAssertTrue(neighbors.contains(.Rat))
        XCTAssertTrue(neighbors.contains(.Monkey))
    }
    
    func test_birthday_08_01_1976_nearestNeighbor_Rat_is4YearsOlder_and_8yearsYounger() throws {
        let dragon = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(dragon.animal, .Dragon)
        let sut = try XCTUnwrap(dragon.nearestNeighbors[.Rat])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(4))
        XCTAssertTrue(sut.contains(-8))
    }
    
    func test_birthday_08_01_1976_nearestNeighbor_Rooster_is7YearsOlder_and_5yearsYounger() throws {
        let dragon = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(dragon.animal, .Dragon)
        let sut = try XCTUnwrap(dragon.nearestNeighbors[.Rooster])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(7))
        XCTAssertTrue(sut.contains(-5))
    }
    
    func test_birthday_08_01_1976_nearestNeighbor_Monkey_is8YearsOlder_and_4yearsYounger() throws {
        let dragon = try ChineseCompatibilitiesWithAges(birthday: "08-01-1976")
        XCTAssertEqual(dragon.animal, .Dragon)
        let sut = try XCTUnwrap(dragon.nearestNeighbors[.Monkey])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(8))
        XCTAssertTrue(sut.contains(-4))
    }
    
    func test_distanceBetween_Rat_and_Dragon_are_8yearsOlder_and_4yearsYounger() {
        let rat = ChineseCompatibilitiesWithAges.Animal.Rat
        let dragon = ChineseCompatibilitiesWithAges.Animal.Dragon
        let distances = rat...dragon
        XCTAssertEqual(distances.count, 2)
        XCTAssertTrue(distances.contains(-4))
        XCTAssertTrue(distances.contains(8))
    }
    
    func test_distanceBetween_Dragon_and_Dragon_are_3values_negative12_0_positive12() {
        let dragon = ChineseCompatibilitiesWithAges.Animal.Dragon
        let distances = dragon...dragon
        XCTAssertEqual(distances.count, 3)
        XCTAssertTrue(distances.contains(-12))
        XCTAssertTrue(distances.contains(0))
        XCTAssertTrue(distances.contains(12))
    }
    
    func test_distanceBetween_Pig_and_Rat_are_11yearsOlder_or_1yearYounger() {
        let pig = ChineseCompatibilitiesWithAges.Animal.Pig
        let rat = ChineseCompatibilitiesWithAges.Animal.Rat
        let distances = pig...rat
        XCTAssertEqual(distances.count, 2)
        XCTAssertTrue(distances.contains(11))
        XCTAssertTrue(distances.contains(-1))
    }
    
    func test_distanceBetween_Rat_and_Pig_are_1yearOlder_or_11yearsYounger() {
        let pig = ChineseCompatibilitiesWithAges.Animal.Pig
        let rat = ChineseCompatibilitiesWithAges.Animal.Rat
        let distances = rat...pig
        XCTAssertEqual(distances.count, 2)
        XCTAssertTrue(distances.contains(1))
        XCTAssertTrue(distances.contains(-11))
    }
    
    func test_birthday_07_20_1947_isPig_nearestTigersAre_9yearsOlder_and_3yearsYounger() throws {
        let pig = try ChineseCompatibilitiesWithAges(birthday: "07-20-1947")
        XCTAssertEqual(pig.animal, .Pig)
        XCTAssertEqual(pig.nearestNeighbors.count, 3)
        let sut = try XCTUnwrap(pig.nearestNeighbors[.Tiger])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(9))
        XCTAssertTrue(sut.contains(-3))
    }
    
    func test_birthday_07_20_1947_isPig_nearestRabbitsAre_8yearsOlder_and_4yearsYounger() throws {
        let pig = try ChineseCompatibilitiesWithAges(birthday: "07-20-1947")
        XCTAssertEqual(pig.animal, .Pig)
        XCTAssertEqual(pig.nearestNeighbors.count, 3)
        let sut = try XCTUnwrap(pig.nearestNeighbors[.Rabbit])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(8))
        XCTAssertTrue(sut.contains(-4))
    }
    
    func test_birthday_07_20_1947_isPig_nearestGoatsAre_4yearsOlder_and_8yearsYounger() throws {
        let pig = try ChineseCompatibilitiesWithAges(birthday: "07-20-1947")
        XCTAssertEqual(pig.animal, .Pig)
        XCTAssertEqual(pig.nearestNeighbors.count, 3)
        let sut = try XCTUnwrap(pig.nearestNeighbors[.Goat])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(4))
        XCTAssertTrue(sut.contains(-8))
    }
    
    func test_birthday_02_24_1955_isGoat_nearestGoatsAre_12yearsOlder_sameYear_12yearsYounger() throws {
        let goat = try ChineseCompatibilitiesWithAges(birthday: "02-24-1955")
        XCTAssertEqual(goat.animal, .Goat)
        XCTAssertEqual(goat.nearestNeighbors.count, 4)
        let sut = try XCTUnwrap(goat.nearestNeighbors[.Goat])
        XCTAssertEqual(sut.count, 3)
        XCTAssertTrue(sut.contains(12))
        XCTAssertTrue(sut.contains(0))
        XCTAssertTrue(sut.contains(-12))
    }
    
    func test_birthday_02_24_1955_isGoat_nearestRabbitsAre_4yearsOlder_8yearsYounger() throws {
        let goat = try ChineseCompatibilitiesWithAges(birthday: "02-24-1955")
        let sut = try XCTUnwrap(goat.nearestNeighbors[.Rabbit])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(4))
        XCTAssertTrue(sut.contains(-8))
    }
    
    func test_birthday_02_24_1955_isGoat_nearestHorsesAre_1yearsOlder_11yearsYounger() throws {
        let goat = try ChineseCompatibilitiesWithAges(birthday: "02-24-1955")
        let sut = try XCTUnwrap(goat.nearestNeighbors[.Horse])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(1))
        XCTAssertTrue(sut.contains(-11))
    }
    
    func test_birthday_02_24_1955_isGoat_nearestPigsAre_8yearsOlder_4yearsYounger() throws {
        let goat = try ChineseCompatibilitiesWithAges(birthday: "02-24-1955")
        let sut = try XCTUnwrap(goat.nearestNeighbors[.Pig])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(8))
        XCTAssertTrue(sut.contains(-4))
    }
    
    func test_birthday_08_30_1930_isHorse_nearestTigersAre_4yearsOlder_8yearsYounger() throws {
        let horse = try ChineseCompatibilitiesWithAges(birthday: "08-30-1930")
        XCTAssertEqual(horse.animal, .Horse)
        let sut = try XCTUnwrap(horse.nearestNeighbors[.Tiger])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(-8))
        XCTAssertTrue(sut.contains(4))
    }
    
    func test_birthday_08_30_1930_isHorse_nearestGoatsAre_11yearsOlder_1yearsYounger() throws {
        let horse = try ChineseCompatibilitiesWithAges(birthday: "08-30-1930")
        let sut = try XCTUnwrap(horse.nearestNeighbors[.Goat])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(-1))
        XCTAssertTrue(sut.contains(11))
    }
    
    func test_birthday_08_30_1930_isHorse_nearestDogsAre_8yearsOlder_4yearsYounger() throws {
        let horse = try ChineseCompatibilitiesWithAges(birthday: "08-30-1930")
        let sut = try XCTUnwrap(horse.nearestNeighbors[.Dog])
        XCTAssertEqual(sut.count, 2)
        XCTAssertTrue(sut.contains(-4))
        XCTAssertTrue(sut.contains(8))
    }
}
