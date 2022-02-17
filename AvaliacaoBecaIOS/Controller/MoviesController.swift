//
//  MoviesController.swift
//  AvaliacaoBecaIOS
//
//  Created by Luiz Mendes Silva on 17/02/22.
//

import Foundation
import Alamofire


class MoviesController{
    
    private var moviesArray: [Result] = []
    private var keyApi = "680d12ebba0195c58970bf381ab494db"
    func count() -> Int{
        return self.moviesArray.count
    }
    func loadCurrentePoster(indexPath: IndexPath) -> String{
        return self.moviesArray[indexPath.row].posterPath
    }
    
    func getRequestMoviews(completionHandler: @escaping (Bool, Error?) -> Void){
        AF.request("https://api.themoviedb.org/3/trending/movie/week?api_key=\(keyApi)&language=pt-BR").responseJSON { response in
                    if response.response?.statusCode == 200{
                        if let jsonData = response.data{
                            do{
                                let moviesAPI:MoviesAPI = try JSONDecoder().decode(MoviesAPI.self, from:jsonData)
                             
                                self.moviesArray = moviesAPI.results
                                completionHandler(true, nil)
                            }catch{
                                print(error)
                                completionHandler(false, error)
                    }
                }
            }
        }
    }
}
