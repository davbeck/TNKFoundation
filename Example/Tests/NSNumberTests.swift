import XCTest
import TNKFoundation


class NSNumberTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
	}
	
	func testInt8() {
		let number = Int8.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testInt16() {
		let number = Int16.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testInt32() {
		let number = Int32.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testInt64() {
		let number = Int64.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testUInt8() {
		let number = UInt8.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testUInt16() {
		let number = UInt8.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testUInt32() {
		let number = UInt8.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testUInt64() {
		let number = UInt8.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testInt() {
		let number = Int.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testUInt() {
		let number = UInt.max - 1
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testBoolTrue() {
		let number = true
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testBoolFalse() {
		let number = false
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testFloat() {
		let number: Float = 43682.2735
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
	
	func testDouble() {
		let number: Double = 436782.2794267242435 * pow(10, 100)
		XCTAssertEqual(NSNumber(number).rawValue(), number)
	}
}
