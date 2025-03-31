import Foundation

/*
갈색 타일의 수 = (노랑 가로 * 2) + (노랑 세로 * 2) + 4

노랑 타일이 18개라면? (2의 n제곱이 아님)
노랑 타일이 9개라면? (2로 나눌수가 없음) ==> 2로 나누거나 곱해가는 방식이 아니라 약수를 구해서
*/

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for i in 1...yellow where yellow % i == 0 {
        let heightY = i
        let widthY = yellow / i
        
        if heightY * 2 + widthY * 2 + 4 == brown { return [widthY + 2, heightY + 2] }
    }
    
    return []
}