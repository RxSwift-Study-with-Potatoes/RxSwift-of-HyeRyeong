//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by 장혜령 on 2021/05/11.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift

//해당 뷰에서 필요한 데이터들을 다 이 viewmodel이 가지고 있게
class MenuListViewModel{
    
    //lazy var menuObservable = Observable.just(menus)
    //생성자쪽 보기
    lazy var menuObservable = BehaviorSubject<[Menu]>(value: [])
    
    
    lazy var itemsCount = menuObservable.map{
        $0.map{$0.count}.reduce(0,+)
    }
    
    lazy var totalPrice = menuObservable.map{
        $0.map{$0.price * $0.count}.reduce(0,+)
    }
    //var totalPrice: PublishSubject<Int> = PublishSubject()
    
    init(){
        //이런 데이터를 직접적으로 가지고 있는 부분을 파일로 따로 빼자
        let menus: [Menu] = [
            Menu(name: "튀김1", price: 100, count: 0),
            Menu(name: "튀김2", price: 100, count: 0),
            Menu(name: "튀김3", price: 100, count: 0),
            Menu(name: "튀김4", price: 100, count: 0),
            Menu(name: "튀김5", price: 100, count: 0),
        ]
        
        menuObservable.onNext(menus)
    }
    
}
