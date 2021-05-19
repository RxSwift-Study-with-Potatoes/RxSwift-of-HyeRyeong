//
//  FriendVC.swift
//  Mission-with-RxSwift-and-MVVM
//
//  Created by JangHyeRyeong on 2021/05/19.
//

import UIKit
import RxSwift
import RxCocoa

class FriendVC: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    var viewModel: FriendsViewModel = FriendsViewModel()
    let disposeBag = DisposeBag()
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        bindToTableView()
        self.tableView.rowHeight = 50.0
        self.tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    func registerXib(){
        let nibName = UINib(nibName: FriendTVC.identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: FriendTVC.identifier)
    }
    
    func bindTableView(){
        viewModel.friendObservable
            .bind(to: tableView.rx.items){tableView, row, element in
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendTVC.identifier) as? FriendTVC else{
                    return UITableViewCell()
                }
            
                return cell
            }.disposed(by: disposeBag)
            
    }
    
    func bindToTableView(){
        viewModel.friendObservable
            .bind(to: tableView.rx.items(cellIdentifier: FriendTVC.identifier,
                                         cellType: FriendTVC.self)){ [weak self] row, element, cell in
            
            cell.setFriendData(data: element)
            //cell.friendData = element
                
                
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: {[weak self] indexPath in
                //
                let cell = self?.tableView.cellForRow(at: indexPath) as? FriendTVC
                let data = cell!.friendData
               
                self?.tableView.deselectRow(at: indexPath, animated: true)
                
                self?.coordinator?.presentProfileView(image: data.image ?? UIImage(), name: data.name ?? "")
            })
            .disposed(by: disposeBag)
    }
    
}
