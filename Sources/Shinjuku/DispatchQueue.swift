//
//  DispatchQueue.swift
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

import Foundation

extension DispatchQueue {
    private static let isCurrentQueueKey = DispatchSpecificKey<Bool>()

    ///
    /// - parameter execute: The work item to be invoked on the queue.
    /// - SeeAlso: `sync(execute:)`
    ///
    @available(OSX 10.10, iOS 8.0, *)
    public func safeSync(execute workItem: DispatchWorkItem) {
        self.setSpecific(key: DispatchQueue.isCurrentQueueKey, value: true)
        defer {
            self.setSpecific(key: DispatchQueue.isCurrentQueueKey, value: nil)
        }

        guard DispatchQueue.getSpecific(key: DispatchQueue.isCurrentQueueKey) == true else {
            return self.sync(execute: workItem)
        }

        return workItem.perform()
    }

    ///
    /// - parameter execute: The work item to be invoked on the queue.
    /// - returns the value returned by the work item.
    /// - SeeAlso: `sync<T>(execute:)`
    ///
    public func safeSync<T>(execute work: () throws -> T) rethrows -> T {
        self.setSpecific(key: DispatchQueue.isCurrentQueueKey, value: true)
        defer {
            self.setSpecific(key: DispatchQueue.isCurrentQueueKey, value: nil)
        }

        guard DispatchQueue.getSpecific(key: DispatchQueue.isCurrentQueueKey) == true else {
            return try self.sync(execute: work)
        }

        return try work()
    }
}
