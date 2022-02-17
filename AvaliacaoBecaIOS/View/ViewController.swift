//
//  ViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 13/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var destaquesCollectionView: UICollectionView!

    var posterArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),]
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
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.posterImage.image = posterArray[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destaquesPageController = DestaquePageViewController(nibName: "DestaquePageViewController", bundle: nil)
        navigationController?.pushViewController(destaquesPageController, animated: true)
    }
}
