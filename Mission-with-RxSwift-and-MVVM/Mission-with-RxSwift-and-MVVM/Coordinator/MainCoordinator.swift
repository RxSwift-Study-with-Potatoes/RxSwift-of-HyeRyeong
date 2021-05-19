//
//  MainCoordinator.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //처음 보여질 화면
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func pushFriendsView(){
        let vc = FriendVC.instantiate(stroyBoardName: "Friends")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func presentFriendsView(){
        let vc = FriendVC.instantiate(stroyBoardName: "Friends")
        vc.coordinator = self
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    
    func presentFriendsView(style: UIModalPresentationStyle){
        let vc = FriendVC.instantiate(stroyBoardName: "Friends")
        vc.modalPresentationStyle = style
        vc.coordinator = self
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func presentProfileView(image: UIImage, name: String){
        //let friendVC = FriendVC.instantiate(stroyBoardName: "Friends")
        let vc = ProfileVC.instantiate(stroyBoardName: "Friends")
        vc.setContent(image: image, name: name)
        vc.modalPresentationStyle = .fullScreen
        vc.coordinator = self
        //friendVC.present(vc, animated: true, completion: nil)
        navigationController.present(vc, animated: true, completion: nil)
    }
    
    func dismissView(){
        //주석처리한 부분처럼하면 안됨
//        let vc = ProfileVC.instantiate(stroyBoardName: "Friends")
//        vc.coordinator = self
//        vc.dismiss(animated: true, completion: nil)
       navigationController.dismiss(animated: true, completion: nil)
    }
    
//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }
    
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
      
    }
}
