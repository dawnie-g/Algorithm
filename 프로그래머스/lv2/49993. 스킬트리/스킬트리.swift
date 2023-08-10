import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    let skills = skill_trees.map{$0.filter{skill.contains($0)}}
    return skills.filter{$0.first ?? " " == skill.first! && skill.contains($0)}.count + skills.filter{$0 == ""}.count
}