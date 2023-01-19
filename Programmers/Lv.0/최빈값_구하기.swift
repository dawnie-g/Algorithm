import Foundation

func solution(_ array:[Int]) -> Int {
    var dict = Dictionary(grouping: array, by: {$0})
    var most_frequent: Int = dict.map{$0.value.count}.max()!
    
    if dict.filter{$0.value.count == most_frequent}.count > 1{
        return -1
    }else{
        return dict.filter{$0.value.count == most_frequent}[0].key
    }
}