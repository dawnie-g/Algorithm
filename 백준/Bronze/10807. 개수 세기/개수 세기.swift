let len = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map{Int(String($0))!}
let num = Int(readLine()!)!

print(array.filter{$0 == num}.count)