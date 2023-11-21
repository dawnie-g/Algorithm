func solution(_ m:String, _ musicinfos:[String]) -> String {
    var m = m
    let dic = ["A#":"a", "C#":"c", "D#":"d", "F#":"f", "G#":"g"]
    for c in dic {
        m = m.replacingOccurrences(of: c.key, with: c.value)
    }
    let infos = musicinfos.map{$0.split(separator: ",")}
    var ans = ("", 0)
    
    for info in infos {
        let start = info[0].split(separator: ":").map{Int($0)!}
        let end = info[1].split(separator: ":").map{Int($0)!}
        let time = (end[0] - start[0]) * 60 + (end[1] - start[1])
        
        var song = String(info[3])
        for c in dic {
            song = song.replacingOccurrences(of: c.key, with: c.value)
        }
        
        let size = song.count
        var play = ""
        if time / size > 0 {
            for _ in 0..<(time/size) {
                play += song
            }
        }
        play += String(song.map{$0}[0..<(time%size)])
        
        if play.contains(m) && ans.1 < time {
            ans = (String(info[2]), time)
        }
    }
    
    return ans == ("", 0) ? "(None)" : ans.0
}