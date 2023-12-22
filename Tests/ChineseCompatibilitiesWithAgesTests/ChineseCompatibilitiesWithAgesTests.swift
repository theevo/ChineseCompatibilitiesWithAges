import XCTest
import ChineseCompatibilitiesWithAges

final class ChineseCompatibilitiesWithAgesTests: XCTestCase {
    func test_birthday_11_26_1978_isHorse_isAge45() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "11-26-1978")
        XCTAssertEqual(sut.animal, .Horse)
        XCTAssertEqual(sut.age, 45)
    }
    
    func test_birthday_10_31_1947_isPig_isAge75() throws {
        let sut = try ChineseCompatibilitiesWithAges(birthday: "10-31-1947")
        XCTAssertEqual(sut.animal, .Pig)
        XCTAssertEqual(sut.age, 76)
    }
}
