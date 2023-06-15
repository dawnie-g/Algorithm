import Foundation

func solution(_ dots:[[Int]]) -> Int {
    
    for i in 1...3{
        for j in 0...1{
            let line1 = zip(dots[0],dots[i]).map{$0 - $1}
            var line2: [Int] = []
            if j == 0 {
                if i+1<=3 && i+2<=3{
                    line2 = zip(dots[(i+1)],dots[(i+2)]).map{$0 - $1}
                }else if i+1<=3 && i+2>3{
                    line2 = zip(dots[(i+1)],dots[(i+2-3)]).map{$0 - $1}
                }else {
                    line2 = zip(dots[(i+1-3)],dots[(i+2-3)]).map{$0 - $1}
                }
            }else if j == 1 {
                if i+1<=3 && i+2<=3{
                    line2 = zip(dots[(i+2)], dots[(i+1)]).map{$0 - $1}
                }else if i+1<=3 && i+2>3{
                    line2 = zip(dots[(i+2-3)], dots[(i+1)]).map{$0 - $1}
                }else {
                    line2 = zip(dots[(i+2-3)], dots[(i+1-3)]).map{$0 - $1}
                }
            }
            
            if Double(line1[0])/Double(line1[1]) == Double(line2[0])/Double(line2[1]) {return 1}
        }
    }
    
   return 0
}