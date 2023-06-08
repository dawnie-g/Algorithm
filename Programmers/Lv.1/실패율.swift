import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var players = Dictionary(grouping: stages) {$0}
    var now = Double(stages.count)
    var rates: [Double] = []

    for stage in 1...N {
        let failed_player = players.keys.contains(stage) ? Double(players[stage]!.count) : 0
        rates.append(failed_player/now)
        now -= failed_player
    }

    return rates.enumerated().sorted{$0.1 > $1.1}.map{Int($0.0) + 1}
}