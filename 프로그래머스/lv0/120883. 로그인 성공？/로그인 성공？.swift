import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    db.map{$0[0]}.contains(id_pw[0]) ? db.map{$0[1]}[db.map{$0[0]}.firstIndex(of: id_pw[0])!] == id_pw[1] ? "login" : "wrong pw" : "fail"
}