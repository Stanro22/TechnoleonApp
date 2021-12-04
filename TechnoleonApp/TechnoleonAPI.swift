//
//  TechnoleonAPI.swift
//  TechnoleonApp
//
//  Created by user206981 on 12/4/21.
//

import Foundation
import Combine
import UIKit
import KeychainAccess

final class TechnoleonAPI : ObservableObject{
    static let shared = TechnoleonAPI()
    private var cancellable: Set<AnyCancellable> = .init()

    private let keychain = Keychain()
    private var accesTokenKeychainKey = "accesToken"
    
    var accesToken: String? {
        get{
            try? keychain.get(accesTokenKeychainKey)
        }
        set(newValue){
            guard let accesToken = newValue else{
                try? keychain.remove(accesTokenKeychainKey)
                isAuthenticated = false
                return
            }
            try? keychain.set(accesToken, key: accesTokenKeychainKey)
            isAuthenticated = true
        }
    }
    
    @Published var isAuthenticated: Bool = false
    
    private init() {
        isAuthenticated = accesToken != nil
    }
    
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/api/Users/login")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let parameters = LoginRequest(
            username: username,
            password: password
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func execute<Response: Decodable>(
        request: URLRequest,
        completion: @escaping (Result<Response, RequestError>
    ) -> Void) {
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result) in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    switch error {
                    case let urlError as URLError:
                        completion(.failure(.urlError(urlError)))
                    case let decodingError as DecodingError:
                        completion(.failure(.decodingError(decodingError)))
                    default:
                        completion(.failure(.genericError(error)))
                    }
                }
            }, receiveValue: { (response) in
                completion(.success(response))
            }).store(in: &cancellable)
        }
}

enum RequestError: Error {
    case urlError(URLError)
    case decodingError(DecodingError)
    case genericError(Error)
}
