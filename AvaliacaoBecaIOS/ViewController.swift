//
//  ViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 13/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var destaquesCollectionView: UICollectionView!

    var posterArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "2"),]
    override func viewDidLoad() {
        super.viewDidLoad()
        destaquesCollectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = destaquesCollectionView.dequeueReusableCell(withReuseIdentifier: "destaqueCell", for: indexPath)
        
        return cell
    }
    
    
}
