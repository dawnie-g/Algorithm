func game() {
    let bae = readLine()!.split(separator: " ").filter{$0 == "0"}.count
    switch bae {
    case 1:
        print("A")
    case 2:
        print("B")
    case 3:
        print("C")
    case 4:
        print("D")
    case 0:
        print("E")
    default:
        print("")
    }
}
game()
game()
game()