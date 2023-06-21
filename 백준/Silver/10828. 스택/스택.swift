let n = Int(readLine()!)!
var stack = [Int](repeating: 0, count: n)
var pos = 0

for _ in 0..<n {
	let input = readLine()!.split(separator: " ")
	switch input.first! {
	case "push":
		stack[pos] = Int(input[1])!
		pos += 1
	case "pop":
		if pos > 0 {
		pos -= 1
			print(stack[pos])
		} else {
			print(-1)
		}
	case "size":
		print(pos)
	case "empty":
		print(pos == 0 ? 1 : 0)
	case "top":
		if pos > 0 {
			print(stack[pos-1])
		} else {
			print(-1)
		}
	default: break
	}
}