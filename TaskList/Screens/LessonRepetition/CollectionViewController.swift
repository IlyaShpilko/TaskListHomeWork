//
//  CollectionViewController.swift
//  TaskList
//
//  Created by Shpilko Ilya on 2/13/21.
//

import UIKit

extension UICollectionView {
    func registerNib(with type: NameDescribadle.Type) {
        self.register(UINib(nibName: type.typeName, bundle: nil), forCellWithReuseIdentifier: type.typeName)
    }
    
    func dequeueReusableCell<T: NameDescribadle>(with type: T.Type, indexPath: IndexPath) -> T{
        return self.dequeueReusableCell(withReuseIdentifier: type.typeName, for: indexPath) as! T
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

extension Int {
    var isOdd: Bool {
        return self % 2 == 0
    }
}

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let delegate = DelegateCollectionView()
    let items: [(title: String, color: UIColor)] = [("some1", .random()), ("some2", .random()), ("some3", .random()), ("some4", .random()), ("some5", .random()), ("some6", .random())]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = delegate
        collectionView.dataSource = delegate

        self.collectionView.registerNib(with: CollectionViewCell.self)
        
        setupCollectionViewDelegate()
    }
    
    private func setupCollectionViewDelegate() {
        delegate.items = items
    }
}

class DelegateCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    
    var items: [(title: String, color: UIColor)] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: CollectionViewCell.self, indexPath: indexPath)
        cell.titleLabel.text = items[indexPath.row].title
        cell.backView.backgroundColor = items[indexPath.row].color
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        (collectionView.cellForItem(at: indexPath) as? CollectionViewCell)?.backView.backgroundColor = .red
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        (collectionView.cellForItem(at: indexPath) as? CollectionViewCell)?.backView.backgroundColor = .random()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row.isOdd {
            return CGSize(width: 100, height: 20)
        } else {
            return CGSize(width: 20, height: 100)
        }
    }
}
