import Foundation

func solution(_ slice:Int, _ n:Int) -> Int { n / slice + (n % slice > 0 ? 1 : 0)}