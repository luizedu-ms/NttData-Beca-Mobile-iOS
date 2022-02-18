//
//  DestaquePageViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 14/02/22.
//

import UIKit
import AlamofireImage
class DestaquePageViewController: UIViewController {
    
//    var posterPhoto: String?
//    var tituloValue: String?
//    var overview: String?
//    var voteRate: Double?

    @IBOutlet weak var PosterDestaqueImageView: UIImageView!
    @IBOutlet weak var TituloLabel: UILabel!
    @IBOutlet weak var PopularidadeLabel: UILabel!
    @IBOutlet weak var SinopseLabel: UILabel!
    
    var detalhes: Result?
    
    class func instanciar(_ detalhes: Result) -> DestaquePageViewController{
        let destaquesPageController = DestaquePageViewController(nibName: "DestaquePageViewController", bundle: nil)
        destaquesPageController.detalhes = detalhes
        
        return destaquesPageController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
         // Do any additional setup after loading the view.
    }
    
    func configuraView(){

        
        //let size = CGSize(width: 500.0, height: 400.0)
        //moviesArray[indexPath.row].posterPath
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500/" + detalhes!.posterPath )!
        PosterDestaqueImageView.af.setImage(withURL: posterURL, imageTransition: .crossDissolve(0.2))
        
        TituloLabel.text = detalhes?.title
        PopularidadeLabel.text = "\(detalhes?.voteAverage ?? 0)"
        SinopseLabel.text = detalhes?.overview
        
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

