//
//  MainPageViewModel.swift
//  BootcampKonuTekrari
//
//  Created by Mert Demirtaş on 18.09.2022.
//

import Foundation

protocol MainPageViewModelDelegate: AnyObject {
    func reloadData()
}

class MainPageViewModel {
    private var itemsArray: RickAndMortyCharacterModel?
    private var currentPageNumber = 1
    
//    var closure: (() -> Void)? Delegate yerine bu closure'ı kullanabiliriz
    
    weak var delegate: MainPageViewModelDelegate?
    
    
    func getData() {
        NetworkManager.shared.fetchData(pageNumber: currentPageNumber, completion: { [weak self] (result: RickAndMortyCharacterModel) in
            self?.bindData(result: result)
        })
    }
    
    private func bindData(result: RickAndMortyCharacterModel) {
        guard (itemsArray != nil) else {
            itemsArray = result
            delegate?.reloadData()
//            closure!()
            return
        }
        
        for element in result.results {
            itemsArray?.results.append(element)
        }
        delegate?.reloadData()
//        closure!()
    }
    
    func getArrayCount() -> Int {
        return itemsArray?.results.count ?? 0
    }
    
    func getItemData(indexPath: IndexPath) -> CharacterTableViewCellModel? {
        if let characterArray = itemsArray?.results {
            return CharacterTableViewCellModel(image: characterArray[indexPath.row].image, name: characterArray[indexPath.row].name)
        }
        return nil
    }
    
    func getMoreData() {
        currentPageNumber += 1
        getData()
    }
}
