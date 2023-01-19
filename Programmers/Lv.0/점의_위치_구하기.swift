import Foundation

func solution(_ dot:[Int]) -> Int {
    switch (dot[0], dot[1]){
        case (0..., 0...): return 1
        case (...0, 0...): return 2
        case (...0, ...0): return 3
        case (0..., ...0): return 4
        default: return 0
    }
}