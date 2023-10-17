import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var song = [[(Int, Int)]]()
    var dic = [String:Int]()
    var idx = 0
    
    for (genre, play) in zip(genres, plays.enumerated()) {
        // indexing
        if !dic.keys.contains(genre) {
            dic[genre] = idx
            idx += 1
        }
        
        // add song
        if song.count < idx {
            song.append([play])
        } else {
            song[dic[genre]!].append(play)
        }
    }
    
    // condition 1
    song.sort {
        var a = 0
        var b = 0
        
        $0.forEach { a += $0.1 }
        $1.forEach { b += $0.1 }
        
        return a > b
    }
    
    // condition 2 and 3
    let sortNSlice = song.map{$0.sorted{ ($0.1, $1.0) > ($1.1, $0.0) }.prefix(2)}
    return sortNSlice.map{$0.map{$0.0}}.flatMap{$0}
}