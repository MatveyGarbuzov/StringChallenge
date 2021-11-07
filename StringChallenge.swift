//
//  StringChallenge
//  avitoTest
//
//  Created by Matvey Garbuzov on 7.11.2021.
//

import Foundation

func StringChallenge(_ str: String) -> Int {
    var myStr = str
    let numbers = [
        "I": 1,
        "2": 2,
        "3": 3,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    ["III": "3", "II": "2"].forEach { myStr = myStr.replacingOccurrences(of: $0.key, with: $0.value) }
    
    var result = 0
    for i in stride(from: myStr.count - 1, through: 0, by: -1) {
        if (numbers[myStr.symbol(at: i)] ?? 0 < numbers[myStr.symbol(at: i + 1)] ?? 0) {
            result -= numbers[myStr.symbol(at: i)] ?? 0
        } else {
            result += numbers[myStr.symbol(at: i)] ?? 0
        }
    }
    
    return result
}

extension String {
    func symbol(at index: Int) -> String {
        return index < count ? String(self[self.index(self.startIndex, offsetBy: index)]) : ""
    }
}

print(StringChallenge("IX"))
