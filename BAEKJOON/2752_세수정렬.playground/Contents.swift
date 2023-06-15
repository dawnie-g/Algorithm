print(readLine()!.split(separator: " ").map{Int($0)!}.sorted().map{String($0)}.joined(separator: " "))
