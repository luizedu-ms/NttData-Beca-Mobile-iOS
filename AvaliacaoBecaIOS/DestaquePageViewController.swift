//
//  DestaquePageViewController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 14/02/22.
//

import UIKit

class DestaquePageViewController: UIViewController {

    @IBOutlet weak var PosterDestaqueImageView: UIImageView!
    
    @IBOutlet weak var TituloLabel: UILabel!
    
    @IBOutlet weak var PopularidadeLabel: UILabel!
    
    @IBOutlet weak var SinopseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
