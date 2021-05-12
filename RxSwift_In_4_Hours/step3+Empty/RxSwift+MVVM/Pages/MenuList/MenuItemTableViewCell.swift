//
//  MenuItemTableViewCell.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 07/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit

// 방법 1 -> MenuListViewModel을 알아서 여기서 실행
//class MenuItemTableViewCell: UITableViewCell {
//    @IBOutlet var title: UILabel!
//    @IBOutlet var count: UILabel!
//    @IBOutlet var price: UILabel!
//
//    var viewModel: MenuListViewModel!
//
//    @IBAction func onIncreaseCount() {
//        viewModel.increaseCount(self)
//    }
//
//    @IBAction func onDecreaseCount() {
//    }
//
//}

class MenuItemTableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var price: UILabel!

    var onChanged: ((Int) -> Void)?
    
    @IBAction func onIncreaseCount() {
        onChanged?(+1)
    }

    @IBAction func onDecreaseCount() {
        onChanged?(-1)
    }
    
}

