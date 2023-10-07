//
//  ViewController.swift
//  FlatmapLatestTest
//
//  Created by KIM Hyung Jun on 2023/10/02.
//

import UIKit
import RxSwift
import RxCocoa
import Combine
import CombineCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var testBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testBtn.rx.tap
//            .scan(0) { aNumber, _ -> Int in
//                    return aNumber + 1
//            }
//            .flatMapLatest { tapNumber -> Observable<Int> in
//                Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
//                    .do(onNext: { intervalNumber in
//                        print(#line, "tapNumber: \(tapNumber) - intervalNumber: \(intervalNumber)")
//                    })
//                }.subscribe(onNext: { intervalNumber in
//                    
//                })
//                .disposed(by: disposeBag)
        
        
        testBtn.tapPublisher
            .handleEvents(receiveOutput: {
                print("tapped")
            })
            .scan(0) { aNumber, _ -> Int in
                return aNumber + 1
            }
            .map { tapNumber -> AnyPublisher<Int, Never> in
                Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    .scan(0) { aNumber, _ -> Int in
                        return aNumber + 1
                    }
                    .handleEvents(receiveOutput: { intervalNumber in
                        print(#line, "tapNumber: \(tapNumber) - intervalNumber: \(intervalNumber)")
                    }).eraseToAnyPublisher()
            }
            .switchToLatest()
            .sink { resultNumber in
                
            }.store(in: &subscriptions)
    }
}

