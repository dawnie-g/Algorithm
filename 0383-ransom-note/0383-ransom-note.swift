class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomDict:[Character: Int] = [:]
        var magazineDict:[Character: Int] = [:]

        ransomNote.forEach { char in
            ransomDict[char, default: 0] += 1
        }

        magazine.forEach { char in
            magazineDict[char, default: 0] += 1
        }

        for (key, value) in ransomDict {
            guard let magazineValue = magazineDict[key] else { return false }
            if magazineValue < value { return false }
        }

        return true
    }
}