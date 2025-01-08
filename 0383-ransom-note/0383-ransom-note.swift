class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let ransomDict = Dictionary(grouping: ransomNote) { $0 }
        let magazineDict = Dictionary(grouping: magazine) { $0 }

        for (key, value) in ransomDict {
            guard let magazineValue = magazineDict[key] else { return false }
            if magazineValue.count < value.count { return false }
        }

        return true
    }
}