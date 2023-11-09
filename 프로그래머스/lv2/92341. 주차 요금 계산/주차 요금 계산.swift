import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var parking = [String](repeating: "", count: 9999)
    var total = [Int](repeating: 0, count: 9999)
    
    for record in records {
        let info = record.split(separator: " ").map{String($0)}
        let plate = Int(String(info[1]))!
        if parking[plate] == "" {
            parking[plate] = info[0]
        } else {
            total[plate] += dm(ci: parking[plate], co: info[0])
            parking[plate].removeAll()
        }
    }
    
    // 
    for i in 0..<9999 where parking[i] != "" {
        total[i] += dm(ci: parking[i], co: "23:59")
        parking[i].removeAll()
    }
    
    return total.filter{$0 != 0}.map{
        var time = $0 - fees[0]
        guard time > 0 else { return fees[1] }
        let over = time / fees[2] + (time % fees[2] == 0 ? 0 : 1)
        return fees[1] + (over * fees[3])
    }
}

func dm(ci: String, co: String) -> Int { // calculate minute of parking time
    let ci = ci.split(separator: ":").map{Int(String($0))!}
    let co = co.split(separator: ":").map{Int(String($0))!}
    return (co[0]-ci[0]) * 60 + (co[1] - ci[1])
}
