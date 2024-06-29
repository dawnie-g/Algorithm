import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var ans = [Int]()
    
    outer: for place in places {
        var room: [[String]] = place.map { $0.map { String($0) }}
        
        for i in 0..<5 {
            for j in 0..<5 where room[i][j] == "P" {
                // 오른쪽과 아래 둘 다 X면 다음 P로 이동
                if 0..<5 ~= i+1 && 0..<5 ~= j+1 && room[i+1][j] == "X" && room[i][j+1] == "X" { continue }
                // 오른쪽이나 아래가 P면 0을 추가하고 다음 대기실(place)로 이동
                if (0..<5 ~= i+1 && room[i+1][j] == "P") || (0..<5 ~= j+1 && room[i][j+1] == "P") {
                    ans.append(0)
                    continue outer
                }
                
                // 대각선 오른쪽 아래가 P이고, 오른쪽이나 아래가 O면 0을 추가하고 다음 대기실로 이동
                if (0..<5 ~= i+1 && 0..<5 ~= j+1) && ((room[i+1][j] == "O" || room[i][j+1] == "O") && room[i+1][j+1] == "P") {
                    ans.append(0)
                    continue outer
                }
                
                // 대각선 오른쪽 위가 P이고, 오른쪽이나 위가 O면 0을 추가하고 다음 대기실로 이동
                if (1..<4 ~= i && 0..<5 ~= j+1) && (room[i-1][j] == "O" || room[i][j+1] == "O") && room[i-1][j+1] == "P" {
                    ans.append(0)
                    continue outer
                }
                
                if 0..<5 ~= i+2 && room[i+1][j] == "O" && room[i+2][j] == "P" {
                    ans.append(0)
                    continue outer
                }
                
                if 0..<5 ~= j+2 && room[i][j+1] == "O" && room[i][j+2] == "P" {
                    ans.append(0)
                    continue outer
                }
            }
        }
        ans.append(1)
    }
    
    return ans
}