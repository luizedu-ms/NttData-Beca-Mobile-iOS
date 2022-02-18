//
//  ViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 13/02/22.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController {

    @IBOutlet weak var destaquesCollectionView: UICollectionView!
    
    var controller: MoviesController = MoviesController()

    //var moviesArray : [Result] = []
 
    var url = "https://image.tmdb.org/t/p/w500/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.destaquesCollectionView.delegate = self
        self.destaquesCollectionView.dataSource = self
        
        self.controller.getRequestMoviews { response, error in
            if response == true{
                self.destaquesCollectionView.reloadData()
            }else{
                print(error!)
            }
        }
    }
    
    func irParaDetalhes(_ detalhes: Result?){
        
        if let posterSelecionado = detalhes{
            let destaquesPageController = DestaquePageViewController.instanciar(posterSelecionado)
            navigationController?.pushViewController(destaquesPageController, animated: true)
        }
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.controller.count()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        //let size = CGSize(width: 500.0, height: 400.0)
        //moviesArray[indexPath.row].posterPath
        if let posterURL = URL(string: url + self.controller.loadCurrentePoster(indexPath: indexPath)) {
                cell.posterImage.layer.cornerRadius = 15
                cell.posterImage.layer.masksToBounds = true
              //  cell.posterImage.sizeThatFits(size)
                cell.posterImage.af.setImage(withURL: posterURL, imageTransition: .crossDissolve(0.2))
            }else{
                print("erro")
            }
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let posterSelecionado = controller.moviesArray[indexPath.row]
        irParaDetalhes(posterSelecionado)
    }
}
