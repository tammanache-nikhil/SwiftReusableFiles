//
//  CollectionViewDataSource.swift
//
//  Created by Tammanache, Nikhil on 27/02/19.
//  Copyright © 2019 Tammanache, Nikhil All rights reserved.
//

import UIKit
import CoreFoundation

class CollectionViewDataSource<Model>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (Model, UICollectionViewCell) -> Void
    
    var models: [Model]
    
    private var cellIdentifier: String
    private var configurator: CellConfigurator
    
    init(models: [Model], cellIdentifier: String, configurator: @escaping CellConfigurator) {

        self.models = models
        self.cellIdentifier = cellIdentifier
        self.configurator = configurator
    }

    // MARK: CollectionView DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        configurator(model, cell)
        
        return cell
    }
    
}
