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
    
    func test_distanceBetween_Dragon_and_Rat_are_4yearsOlder_and_8yearsYounger() {
        let dragon = ChineseCompatibilitiesWithAges.Animal.Dragon
        let rat = ChineseCompatibilitiesWithAges.Animal.Rat
        let distances = dragon...rat
        XCTAssertEqual(distances.count, 2)
        XCTAssertTrue(distances.contains(4))
        XCTAssertTrue(distances.contains(-8))
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
}
