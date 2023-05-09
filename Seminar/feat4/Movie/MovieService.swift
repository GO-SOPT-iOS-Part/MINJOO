//
//  MovieService.swift
//  SOPT_iOS_SEMINAR
//
//  Created by Minjoo Kim on 2023/05/09.
//

import Foundation

import Alamofire


final class MovieService {
    
    static let shared = MovieService()
    
    func getNowPlaying(completion: @escaping (NetworkResult <Any>) -> Void) {
        
        let url = Config.baseURL + "/3/movie/now_playing?language=ko"
        let header: HTTPHeaders = ["Content-Type" : "application/json",
                                   "Authorization" : Config.apiKey]
        
        print("\(url)")
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                print("\(statusCode)")
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.networkErr)
            }
        }
            
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(MovieResponse.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}
