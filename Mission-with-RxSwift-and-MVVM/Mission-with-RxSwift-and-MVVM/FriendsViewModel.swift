//
//  FriendsViewModel.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import Foundation
import RxSwift

class FriendsViewModel{
    var friendList: [FriendData] = []
    var friendsPublishSubject = PublishSubject<FriendData>()
    var friendsBehaviorSubject = BehaviorSubject<[FriendData]>(value: [])
    var friendObservable: Observable<[FriendData]>!
    
    init(){
        self.setFriendData()
        self.setFriendObservable()
        self.setFriendsBehaviorSubject()
    }
    
    func setFriendsPublishSubject(){
        for data in friendList {
            friendsPublishSubject.onNext(data)
        }
        
    }
    
    func setFriendsBehaviorSubject(){
        friendsBehaviorSubject.onNext(friendList)
    }
    
    func setFriendObservable(){
        friendObservable = Observable.from(optional: [FriendData(imageName: "profileImage1",
                                                       name: "안솝트",
                                                       state: "배고파요"),

                                            FriendData(imageName: "profileImage2",
                                                       name: "최솝트",
                                                       state: "피곤해요"),

                                            FriendData(imageName: "profileImage3",
                                                       name: "정솝트",
                                                       state: "시험언제끝나죠?"),

                                            FriendData(imageName: "profileImage4",
                                                       name: "이솝트",
                                                       state: "ㅠㅠㅠㅠ"),

                                            FriendData(imageName: "profileImage5",
                                                       name: "유솝트",
                                                       state: "나는 상태메세지!"),

                                            FriendData(imageName: "profileImage6",
                                                       name: "박솝트",
                                                       state: "원하는대로 바꿔보세요 ^_^"),

                                            FriendData(imageName: "profileImage7",
                                                       name: "최솝트",
                                                       state: "넘 덥다.."),

                                            FriendData(imageName: "profileImage8",
                                                       name: "원솝트",
                                                       state: "배고파요"),

                                            FriendData(imageName: "profileImage9",
                                                       name: "투솝트",
                                                       state: "내꿈은 대나무부자"),

                                            FriendData(imageName: "profileImage10",
                                                       name: "권솝트",
                                                       state: "걱정말라구!")
                                                
                                            ]
        
        )
    }
    
    
    func setFriendData(){
        friendList.append(contentsOf: [
                FriendData(imageName: "profileImage1",
                           name: "안솝트",
                           state: "배고파요"),

                FriendData(imageName: "profileImage2",
                           name: "최솝트",
                           state: "피곤해요"),

                FriendData(imageName: "profileImage3",
                           name: "정솝트",
                           state: "시험언제끝나죠?"),

                FriendData(imageName: "profileImage4",
                           name: "이솝트",
                           state: "ㅠㅠㅠㅠ"),

                FriendData(imageName: "profileImage5",
                           name: "유솝트",
                           state: "나는 상태메세지!"),

                FriendData(imageName: "profileImage6",
                           name: "박솝트",
                           state: "원하는대로 바꿔보세요 ^_^"),

                FriendData(imageName: "profileImage7",
                           name: "최솝트",
                           state: "넘 덥다.."),

                FriendData(imageName: "profileImage8",
                           name: "원솝트",
                           state: "배고파요"),

                FriendData(imageName: "profileImage9",
                           name: "투솝트",
                           state: "내꿈은 대나무부자"),

                FriendData(imageName: "profileImage10",
                           name: "권솝트",
                           state: "걱정말라구!")
                    
                ])
    }
    
    
}
