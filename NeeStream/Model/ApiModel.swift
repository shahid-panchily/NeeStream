//
//  ApiModel.swift
//  NeeStream
//
//  Created by shahid panchily on 27/03/21.
//

import Foundation

protocol modeldelegate {
    func categoriesFetched(_ categories:[Categories] )
}


class ApiModel {
    
    var delegate: modeldelegate?
    
    func getData() {
        
        
        
        let url = URL(string: constants.API_URL)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            // parsing the Data
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.categories != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.categoriesFetched(response.categories!)
                    }
                }
            }
            catch {
                
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
}
