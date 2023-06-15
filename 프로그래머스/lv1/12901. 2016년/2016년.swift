func solution(_ a:Int, _ b:Int) -> String {
    let weekday = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    let endOfMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    return weekday[ ( endOfMonth[0..<a-1].reduce(0, +) + b + 3 )  % 7 ]
}