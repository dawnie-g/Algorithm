import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var coordi = 1
    for type in Dictionary(grouping: clothes.map{$0[1]}) {$0} {
        // +1 for 'item undressed'
        coordi *= (type.value.count + 1)
    }
    
    // exception of naked 
    return coordi - 1
}