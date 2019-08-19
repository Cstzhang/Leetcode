//[-1,-1,-1,-1,-1,0]
//[1, 7, 3, 6, 5, 6]
//[1, 2, 3]

class Solution {
    

    func pivotIndex(_ nums: [Int]) -> Int {
        if nums.count < 3 {
            return -1
        }
        var total:Int = 0 //总和
        var target:Int = 0
        var re = -1;
        for i in nums {
            total = total + i
        }
        for (index,value) in nums.enumerated() {
            if target > total / 2  {
                target = index
                break
            }
            target = target + value
        }
        var halfL:Int = 0
        var halfR:Int = 0
        var x:Int = target
        while x >= 1 {
            for i in 0...x - 1 {
                halfL = halfL + nums[i]
            }
            for j in x...nums.count - 1 {
                halfR = halfR + nums[j]
            }
            if halfL == halfR {
                re = x
                break;
            }
            x  = x - 1
        }
        
        return re;

    }
    
    func testFun()  {
        let test1 = [-1,-1,-1,-1,-1,0]
        let test2 = [1, 7, 3, 6, 5, 6]
        let test3 = [1, 2, 3]
        assert(pivotIndex(test1) == 2)
        assert(pivotIndex(test2) == 3)
        assert(pivotIndex(test3) == -1)
    }

    

}

