import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var stream: [String: [(id: Int, plays: Int)]] = [:]
    var totalPlays: [String: Int] = [:]
    var bestAlbum: [Int] = []
    
    for i in 0..<genres.count {
        stream[genres[i], default: []].append((i, plays[i]))
        totalPlays[genres[i], default: 0] += plays[i]
    }
    
    for genre in totalPlays.sorted { $0.value > $1.value }.map { $0.key }  {
        var sorted = stream[genre]!.sorted { $0.plays > $1.plays }.map({ $0.id })
        bestAlbum.append(sorted[0])
        guard sorted.count > 1 else { continue }
        bestAlbum.append(sorted[1])
    }
    
    return bestAlbum
}