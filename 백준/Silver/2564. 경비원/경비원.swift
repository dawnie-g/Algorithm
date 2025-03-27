let input = readLine()!.split(separator: " ").map { Int($0)! }
let block: (width: Int, height: Int) = (input[0], input[1])

let shopCount = Int(readLine()!)!
let shops: [Location] = (0..<shopCount).map { _ in toLocation(input: readLine()!) }
let dong: Location = toLocation(input: readLine()!)

var total = 0

for shop in shops {
    if shop.direction == dong.direction {
        total += abs(shop.distance - dong.distance)
    } else if isOpposite(shop.direction, dong.direction) {
        let isDongNS = [1, 2].contains(dong.direction)
        let firstWay = shop.distance + dong.distance
        let secondWay = (isDongNS ? block.width : block.height) * 2 - (firstWay)
        total += min(firstWay, secondWay) + (isDongNS ? block.height : block.width)
    } else {
        if isNW(shop.direction, dong.direction) { // 북서
            total += dong.distance + shop.distance
        } else if isSE(shop.direction, dong.direction) { // 남동
            total += block.width + block.height - shop.distance - dong.distance
        } else { // 북동, 남서
            switch dong.direction {
            case 1:
                total += block.width - dong.distance + shop.distance
            case 2:
                total += dong.distance + block.height - shop.distance
            case 3:
                total += block.height - dong.distance + shop.distance
            case 4:
                total += dong.distance + block.width - shop.distance
            default: break
            }
        }
    }
}

print(total)

func toLocation(input: String) -> Location {
    let arr = input.split(separator: " ").map { Int($0)! }
    return Location(direction: arr[0], distance: arr[1])
}

func isOpposite(_ dir1: Int, _ dir2: Int) -> Bool {
    dir1 == 1 && dir2 == 2 || dir1 == 2 && dir2 == 1 || dir1 == 3 && dir2 == 4 || dir1 == 4 && dir2 == 3
}

func isNW(_ dir1: Int, _ dir2: Int) -> Bool {
    dir1 == 1 && dir2 == 3 || dir1 == 3 && dir2 == 1
}

func isSE(_ dir1: Int, _ dir2: Int) -> Bool {
    dir1 == 2 && dir2 == 4 || dir1 == 4 && dir2 == 2
}

struct Location {
    let direction: Int
    let distance: Int
}
