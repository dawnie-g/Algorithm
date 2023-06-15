import Foundation

func solution(_ cipher:String, _ code:Int) -> String { (0..<cipher.count).filter{$0 % code == code - 1}.map{String(Array(cipher)[$0])}.joined() }