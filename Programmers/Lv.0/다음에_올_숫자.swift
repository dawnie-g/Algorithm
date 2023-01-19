import Foundation



func solution(_ common:[Int]) -> Int {
    var finalNumber: Int = 0
    
    if common[1]-common[0] == common[2]-common[1] {
        finalNumber = common[common.count-1] + common[1]-common[0] // 등차수열
    }else if common[1]/common[0] == common[2]/common[1] {
        finalNumber = common[common.count-1] * common[1]/common[0]
    } // 등비수열
    
    return finalNumber
}