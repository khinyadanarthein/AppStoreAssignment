//
//  NetflixMVPUnitTests.swift
//  NetflixMVPUnitTests
//
//  Created by Khin Yadanar Thein on 11/07/2020.
//  Copyright © 2020 Khin Yadanar Thein. All rights reserved.
//

import XCTest
@testable import NetflixMVP

class NetflixMVPUnitTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_upcoming_list_access() throws {
        //Loading JSON response from resources
        
        let data = try Data.fromJSON(fileName: "search_upcoming_result")
        XCTAssertNotNil(data)
        //Mocking HTTP Response
        let response = HTTPURLResponse(url: URL(string: "https://google.com/")!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)!
        //Mocking URLSession
        let mockSession = MockURLSession(data: data, response: response, error: nil)
        let client = NetworkClient(mockSession)
        //Running synchronously
        client.login(email: "abc@gmail.com", password: "abc123") { (data) in
            XCTAssertNotNil(data)
            XCTAssertEqual(data.id, 1) //Check User ID
        }
    }
    
    func test_upcoming_list_count() {
        
    }
    
}

class MockURLSession : URLSession {
    private let dataTaskMock : MockSessionDataTask
    
    init(data : Data, response : URLResponse , error : Error?) {
        self.dataTaskMock = MockSessionDataTask()
        self.dataTaskMock.taskResponse = (data,response,error)
    }
    
    override func dataTask(with url: URL, completionHandler : @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.dataTaskMock.completionHandler = completionHandler
        return dataTaskMock
    }
}

class MockSessionDataTask: URLSessionDataTask {
    var completionHandler : ((Data?, URLResponse?, Error?) -> Void)?
    var taskResponse: (Data?, URLResponse?, Error?)?
    
    override func resume() {
        completionHandler?(taskResponse?.0, taskResponse?.1, taskResponse?.2)
    }
}
