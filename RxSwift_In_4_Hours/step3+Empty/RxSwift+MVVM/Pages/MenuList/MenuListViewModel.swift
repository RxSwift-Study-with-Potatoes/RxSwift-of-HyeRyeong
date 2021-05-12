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
       _ = APIService.fetchAllMenusRx()
        .map { data -> [MenuItem] in
                struct Response: Decodable{
                    let menus: [MenuItem]
                }
                let response = try! JSONDecoder().decode(Response.self, from: data)
                
                return response.menus

        }
        .map { menuItems -> [Menu] in
            var menus:[Menu] = []
            menuItems.enumerated().forEach{ (index, item) in
                let menu = Menu.fromMenuItems(id: index, item: item)
                menus.append(menu)
            }
            return menus
        }
        .take(1)
        .bind(to: menuObservable)
    }
    
    func clearAllItemSelections(){
        _ = menuObservable
            .map{ menus in
                return menus.map{ m in
                    Menu(id: m.id, name: m.name, price: m.price, count: 0)
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
    
    func ChangeCount(item: Menu, increase: Int){
        _ = menuObservable
            .map{ menus in
                menus.map {  m in
                    if m.id == item.id{
                        return Menu(id: m.id,
                                    name: m.name,
                                    price: m.price,
                                    count: max(m.count + increase, 0))
                    }else{
                        return Menu(id: m.id,
                                    name: m.name,
                                    price: m.price,
                                    count: m.count)
                    }
                }
            }
            .take(1)
            .subscribe(onNext: {
                self.menuObservable.onNext($0)
            })
    }
    
    func onOrder(){
        
    }
    
}
