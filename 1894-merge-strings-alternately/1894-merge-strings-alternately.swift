class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var arr1: [Character] = []
        var arr2: [Character] = []
        var size1 = 0
        var size2 = 0

        word1.forEach {
            arr1.append($0)
            size1 += 1
        }

        word2.forEach {
            arr2.append($0)
            size2 += 1
        }

        var ans = ""

        if size1 != size2 {
            let minSize = min(size1, size2)

            for i in 0..<minSize {
                ans += String(arr1[i])
                ans += String(arr2[i])
            }

            ans += size1 > size2 ? String(arr1[minSize...size1 - 1]) : String(arr2[minSize...size2 - 1])
        } else {
            for i in 0..<size1 {
                ans += String(arr1[i])
                ans += String(arr2[i])
            }
        }

        return ans
    }
}