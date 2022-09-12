//  FetchPictures.swift
//  NASA
//
//  Created by Emmanuel Watila on 07/09/2022.

import Foundation


// URL
var url = "https://api.nasa.gov/planetary/apod?api_key=KEY&count=30"


final class ViewData: ObservableObject {
    @Published var pictures: [PictureData] = []
    @Published var state: ResponseState = ResponseState.Loading
    
    
    init () {
        makeCall()
    }
    
    func getNASAPictures(completion: @escaping (Result<[PictureData], Error>) -> Void) -> Void {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            if let error = error {
                completion(.failure(error as Error))
                return
            }
            
            do {
                
                let result = try JSONDecoder().decode([PictureData].self, from: data!)
                completion(.success(result))

            } catch let jsonError {
                completion(.failure(jsonError as Error))
            }
        })
        
        task.resume()
    }
    
    func makeCall() {
        DispatchQueue.main.async {
            self.state = ResponseState.Loading
        }
        
        getNASAPictures{(result) in
            switch result {
            case .success(let pictures):
                DispatchQueue.main.async {
                    self.pictures = pictures.filter { picture in
                        (picture.media_type == "image")
                    }
                    self.state = ResponseState.Success
                }
            case .failure(let error):
                print("Failed: \(error)")
                
                DispatchQueue.main.async {
                    self.state = ResponseState.Failed
                }
            }
        }
    }
    
    func refresh () {
        makeCall()
    }
    
    //End
}


