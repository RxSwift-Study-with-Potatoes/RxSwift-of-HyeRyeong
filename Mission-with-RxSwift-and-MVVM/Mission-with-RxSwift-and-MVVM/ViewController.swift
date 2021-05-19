//
//  ViewController.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit

class ViewController: UIViewController, Storyboarded{
    static let identifier = "ViewController"
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToFriendsView(_ sender: Any) {
        coordinator?.pushFriendsView()
    }
    
    @IBAction func presentToFriendsView(_ sender: Any) {
        coordinator?.presentFriendsView()
    }
    @IBAction func presentFullScreen(_ sender: Any) {
        coordinator?.presentFriendsView(style: .fullScreen)
    }
    
    
}

