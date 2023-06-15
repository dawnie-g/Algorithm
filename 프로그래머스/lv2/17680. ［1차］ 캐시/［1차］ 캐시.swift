func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var memory: [String] = []
    var time = 0
    
    for city in cities.map{$0.lowercased()} {
        if memory.contains(city) {
            time += 1
            memory.remove(at: memory.firstIndex(of: city)!)
        } else {
            time += 5
        }
        memory.append(city)
        while memory.count > cacheSize {
            memory.removeFirst()
        }
    }
    
    return time
}