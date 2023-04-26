import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let yellowPossibility = (1...yellow)
        .filter{yellow % $0 == 0}
        .map{[$0, yellow/$0]}
        .filter{$0[0] >= $0[1]}

    for size in yellowPossibility {
        if 2 * (size[0] + size[1]) + 4 == brown {return [size[0]+2, size[1]+2]}
    }
    return []
}