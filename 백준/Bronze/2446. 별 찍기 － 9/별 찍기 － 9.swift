let n = Int(readLine()!)!

for i in 0..<n {
print(String(repeating: " ", count: i) + String(repeating: "*", count: 2*(n-i)-1))
}
for i in 1..<n {
print(String(repeating: " ", count: n-i-1) + String(repeating: "*", count: 2*i+1))
}