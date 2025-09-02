
class MyHashSet {
    private var hashSet: [Int]

    init() {
        hashSet = []
    }
    
    func add(_ key: Int) {
        guard !contains(key) else { return }
        hashSet.append(key)
    }
    
    func remove(_ key: Int) {
        guard let index = hashSet.firstIndex(of: key) else { return }
        hashSet.remove(at: index)
    }
    
    func contains(_ key: Int) -> Bool {
        hashSet.contains(key)
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */