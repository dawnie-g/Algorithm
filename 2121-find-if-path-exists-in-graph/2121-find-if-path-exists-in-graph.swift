class Solution {
    class UnionFind {
        var parent: [Int]
        var rank: [Int]

        init(_ n: Int) {
            parent = Array(0..<n)
            rank = [Int](repeating: 0, count: n)
        }

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }

        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)

            if rootX != rootY {
                if rank[rootX] < rank[rootY] {
                    parent[rootX] = rootY
                } else if rank[rootY] < rank[rootX] {
                    parent[rootY] = rootX
                } else { // rank[rootX] == rank[rootY]
                    parent[rootY] = rootX
                    rank[rootX] += 1
                }
            }
        }
    }

    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        let uf = UnionFind(n)

        for edge in edges {
            uf.union(edge[0], edge[1])
        }

        return uf.find(source) == uf.find(destination)
    }
}