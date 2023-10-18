import UIKit

let s = "abcdef"
let x = s[s.index(s.startIndex, offsetBy: 3)]
// x의 타입은 String이 아닌 Character

// 배열과 문자열의 인덱스 접근법 비교
let arr = [0, 1, 2, 3, 4]
let str = "abcde"

// 배열은 편하게 인덱스 접근 가능
let arr2 = arr[0..<3]
print(arr2)

// 문자열은 편하게 인덱스 접근이 불가능. String.Index 형으로 접근해야 한다
let i = str.startIndex
let j = str.index(i, offsetBy: 3)
let str2 = str[i..<j]
print(i)
print(j)
print(arr2)
print(str2)

let s5 = s[s.startIndex ..< s.index(s.startIndex, offsetBy: 3)]
// "abc"
// Swift의 Index로 자른 결과는 String이 아닌 SubString 타입
var stringList = [String]()
stringList.append(String(s5)) // 타입 변환 필요



//let s = "abcdef"
//let s1 = s.prefix(3)
//let s2 = s.suffix(3)
//let s3 = s.dropFirst(3)
//let s4 = s.dropLast(3)
//
//let s5 = s.prefix(100)
//
//print(s1, s2, s3, s4, s5)
