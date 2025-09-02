
class RandomizedSet {
    var randomSet: [Int]

    init() {
        randomSet = []
    }
    
    func insert(_ val: Int) -> Bool {
        guard !randomSet.contains(val) else { return false }
        randomSet.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = randomSet.firstIndex(of: val) else { return false }
        randomSet.remove(at: index)
        return true
    }
    
    func getRandom() -> Int {
        randomSet.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */