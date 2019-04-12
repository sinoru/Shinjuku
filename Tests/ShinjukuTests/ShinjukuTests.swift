//
//  ShinjukuTests.swift
//  Shinjuku
//
//  Created by Jaehong Kang on 12/04/2019.
//  Copyright © 2019 Jaehong Kang. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import XCTest
@testable import Shinjuku

final class ShinjukuTests: XCTestCase {
    func testSafeSync() {
        let expectation = XCTestExpectation(description: "Wait for other queue done.")

        let queue = DispatchQueue(label: "")

        queue.async {
            let result = queue.safeSync {
                return true
            }

            XCTAssertTrue(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testSafeSyncWorkItem() {
        let expectation = XCTestExpectation(description: "Wait for other queue done.")

        let queue = DispatchQueue(label: "")

        queue.async {
            var result: Bool = false

            queue.safeSync(execute: DispatchWorkItem(qos: .background, block: {
                result = true
            }))

            XCTAssertTrue(result)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    static var allTests = [
        ("testSafeSync", testSafeSync),
    ]
}
