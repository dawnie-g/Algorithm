import Foundation

let n = Int(readLine()!)!
let board = (1...n).map{_ in readLine()!.split(separator: " ").map{Int(String($0))!}}
var ans = 0
for i in 0..<n {
    for j in 0..<n {
        ans = max(ans, board[i][j])
    }
}

func merge(to direction: Character, board: [[Int]]) -> [[Int]] {
    // direction: "0" -> up, "1" -> right, "2" -> down, "3" -> left
    var board = board
    var nums = [Int]()
    var new = [[Int]](repeating: [], count: n)
    var trigger = true
    
    for i in 0..<n {
        nums = []
        for j in 0..<n {
            switch direction { // merge
            case "0":
                if board[j][i] != 0 {
                    if !nums.isEmpty && nums.last == board[j][i] && trigger {
                        nums[nums.count-1] *= 2
                        ans = max(ans, nums.last!)
                        trigger = false
                    } else {
                        nums.append(board[j][i])
                        trigger = true
                    }
                }
            case "1":
                if board[i][n-1-j] != 0 {
                    if !nums.isEmpty && nums.last == board[i][n-1-j] && trigger {
                        nums[nums.count-1] *= 2
                        ans = max(ans, nums.last!)
                        trigger = false
                    } else {
                        nums.append(board[i][n-1-j])
                        trigger = true
                    }
                }
            case "2":
                if board[n-1-j][i] != 0 {
                    if !nums.isEmpty && nums.last == board[n-1-j][i] && trigger {
                        nums[nums.count-1] *= 2
                        ans = max(ans, nums.last!)
                        trigger = false
                    } else {
                        nums.append(board[n-1-j][i])
                        trigger = true
                    }
                }
            default:
                if board[i][j] != 0 {
                    if !nums.isEmpty && nums.last == board[i][j] && trigger {
                        nums[nums.count-1] *= 2
                        ans = max(ans, nums.last!)
                        trigger = false
                    } else {
                        nums.append(board[i][j])
                        trigger = true
                    }
                }
            }
        }
        
        switch direction { // swipe
        case "0":
            nums += nums.count < n ? [Int](repeating: 0, count: n-nums.count) : []
            for k in 0..<n {
                new[k].append(nums[k])
            }
        case "1":
            nums = nums.count < n ? [Int](repeating: 0, count: n-nums.count) + nums.reversed() : nums.reversed()
            new[i] = nums
        case "2":
            nums = nums.count < n ? [Int](repeating: 0, count: n-nums.count) + nums.reversed() : nums.reversed()
            for k in 0..<n {
                new[k].append(nums[k])
            }
        default:
            nums += nums.count < n ? [Int](repeating: 0, count: n-nums.count) : []
            new[i] = nums
        }
    }
    return new
}

for i in 0..<1024 {
    var copy = board
    let directions = String(format: "%05d", Int(String(i, radix: 4))!).map{$0}
    for d in directions {
        copy = merge(to: d, board: copy)
    }
}

print(ans)