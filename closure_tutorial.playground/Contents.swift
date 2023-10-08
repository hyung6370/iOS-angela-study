import UIKit

//func someFunction () {
//    
//}
//
//let someClosure: () -> Void = {  }


// 매개변수 O, 반환 X
// (_ name: String) -> Void
// (_ name: String) -> ()
// (String) -> Void
// (String) -> ()
// 값
// { (name: String) in }
//func someFunction (_ name: String) {
//    
//}
//
//let someClosure: (_ name: String) -> Void = { (name: String) in
//    
//}
//
//let someClosure: (_ name: String) -> Void = {
//    print(\($0))
//}

// 매개변수 O, 반환 O
// 자료형
// (_ name: String) -> String
// (String) -> String
// 값
// {}
//func someFunction (_ name: String) -> String {
//    return "name: \(name)"
//}
//
//let someClosure: (_ name: String) -> String = { (name: String) in
//    return "name: \(name)"
//}

// 매개변수 X, 반환 O
// 자료형
// () -> String
// 값
func someFunction () -> String {
    return "someFunction"
}

let someClosure: () -> String = {
        return "someFunction"
}

