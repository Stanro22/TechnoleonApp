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
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Authentication/Login")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let parameters = LoginRequest(
            email: email,
            password: password
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func getUserById(id: String, completion: @escaping (Result<UserResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Users/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        execute(request: urlRequest, completion: completion)       
    }
    
    func getUserPlayerById(id: String, completion: @escaping (Result<UserPlayerResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Users/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        execute(request: urlRequest, completion: completion)
    }
    
    func getTeamById(id: String, completion: @escaping (Result<TeamResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Teams/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        execute(request: urlRequest, completion: completion)
    }
    
    func setKTK3TestForPlayer(id: String, KTK3RequestBody: KtK3RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/KTK3plus")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = KtK3Request(
            hoppingSideways1: KTK3RequestBody.hoppingSideways1,
            hoppingSideways2: KTK3RequestBody.hoppingSideways2,
            movingSideways1: KTK3RequestBody.movingSideways1,
            movingSideways2: KTK3RequestBody.movingSideways1,
            handEye1: KTK3RequestBody.handEye1,
            handEye2: KTK3RequestBody.handEye2,
            beam11: KTK3RequestBody.beam11,
            beam12: KTK3RequestBody.beam12,
            beam13: KTK3RequestBody.beam13,
            beam21: KTK3RequestBody.beam21,
            beam22: KTK3RequestBody.beam22,
            beam23: KTK3RequestBody.beam23,
            beam31: KTK3RequestBody.beam31,
            beam32: KTK3RequestBody.beam32,
            beam33: KTK3RequestBody.beam33
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setPHVTestForPlayer(id: String, PHVRequestBody: PHVRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/PHV")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = PHVRequest(
            lenght: PHVRequestBody.lenght,
            sitHeight: PHVRequestBody.sitHeight,
            weight: PHVRequestBody.weight
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setSitAndReachTestForPlayer(id: String, SitAndReachRequestBody: SitAndReachRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/SitAndReach")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = SitAndReachRequest(
            centimeters: SitAndReachRequestBody.centimeters
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setTTestTestForPlayer(id: String, TTestRequestBody: TTestRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/TTest")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = TTestRequest(
            time: TTestRequestBody.time
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setOneLegStanceTestForPlayer(id: String, OneLegStanceRequestBody: OneLegStanceRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/OneLegStance")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = OneLegStanceRequest(
            secondsLeft: OneLegStanceRequestBody.secondsLeft,
            seconds: OneLegStanceRequestBody.seconds
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setSprint10x5TestForPlayer(id: String, Sprint10x5RequestBody: Sprint10x5RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/Tenx5MSprintTest")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = Sprint10x5Request(
            time: Sprint10x5RequestBody.time
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setShuttleRunTestForPlayer(id: String, newLevel: Int, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/IntervalShuttleRunTest")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = ShuttleRunRequest(
            newLevel: newLevel
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setYoYoTestForPlayer(id: String, newLevel: Int, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/YoYoStaminaTest")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = YoYoRequest(
            newLevel: newLevel
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setLSPTTestForPlayer(id: String, LSPTRequestBody: LSPTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/LSPT")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = LSPTRequest(
            missedBench: LSPTRequestBody.missedBench,
            hitWrongTarget: LSPTRequestBody.hitWrongTarget,
            touchedCone: LSPTRequestBody.touchedCone,
            passOutsideArea: LSPTRequestBody.passOutsideArea,
            missedTargetArea: LSPTRequestBody.missedTargetArea,
            hitTenCMStrip: LSPTRequestBody.hitTenCMStrip,
            time: LSPTRequestBody.time,
            finalTime: LSPTRequestBody.finalTime,
            secondsOver: LSPTRequestBody.secondsOver
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setFSTTestForPlayer(id: String, FSTRequestBody: FSTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/FSTTest")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = FSTRequest(
            slalomTime: FSTRequestBody.slalomTime,
            goalPostMiss: FSTRequestBody.goalPostMiss,
            backwardTime: FSTRequestBody.backwardTime,
            dribbleTime: FSTRequestBody.dribbletime,
            eightFigureTime: FSTRequestBody.figureTime,
            passingTime: FSTRequestBody.passingTime
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    func setFatPercentageTestForPlayer(id: String, FatPercentageRequestBody: FatPercentageRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/players/\(id)/FatPercentage")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = FatPercentageRequest(
            breastThickness: FatPercentageRequestBody.breastThickness,
            thighThickness: FatPercentageRequestBody.thighThickness,
            bellyThickness: FatPercentageRequestBody.bellyThickness,
            hipThickness: FatPercentageRequestBody.hipThickness,
            armPitThickness: FatPercentageRequestBody.armPitThickness,
            shoulderBladeThickness: FatPercentageRequestBody.shoulderBladeThickness,
            tricepThickness: FatPercentageRequestBody.tricepThickness
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
