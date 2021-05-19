//
//  ViewController.swift
//  RxSwift-Subject-Exam
//
//  Created by 장혜령 on 2021/05/12.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class MyErrer: Error{
    let err = "err"
}

class ViewController: UIViewController {
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpPublish(_ sender: Any) {
        print("----------publish err----------")
        let subject = PublishSubject<String>()
        subject.onNext("Is anyone listening?")

        let subscriptionOne = subject
            .subscribe(onNext: { (string) in
                print(string)
            })
        subject.on(.next("1"))
        subject.onNext("2")

        // 1
        let subscriptionTwo = subject
            .subscribe({ (event) in
                print("2)", event.element ?? event)
            })

        // 2
        subject.onNext("3")

        // 3
        //subscriptionOne.dispose()
        subject.onNext("4")

        // 4
        //subject.onCompleted()
        subject.onError(MyErrer.init())
        // 5
        subject.onNext("5")

        // 6
        subscriptionTwo.dispose()

        

        // 7
        subject
            .subscribe {
                print("3)", $0.element ?? $0)
        }
            .disposed(by: disposeBag)

        subject.onNext("?")
        
        print("---------------------------")
    }
    
    @IBAction func touchUpReplay(_ sender: Any) {
        print("----------replay----------")
        // 1
         let subject = ReplaySubject<String>.create(bufferSize: 2)
         let disposeBag = DisposeBag()

         // 2
         subject.onNext("1")
         subject.onNext("2")
         subject.onNext("3")

         // 3
         subject
             .subscribe {
                print("1)", $0)
             }
             .disposed(by: disposeBag)

         subject
             .subscribe {
                print("2)", $0)
             }
             .disposed(by: disposeBag)
    
         subject.onNext("4")

         subject.subscribe {
                print( "3)", $0)
             }
             .disposed(by: disposeBag)
    
        print("--------------------------")
    }
    @IBAction func touchUpSchedular(_ sender: Any) {
        print("----------touchUpSchedular----------------")
        
        Observable<Int>.create { observer in
            observer.onNext(1)
            observer.onNext(2)
                                                        
            print("Hi \(Thread.isMainThread)")

            observer.onCompleted()
            return Disposables.create()
        }
        .observeOn(MainScheduler.instance)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
        .subscribe(onNext: { el in
            print("onNext \(el) \(Thread.isMainThread)")
        }, onDisposed: {(
            print("dispose \(Thread.isMainThread)")
        )})
        
        print("---------last-----------------")
    }
    
    @IBAction func startPublishRelay(_ sender: Any) {
        print("PublishRelay")

        let prelay = PublishRelay<Int>()
        prelay.accept(0)
        prelay.subscribe{ print("1 : \($0)")}
            .disposed(by: disposeBag)
    
        prelay.accept(1)
        prelay.accept(2)
        
        print("---------------")
    }
        
        
    
    @IBAction func startBehaviorRelay(_ sender: Any) {
        print("BehaviorRelay")
        let brelay = BehaviorRelay(value: 1)
        brelay.accept(2)
        
        brelay.subscribe{print("2 : \($0)")}
            .disposed(by: disposeBag)
        
        brelay.accept(3)
        brelay.accept(4)
        
        print("---------------")
        
    }


}
