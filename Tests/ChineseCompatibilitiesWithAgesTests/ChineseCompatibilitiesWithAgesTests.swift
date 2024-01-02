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
}
