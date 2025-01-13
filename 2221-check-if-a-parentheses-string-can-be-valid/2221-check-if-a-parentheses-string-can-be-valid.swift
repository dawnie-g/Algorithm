class Solution {
    func canBeValid(_ s: String, _ locked: String) -> Bool {
        var lockedOpen: [String.Index] = []
        var unlocked: [String.Index] = []
        var i = s.startIndex

        guard s.count % 2 == 0 else { return false }
        if s.first == ")" && locked.first! == "1" { return false }
        if s.last! == "(" && locked.last! == "1" { return false }

        while i < s.endIndex {
            if locked[i] == "0" {
                unlocked.append(i)
            } else if s[i] == "(" {
                lockedOpen.append(i)
            } else if s[i] == ")" {
                if !lockedOpen.isEmpty {
                    lockedOpen.removeLast()
                } else if !unlocked.isEmpty {
                    unlocked.removeLast()
                } else {
                    return false
                }
            }
            i = s.index(after: i)
        }

        while !lockedOpen.isEmpty {
            guard !unlocked.isEmpty else { return false }

            if lockedOpen.last! < unlocked.last! {
                lockedOpen.removeLast()
                unlocked.removeLast()
            } else {
                return false
            }
        }

        return true
    }
}