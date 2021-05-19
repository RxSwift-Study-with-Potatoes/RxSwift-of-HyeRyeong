//
//  ProfileVC.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit

class ProfileVC: UIViewController, Storyboarded {
    
    static let identifier = "ProfileVC"
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name:String!
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
   
    @IBAction func backToFriendView(_ sender: Any) {
        coordinator?.dismissView()
    }
    
    func setUI(){
        imageView.image = image
        nameLabel.text = name
    }
    
    func setContent(image: UIImage, name: String){
        self.image = image
        self.name = name
        print("넘겨져온 \(image), \(name)")
    }
}
