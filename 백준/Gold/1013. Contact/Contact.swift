let t = Int(readLine()!)!

for _ in 0..<t {
    var wave = readLine()!
    
    while !wave.isEmpty {
        if wave.hasPrefix("100") {
            let array = Array(wave)
            var zeroOne = false
            var cnt = 3
            var prev: Character = "0"
            
            while cnt < array.count {
                if array[cnt] == prev {
                    if prev == "1" && cnt+2 < array.count && array[cnt+1] == "0" && array[cnt+2] == "0" {
                        break
                    }
                    prev = array[cnt]
                    cnt += 1
                } else if prev == "0" && array[cnt] != prev && !zeroOne {
                    zeroOne = true
                    prev = array[cnt]
                    cnt += 1
                } else if prev == "1" && array[cnt] != prev {
                    break
                }
            }
            if zeroOne {
                wave.removeFirst(cnt)
            } else {
                break
            }
        } else if wave.hasPrefix("01") {
            wave.removeFirst(2)
        } else {
            break
        }
    }
    print(wave.isEmpty ? "YES" : "NO")
}