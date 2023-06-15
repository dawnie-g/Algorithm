func solution(_ n:Int) -> String {
    (0...n-1).map{$0 % 2 == 0 ? "수" : "박"}.joined()
    
}