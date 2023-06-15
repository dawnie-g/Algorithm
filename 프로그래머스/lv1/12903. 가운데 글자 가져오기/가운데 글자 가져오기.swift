import Foundation

func solution(_ s:String) -> String {
    if s.count % 2 == 1{
        return String(Array(s)[s.count/2])
    }else{
        return String(Array(s)[s.count/2-1...s.count/2])
    }
}