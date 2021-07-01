//
//  main.swift
//  TestSample1
//
//  Created by Christopher Alford on 1/7/21.
//

import Foundation

// Find the smallest positive number missing from an unsorted array
public func solution(_ a: inout [Int]) -> Int {
    
    // Remove negatives
    let positives = a.filter {
        return $0 > 0
    }
    
    // The array only contained negative numbers or 0
    if positives.isEmpty {
        return 1
    }
    
    let uniquePositives = Set(positives).sorted()
    var lowValue = 0
    
    for i in 0..<uniquePositives.count {
        let highValue = uniquePositives[i]
        if lowValue < highValue - 1 {
            return lowValue + 1
        } else {
            lowValue = highValue
        }
    }
    
    // Should never get called
    return -1
}

var A = [-1,-2,0]
print(solution(&A))
