let n = Int(readLine()!)!
var total = 0
var result = "success"

for _ in 0..<n {
	let line = readLine()!.split(separator: " ")
	let amount = Int(String(line[1]))!
	
	if line[0] == "in" {
		total += amount
	} else {
		if total < amount {
			result = "fail"
			break
		}
		total -= amount
	}
}

print(result)