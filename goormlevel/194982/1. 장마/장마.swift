let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var ground = readLine()!.split(separator: " ").map { Int($0)! }

var rained = [Int](repeating: 0, count: n + 1)
for day in 1...m {
	let se = readLine()!.split(separator: " ").map { Int($0)! }
	let s = se[0], e = se[1]
	
	for i in s-1..<e {
		ground[i] += 1
		rained[i] = day
	}
	
	if day % 3 == 0 {
		for i in 0..<n {
			if rained[i] >= day - 2 {
				ground[i] -= 1
			}
		}
	}
}

var str = ""
for height in ground {
	str += "\(height) "
}
print(str)