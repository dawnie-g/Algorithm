
class MyHashMap {
    private var hashMap: [Int?]

    init() {
        hashMap = [Int?](repeating: nil, count: 1_000_001)
    }
    
    func put(_ key: Int, _ value: Int) {
        hashMap[key] = value
    }
    
    func get(_ key: Int) -> Int {
        hashMap[key] ?? -1
    }
    
    func remove(_ key: Int) {
        hashMap[key] = nil
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */