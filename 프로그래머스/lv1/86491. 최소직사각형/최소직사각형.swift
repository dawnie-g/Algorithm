import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let cards = sizes.map{$0.sorted()}
    var w: Int = 0
    var h: Int = 0
    
    for card in cards {
        if card[0] > w {
            w = card[0]
        }
        if card[1] > h {
            h = card[1]
        }
    }
    
    return w * h
}