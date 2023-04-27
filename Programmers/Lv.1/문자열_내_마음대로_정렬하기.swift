func solution(_ strings:[String], _ n:Int) -> [String] {
    strings.sorted { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n]}
}