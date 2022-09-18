//
//  MainPageViewController.swift
//  BootcampKonuTekrari
//
//  Created by Mert Demirtaş on 18.09.2022.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    lazy var viewModel: MainPageViewModel? = MainPageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        
        viewModel?.delegate = self
        
//        viewModel?.closure = { [weak self] in
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//
//            }
//        }
        
        viewModel?.getData()
    }
    
    private func prepareTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CharacterTableViewCell.self), bundle: nil), forCellReuseIdentifier: "CharacterTableViewCell")
    }
}

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getArrayCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell else {return UITableViewCell()}
        
        if let cellData = viewModel?.getItemData(indexPath: indexPath) {
            cell.configure(data: CharacterTableViewCellModel(image: cellData.image, name: cellData.name))
                return cell
        }
        return cell
    }
}

extension MainPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let arrayCount = viewModel?.getArrayCount() else { return }
        if(indexPath.row == (arrayCount - 1)) {
            viewModel?.getMoreData()
        }
    }
}

extension MainPageViewController: MainPageViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


