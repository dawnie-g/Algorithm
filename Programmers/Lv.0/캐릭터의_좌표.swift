import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var loc = [0, 0]
    
    for direction in keyinput{
        switch direction{
        case "up": loc[1] += loc[1] < (board[1]-1)/2 ? 1 : 0
        case "down": loc[1] += loc[1] > -(board[1]-1)/2 ? -1 : 0
        case "right": loc[0] += loc[0] < (board[0]-1)/2 ? 1 : 0
        case "left": loc[0] += loc[0] > -(board[0]-1)/2 ? -1 : 0
        default: return []
        }
    }
    
    return loc
}