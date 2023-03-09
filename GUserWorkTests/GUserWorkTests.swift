//
//  GUserWorkTests.swift
//  GUserWorkTests
//
//  Created by 蕭文安的M1 on 2023/3/8.
//

import XCTest
import Moya
@testable import GUserWork

final class GUserWorkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGitHubUserList() throws {
        let expectation = expectation(description: "GetGUserList")
        GUser.request(.list) { data in
            print(String(data: data, encoding: .utf8)!)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15)
        XCTAssert(true)
        
    }
    
    func testGitHubUserDetail() throws {
        let expectation = expectation(description: "GetGUserDetail")
        GUser.request(.detail("tkdmaf")) { data in
            print(String(data: data, encoding: .utf8)!)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 15)
        XCTAssert(true)
    }
    
    func testListForRequest() throws {
        let expect = expectation(description: "GetGUserList")
        GUser.lists { datas in
            print(datas)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 15)
        XCTAssert(true)
    }
    
    func testDetailForRequest() throws {
        let expect = expectation(description: "GetGUserDetail")
        GUser.detail("tkdmaf") { data in
            print(data)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 15)
        XCTAssert(true)
    }

}
