//
//  ArrayExtensions.swift
//  EasyExchange
//
//  Created by Alberto Sanchez Gomez on 3/1/23.
//

extension Array where Element: Hashable {
    
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
