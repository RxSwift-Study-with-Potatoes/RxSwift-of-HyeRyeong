//
//  StoryBoarded.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // ex) "CoordinatorPractice(프로젝트 이름).ViewController"
        let fullName = NSStringFromClass(self)

        // .을 기준으로 split해 "ViewController"만 추출
        let className = fullName.components(separatedBy: ".")[1]

        // Bundle.main에서 Main.storyboard 가져오기
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)

        // storyboard에 className을 identifier로 가지고 있는 ViewController 인스턴스화
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
    static func instantiate(stroyBoardName: String) -> Self{
        // ex) "CoordinatorPractice(프로젝트 이름).ViewController"
        let fullName = NSStringFromClass(self)

        // .을 기준으로 split해 "ViewController"만 추출
        let className = fullName.components(separatedBy: ".")[1]

        // Bundle.main에서 Main.storyboard 가져오기
        let storyboard = UIStoryboard(name: stroyBoardName, bundle: Bundle.main)

        // storyboard에 className을 identifier로 가지고 있는 ViewController 인스턴스화
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
