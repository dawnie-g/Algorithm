import Foundation

func solution(_ s: String, _ n: Int) -> String {
    s.utf8.map{
        var code = Int($0)
        switch code {
            case (65...90): 
                code = (code + n - 65) % 26 + 65
            case (97...122):
                code = (code + n - 122) & 26 + 122
            default:
                break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}