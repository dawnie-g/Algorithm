class Solution {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        let happyChar: [Character] = ["a", "b", "c"]
        var happyCount = 0
        var result = ""

        func happyBT(_ str: String, _ count: Int) {
            if count == n {
                happyCount += 1
                if happyCount == k {
                    result = str
                }
                return
            }

            for char in happyChar where result.isEmpty {
                if str.isEmpty || str.last != char {
                    happyBT(str + "\(char)", count + 1)
                }
            }
        }

        happyBT("", 0)
        
        return result
    }
}