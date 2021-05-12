//
//  Manu.swift
//  RxSwift+MVVM
//
//  Created by 장혜령 on 2021/05/11.
//  Copyright © 2021 iamchiwon. All rights reserved.
//

import Foundation

// view를 위한 model -> ViewModel
struct Menu{
    var id: Int
    var name: String
    var price: Int
    var count: Int
    
}

extension Menu {
    static func fromMenuItems(id: Int, item: MenuItem) -> Menu{
        return Menu(id: id, name: item.name, price: item.price, count: 0)
    }
    
}
