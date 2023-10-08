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
//func someFunction () -> String {
//    return "someFunction"
//}
//
//let someClosure: () -> String = {
//        return "someFunction"
//}


// 매개변수로 클로저를 가질 경우
// 매개변수 X, 반환 X
// 자료형
// () -> Void
// () -> ()
// 값
// { }
//func someFunction(completion: @escaping () -> Void) {
//    print(#function)
//    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//        completion()
//    })
//    completion()
//}
//
//someFunction(completion: {
//    print("completion 터뜨려짐")
//})


 
// 매개변수로 클로저를 가질 경우
// 매개변수 O, 반환 X
// 자료형
// (_ name: String) -> Void
// (_ name: String) -> ()
// (String) -> Void
// (String) -> ()
// 값
// { (name: String) in }
// { name in }

func someFunction(_ completion: (_ name: String) -> String) {
    print(#function)
    let result = completion("호롤롤로")
    print(#function + " result: \(result)")
}

someFunction({ (name: String) -> String in
    return "completion 터뜨려짐 name: \(name)"
})
