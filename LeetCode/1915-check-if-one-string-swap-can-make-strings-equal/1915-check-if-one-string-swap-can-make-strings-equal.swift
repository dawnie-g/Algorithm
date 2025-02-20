class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        var diffChars: (Character, Character) = (" ", " ")

        for (c1, c2) in zip(s1, s2) where c1 != c2 {
            if diffChars == ("!", "!") { return false }

            if diffChars == (" ", " ") {
                diffChars = (c1, c2)
            } else {
                if diffChars.0 == c2 && diffChars.1 == c1 {
                    diffChars = ("!", "!")
                } else { 
                    return false 
                }
            }
        }

        return diffChars == (" ", " ") || diffChars == ("!", "!")
    }
}