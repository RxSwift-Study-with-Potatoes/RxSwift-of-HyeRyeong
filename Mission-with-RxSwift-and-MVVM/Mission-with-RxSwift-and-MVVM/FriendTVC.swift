//
//  FriendTVC.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit

class FriendTVC: UITableViewCell {
    static let identifier = "FriendTVC"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var friendData = FriendData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(friendData)
        print("----------")
        // Configure the view for the selected state
    }
    
    func setContent(){
        profileImage.image = friendData.image
        nameLabel.text = friendData.name
        stateLabel.text = friendData.state
    }

    func setFriendData(data: FriendData){
        friendData = data
        setContent()
    }
    
    
}
