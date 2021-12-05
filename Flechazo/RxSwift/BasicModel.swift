//
//  BasicModel.swift
//  Flechazo
//
//  Created by Avalan on 2021/12/5.
//

import Foundation
import RxSwift

class RxBasicModel {
    
    // MARK: - RxSwift Study : 参考blog: https://ithelp.ithome.com.tw/users/20115751/ironman/2936?sc=hot
    // MARK: - 1. Observable
    func testObservable() {
        // 1.1 of
    //    let observable = Observable.of(1,3,5)
        // 1.2 interval  *** failed...
    //    let observable = Observable<Int>.interval(.milliseconds(1000), scheduler: MainScheduler.instance)
        // 1.3 just
    //    let observable = Observable.just(true)
        // 1.4 from
        // 可以把阵列转成Observable，注意一点，结果是把阵列逐一发送每个元素
    //    let observable = Observable.from([1,2,3])
    //    let num:Int? = nil // 5 or nil
    //    let observable = Observable.from(optional: num)
        // 1.5 never
    //    let observable:Observable<Int> = Observable.never()
        // 1.6 error
    //    let error = NSError.init(domain: "test", code: -1, userInfo: nil)
    //    let observable:Observable<Int> = .error(error)
        // 1.7 create
        let observable = isEven(number: 1)
        
        
        let disposeBag = DisposeBag()
        
        observable.subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("onCompleted.")
        }, onDisposed: {
            print("onDisposed.")
        }).disposed(by: disposeBag)
    }

    func isEven(number:Int) -> Observable<Int> {
        return Observable.create { observer in
            if number % 2 == 0 {
                observer.onNext(number)
                observer.onCompleted()
            } else {
                observer.onError(NSError.init(domain: "Not Even", code: -1, userInfo: nil))
            }
            return Disposables.create()
        }
    }


    // MARK: - 2. Subject
    func testSubject() {
        let disposeBag = DisposeBag()
        
        let subject = PublishSubject<Int>()
        
        subject.subscribe(onNext: {
            print($0)
        } , onError: { error in
            print(error)
        }, onCompleted: {
            print("onCompleted.")
        }, onDisposed: {
            print("onDisposed.")
        })
        .disposed(by: disposeBag)
        
        subject.onNext(1)
        subject.onNext(2)
        subject.onNext(3)
        subject.onCompleted()
    }
    
}
