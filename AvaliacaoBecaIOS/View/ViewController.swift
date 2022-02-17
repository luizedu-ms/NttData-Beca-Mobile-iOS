//
//  ViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 13/02/22.
//

import UIKit
import Alamofire
import AlamofireImage
class ViewController: UIViewController {

    @IBOutlet weak var destaquesCollectionView: UICollectionView!

    var posterArray : [Result] = []
    private var keyApi = "680d12ebba0195c58970bf381ab494db"
    private var url = "https://image.tmdb.org/t/p/w500/"
    
    override func viewDidLoad() {
        AF.request("https://api.themoviedb.org/3/trending/movie/week?api_key=\(keyApi)&language=pt-BR").responseJSON { response in
                    if response.response?.statusCode == 200{
                        if let jsonData = response.data{
                            do{
                                let moviesAPI:MoviesAPI = try JSONDecoder().decode(MoviesAPI.self, from:jsonData)
                                print(moviesAPI.results.count)
                                self.posterArray = moviesAPI.results
                                self.destaquesCollectionView.reloadData()
                            }catch{
                                print(error)
                    }
                }
            }
        }
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posterArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        if let posterURL = URL(string: url + posterArray[indexPath.row].posterPath) {
                cell.posterImage.layer.cornerRadius = 15
                cell.posterImage.layer.masksToBounds = true
                cell.posterImage.af.setImage(withURL: posterURL, imageTransition: .crossDissolve(0.2))
            }else{
                print("erro")
            }

       
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destaquesPageController = DestaquePageViewController(nibName: "DestaquePageViewController", bundle: nil)
        navigationController?.pushViewController(destaquesPageController, animated: true)
    }
}
