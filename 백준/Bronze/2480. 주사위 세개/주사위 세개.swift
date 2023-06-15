let dice = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
if dice[0] == dice[1] && dice[0] == dice[2] {
    print(10000 + dice[0] * 1000)
} else if dice[0] != dice[1] && dice[1] != dice[2] && dice[2] != dice[0] {
    print(dice[0] * 100)
} else {
    var pair = 0
    if dice[0] == dice[1]{
        pair = dice[0]
    } else if dice[1] == dice[2] {
        pair = dice[1]
    } else if dice[2] == dice[0] {
        pair = dice[2]
    }
    print(1000 + pair * 100)
}