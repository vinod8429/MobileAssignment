//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation

class ApiService : NSObject {
    private let baseUrl = ""
    
    private let sourcesURL = URL(string: "https://api.restful-api.dev/objects")!
    
    func fetchDeviceDetails(completion : @escaping ([DeviceData]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                DispatchQueue.main.async { completion([]) }
                 // Return an empty array on network failure
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async { completion([])  }
                return
            }
            
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode([DeviceData].self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData) }
                
            }catch
            {
                print("Decoding error!")
            }
            
            
//            if let data = data {
//                let jsonDecoder = JSONDecoder()
//                let empData = try! jsonDecoder.decode([DeviceData].self, from: data)
//                if (empData.isEmpty) {
//                    completion([])
//                }
//            }
        }.resume()
    }
}
