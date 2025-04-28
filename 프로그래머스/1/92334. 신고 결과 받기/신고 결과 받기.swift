import Foundation

/*
k: 계정 정지 기준
계정이 정지되면 해당 계정을 신고한 모든 회원에게 메일링

id_list는 왜 주는거지...?? >> 모든 유저에 대한 메일링 횟수를 반환해야함

*/

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let report: Set<String> = Set(report)
    var reported: [String: [String]] = [:]
    var reporter: [String: [String]] = [:]
    
    for r in report {
        let r = r.components(separatedBy: " ")
        reporter[r[0], default: []].append(r[1])
        reported[r[1], default: []].append(r[0])
    }
    
    return id_list.map { id in
        guard let report = reporter[id] else { return 0 } // 신고한적이 없으면 0
        return report.filter { 
            guard let reporter = reported[$0] else { return false }
            return reporter.count >= k 
        }.count
    }
}