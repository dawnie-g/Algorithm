import Foundation

let n = Int(readLine()!)!
let list = readLine()!.split(separator: " ").map{Int($0)!}.sorted()
let m = Int(readLine()!)!
let finding = readLine()!.split(separator: " ").map{Int($0)!}
var str = ""

find: for num in finding {
    var minVal = 0
    var maxVal = n-1
    
    while minVal <= maxVal {
        let mid = (minVal + maxVal) / 2
        if num < list[mid] {
            maxVal = mid - 1
        } else if num > list[mid] {
            minVal = mid + 1
        } else if num == list[mid] {
            str += "1\n"
            continue find
        }
    }
    str += "0\n"
}
print(str)