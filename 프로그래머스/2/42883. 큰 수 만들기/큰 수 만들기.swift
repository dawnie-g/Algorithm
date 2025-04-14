import Foundation

/*
1924
19214

i) 문자열을 총 10번 돌면서 0~9까지의 숫자를 순차적으로 없애는? -> 최악의 경우 1,000,000 * 10
-> 411177252841, k = 4일 때 47725~가 되어서 가장 큰 수가 될 수 없다.
-> XXX

ii) 스택을 이용할까: 가장 위에 쌓인 수가 쌓을 수보다 더 작으면 차례대로 삭제
-> 4, 1 ... 쌓다가 7로 가장 큰 수가 바뀌고 스택에 있는 수가 k와 같거나 작으면 모두 삭제
41
772에서 5 등장: 스택의 위에서부터 차례대로 검사해서 5보다 작은 수를 제거, 
7752에서 8 등장: ~~~~~ 반복
-> 엣지1: 4121177~이면 4, 41, 42, 421, 4211, 427 이런식으로 작은 수가 계속 없어짐
-> 엣지2: 41211, k = 2이면? 4, 41, 42(1), 4211 --> k가 남는 경우, 모든 숫자의 추가를 끝내고 남은 k수만큼 지운다.
-> OOO
*/

func solution(_ number:String, _ k:Int) -> String {
    var stack: String = ""
    var remove = k
    
    for n in number {
        guard !stack.isEmpty else { 
            stack.append(n)
            continue
        }
        
        while !stack.isEmpty && stack.last! < n && remove > 0 {
            stack.removeLast()
            remove -= 1
        }
        
        stack.append(n)
    }
    
    stack.removeLast(remove)
    
    return stack
}









