//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    // MARK: - Life Cycle

    let viewModel = MenuListViewModel()
    var disposeBag = DisposeBag()
    let cellId = "MenuItemTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = nil
        
//        viewModel.itemsCount
//            .map {"\($0)"}
//            .subscribe(onNext:{
//                self.itemCountLabel.text = $0
//            })
//            .disposed(by: disposeBag)
//
//        viewModel.totalPrice
//            .scan(0, accumulator: +) // 0부터시작해서
//            .map{$0.currencyKR()}
//            .subscribe(onNext:{
//                self.totalPrice.text = $0 // 이 onNext가 계속 불린다는 것
//            })
//            .disposed(by: disposeBag)
        
        //item - menu하나
        //index - indexPath
        //현재 불린 cell 
        viewModel.menuObservable
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: MenuItemTableViewCell.self)){index, item, cell in
               
                cell.title.text = item.name
                cell.price.text = "\(item.price)"
                cell.count.text = "\(item.count)"
                // 이곳에서 호출하기
                //self.viewModel.
                cell.onChanged = {[weak self] increase in
                    self?.viewModel.ChangeCount(item: item, increase: increase)
                }
                
            }
            .disposed(by: disposeBag)
         
        viewModel.itemsCount
            .map{"\($0)"}
            .observeOn(MainScheduler.instance)
            .bind(to: itemCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.totalPrice
            .map{$0.currencyKR()}
            .observeOn(MainScheduler.instance)
            .bind(to: totalPrice.rx.text)
            .disposed(by: disposeBag)

    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        if identifier == "OrderViewController",
            let orderVC = segue.destination as? OrderViewController {
            // TODO: pass selected menus
        }
    }

    func showAlert(_ title: String, _ message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true, completion: nil)
    }

    // MARK: - InterfaceBuilder Links

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var itemCountLabel: UILabel!
    @IBOutlet var totalPrice: UILabel!

    @IBAction func onClear() {
        //선택한 갯수를 전체 clear
        viewModel.clearAllItemSelections()
    }

    @IBAction func onOrder(_ sender: UIButton) {
        // TODO: no selection
        // showAlert("Order Fail", "No Orders")
        performSegue(withIdentifier: "OrderViewController", sender: nil)
        //viewModel.totalPrice.onNext(100)
        
        //viewModel.totalPrice += 100 // UI에 다시 적용해줘야지만 실제 화면에서 바뀜
        
        viewModel.menuObservable.onNext([
            Menu(id: 0, name: "chaged", price: Int.random(in: 100...1000), count: Int.random(in: 0...3)),
            Menu(id: 1, name: "chaged", price: Int.random(in: 100...1000), count: Int.random(in: 0...3)),
            Menu(id: 2, name: "chaged", price: Int.random(in: 100...1000), count: Int.random(in: 0...3)),
        ]) // 하나짜리로 쫙 바뀜
        
    }
}

//extension MenuViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemTableViewCell") as! MenuItemTableViewCell
//
//        let menu = viewModel.menus[indexPath.row]
//        cell.title.text = menu.name
//        cell.price.text = "\(menu.price)"
//        cell.count.text = "\(menu.count)"
//
//        return cell
//    }
//}
