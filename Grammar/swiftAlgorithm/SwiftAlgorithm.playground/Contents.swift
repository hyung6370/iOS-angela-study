import Foundation

// 시간 측정 메서드
public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

// 긴 배열
var arr = [Int](repeating: 0, count: Int(pow(10.0, 6)))

// arr의 마지막 4개의 원소를 pop한 배열의 결과를 얻고 싶다

// 1. dropLast 한 것을 대입 -> 0.35초
progressTime {
    let arr2 = arr.dropLast(4)
}

// 2. index 슬라이싱 대입 -> 0.32초
progressTime {
    let arr2 = arr[arr.startIndex..<arr.index(arr.startIndex, offsetBy: arr.endIndex - 4)]
}

// 3. popLast() 4번 -> 0.0002초
progressTime {
    arr.popLast()
    arr.popLast()
    arr.popLast()
    arr.popLast()
}

// 4. removeLast(4) -> 0.0007초
progressTime {
    arr.removeLast(4)
}
