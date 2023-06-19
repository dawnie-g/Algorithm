let n = readLine()!.split(separator: " ").map{Int(String($0))!} // [student, room personnel]
var room: [String] = []
for _ in 1...n[0] {
    room.append(readLine()!)
}

var count = 0
for student in Dictionary(grouping: room) {$0} {
    count += student.value.count % n[1] == 0 ? student.value.count / n[1] : student.value.count / n[1] + 1
}

print(count)