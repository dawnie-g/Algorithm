import Foundation

func solution(_ babbling:[String]) -> Int {
    var value = 0
    var word = ""
    for S in babbling {
        word = S
        if !word.contains("ayaaya") {
            word = word.replacingOccurrences(of: "aya", with: "")
        }
        if !word.contains("yeye") {
            word = word.replacingOccurrences(of: "ye", with: "")
        }
        if !word.contains("woowoo") {
            word = word.replacingOccurrences(of: "woo", with: "")
        }
        if !word.contains("mama") {
            word = word.replacingOccurrences(of: "ma", with: "")
        }

        if word == "" { value += 1}

    }

    return value
}
