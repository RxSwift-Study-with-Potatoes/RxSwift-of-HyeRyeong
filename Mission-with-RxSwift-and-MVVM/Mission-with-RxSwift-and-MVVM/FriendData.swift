//
//  FriendData.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import Foundation
import UIKit.UIImage

struct FriendData {
    var image : UIImage
    var name : String
    var state: String

    init(imageName : String = "profileImage1", name : String = "", state: String = ""){
        if let image = UIImage(named: imageName){
           self.image = image
        }else{
           self.image = UIImage()
        }
        self.name = name
        self.state = state
    }
    
}
