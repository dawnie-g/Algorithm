import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    explore(k, dungeons, 0)
}

func explore(_ k:Int, _ dungeons:[[Int]], _ depth: Int) -> Int {
    dungeons.map{
        dungeon in
        k >= dungeon[0] ? explore(k - dungeon[1], dungeons.filter{$0 != dungeon}, depth + 1) : depth
    }.max() ?? depth
}