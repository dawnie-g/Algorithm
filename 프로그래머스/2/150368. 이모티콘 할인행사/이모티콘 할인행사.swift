import Foundation

/*
플러스 가입자를 최대한으로 하는게 최우선 목표
사용자의 이모티콘 구매 기준: 기준 비율(users[i][0] 보다 높은 할인율 적용)

i) 이모티콘의 수는 최대 7개, 할인율 종류는 4개니까 최대 경우의 수는 4^7 완전 탐색? -> bfs? dfs?
i-1) bfs
-> emoticons에 할인율을 적용한 모든 배열 만들기?..
-> emoticons.count 크기의 할인율 배열 만들기?
i-2) dfs
-> sales이라는 빈 배열, [10, 20, 30, 40]중 하나의 수를 선택해서 추가, depth가 emoticons.count와 같아지면 maxValue와 비교(기준은 문제에서 제공한 것.. [0]값이 큰것 우선, 같으면 [1]비교)


*/

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    let promo = [10, 20, 30, 40]
    var result: (plus: Int, sales: Int) = (0, 0)
    
    func dfs(_ depth: Int, _ rates: [Int]) {
        if depth == emoticons.count {
            let saledPrice = zip(rates, emoticons).map { (100 - $0.0) * $0.1 / 100 }
            var plus = 0
            var sales = 0
            
            for user in users {
                var sum = 0
                
                for i in 0..<rates.count {
                    if rates[i] >= user[0] {
                        sum += saledPrice[i]
                    }
                    if sum >= user[1] {
                        plus += 1
                        sum = 0
                        break
                    }
                }
                sales += sum
            }
            
            if plus > result.plus || (plus == result.plus && sales > result.sales) {
                result = (plus, sales)
            }
            
            return
        }
        
        for rate in promo {
            dfs(depth + 1, rates + [rate])
        }
    }
    
    dfs(0, [])
    
    return [result.0, result.1]
}