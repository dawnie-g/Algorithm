let input = readLine()!.split{$0 == " "}.map{Int($0)!}
print(readLine()!.split{$0 == " "}.map{Int($0)!}.filter{$0 < input[1]}.map{String($0)}.joined(separator: " "))
