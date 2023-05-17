import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let patterns = [[1, 2, 3, 4, 5],
                    [2, 1, 2, 3, 2, 4, 2, 5],
                    [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    var correct = 0
    var students = [1, 2, 3]
    
    let results: [Int] = zip([answers, answers, answers], patterns).map{
        correct = 0
        for i in 0..<answers.count {
            if $0.0[i] == $0.1[i % $0.1.count] {
                correct += 1
            }
        }
        return correct
    }
    
    return zip(students, results).filter{$0.1 == results.max()!}.map{$0.0}
}