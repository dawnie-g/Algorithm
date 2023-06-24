let input = readLine()!
var group = [String](repeating: "", count: input.filter{$0 == " "}.count+1)
var idx = 0
var bracket = false

for c in input {
    switch c {
    case "<":
        bracket = true
        group[idx] += String(c)
    case ">":
        bracket = false
        group[idx] += String(c)
    case " ":
        if bracket {
            group[idx] += String(c)
        } else {
            idx += 1
        }
    default:
        group[idx] += String(c)
    }
}

var ans = [String]()
for set in group {
    var str = ""
    var rvs = ""
    var result = [String]()
    for c in set {
        switch c {
        case "<":
            bracket = true
            if !rvs.isEmpty {
                result.append(String(rvs.reversed()))
                rvs = ""
            }
            str += String(c)
        case ">":
            bracket = false
            str += String(c)
            result.append(str)
            str = ""
        default:
            if bracket {
                str += String(c)
            } else {
                rvs += String(c)
            }
        }
    }
    if !rvs.isEmpty {
        result.append(String(rvs.reversed()))
    }
    ans.append(result.joined())
}
print(ans.filter{!$0.isEmpty}.joined(separator: " "))
