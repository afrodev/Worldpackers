//
//  Injectable.swift
//  Worldpackers
//
//  Created by Humberto Vieira on 16/01/17.
//  Copyright © 2017 Humberto Vieira. All rights reserved.
//

import Foundation

protocol Injectable {
    associatedtype T
    func inject(_:T)
    func assertDependencies()
}
