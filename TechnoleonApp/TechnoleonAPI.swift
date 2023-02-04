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

enum RequestError: Error {
    case urlError(URLError)
    case decodingError(DecodingError)
    case genericError(Error)
}

final class TechnoleonAPI : ObservableObject{
    static let shared = TechnoleonAPI()
    private var cancellable: Set<AnyCancellable> = .init()
    private var keycloak_base_url = "https://8080-forwardsportstec-fsdb-jc8iluz9wf6.ws-eu54.gitpod.io/"
    private var dashboard_base_url = ""

    private let keychain = Keychain()
    private var accesTokenKeychainKey = "accesToken"
    
    //Get and Set accestoken with keychain
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
    
    //Set boolean isAuthenticated
    @Published var isAuthenticated: Bool = false
    
    private init() {
        isAuthenticated = accesToken != nil
    }

    //Execute request function
    func execute<Response: Decodable>(
        request: URLRequest,
        completion: @escaping (Result<Response, RequestError>
    ) -> Void) {
        //setting url session
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (result) in
                switch result {
                //if finished -> stop/break out of function
                case .finished:
                    break
                //if failure -> define error
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
    
    //URL request: Login with filled in email and password -> login response
    func login(email: String, password: String, client_id: String, completion: @escaping (Result<LoginResponse, RequestError>) -> Void){
        let url = URL(string: "\(keycloak_base_url)auth/realms/DEV/protocol/openid-connect/token")!
        var urlRequest = URLRequest(url: url)
        
        //Set values
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        //Assign parameters
        let parameters = LoginRequest(
            grant_type: "password",
            client_id: client_id,
            email: email,
            password: password
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        
        //Execute request
        execute(request: urlRequest, completion: completion)
    }
    
    //URL request: get user_id by email -> userid response
    func getUserIdByEmail(email: String, completion: @escaping (Result<UserIdResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)getUserIdByEmail/\(email)")!
        var urlRequest = URLRequest(url: url)
        
        //Set values
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        
        //Execute request
        execute(request: urlRequest, completion: completion)
    }
    
    //URL request: get user by user_id -> user response
    func getUserByUserId(user_id: String, completion: @escaping(Result<UserResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)getUserByUserId/\(user_id)")!
        var urlRequest = URLRequest(url: url)
        
        //Set values
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        
        //Execute request
        execute(request: urlRequest, completion: completion)
    }
    
    func getUserPlayerById(id: String, completion: @escaping (Result<UserResponse, RequestError>) -> Void){
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
        //urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        execute(request: urlRequest, completion: completion)
    }
    
    func getTestById(id: String, completion: @escaping (Result<TestResponse, RequestError>) -> Void){
        let url = URL(string: "https://forwardfootballwebapp.azurewebsites.net/v1/Tests/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "GET"
        execute(request: urlRequest, completion: completion)
    }
    
    //URL requests: Post tests
    //FST
    func setFSTTestForPlayer(id: String, FSTRequestBody: FSTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postFSTTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = FSTRequest(
            slalomTime: FSTRequestBody.slalomTime,
            dribbleTime: FSTRequestBody.dribbletime,
            backwardTime: FSTRequestBody.backwardTime,
            eightFigureTime: FSTRequestBody.figureTime,
            passingTime: FSTRequestBody.passingTime,
            goalPostMiss: FSTRequestBody.goalPostMiss
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //LSPT
    func setLSPTTestForPlayer(id: String, LSPTRequestBody: LSPTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postLSPTTest/\(id)")!
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
            finalTime: LSPTRequestBody.finalTime
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //IJBT
    func setInsaitJoyTestForPlayer(id: String, insaitJoyRequestBody: InsaitJoyRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postIJBTTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = InsaitJoyRequest(
            level: insaitJoyRequestBody.level,
            drill: insaitJoyRequestBody.drill,
            trainingTime: insaitJoyRequestBody.trainingTime,
            count: insaitJoyRequestBody.count,
            frequency: insaitJoyRequestBody.frequency,
            fluency: insaitJoyRequestBody.fluency
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //PUP10
    func setPUP10TestForPlayer(id: String, pup10RequestBody: PUP10RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postPUP10Test/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = PUP10Request(
            final_time: pup10RequestBody.final_time,
            wrong_target: pup10RequestBody.wrong_target,
            taken_away: pup10RequestBody.taken_away,
            outside_cones: pup10RequestBody.outside_cones,
            to_high_outside_cones: pup10RequestBody.to_high_outside_cones,
            over_the_line_outside_cones: pup10RequestBody.over_the_line_outside_cones,
            wrong_area_outside_cones: pup10RequestBody.wrong_area_outside_cones,
            to_high_inside_cones: pup10RequestBody.to_high_inside_cones,
            over_the_line_inside_cones: pup10RequestBody.over_the_line_inside_cones,
            wrong_area_inside_cones: pup10RequestBody.wrong_area_inside_cones
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //GID
    func setGiTTestForPlayer(id: String, giTRequestBody: GiTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postGIDTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = GiTRequest(
            zones: giTRequestBody.zones
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //VFMT
    func setVFMTTestForPlayer(id: String, vfmtRequestBody: VFMTRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postVFMTTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = VFMTRequest(
            trail1_end_time: vfmtRequestBody.trial1_end_time,
            trail1_errors: vfmtRequestBody.trail1_errors,
            trail2_end_time: vfmtRequestBody.trial2_end_time,
            trail2_errors: vfmtRequestBody.trail2_errors,
            trail3_end_time: vfmtRequestBody.trial3_end_time,
            trail3_errors: vfmtRequestBody.trail3_errors
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //KTK3
    func setKTK3TestForPlayer(id: String, KTK3RequestBody: KtK3RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postKTK3Test/\(id)")!
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
    
    //T-Test
    func setTTestTestForPlayer(id: String, TTestRequestBody: TTestRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postTTestTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = TTestRequest(
            seconds: TTestRequestBody.seconds
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //Sprint3
    func setTenTwentyThirtyFiveSprintTestForPlayer(id: String, tenTwentyThirtyFiveSprintRequestBody: TenTwentyThirtyFiveSprintRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postSprint3Test/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = TenTwentyThirtyFiveSprintRequest(
            distance: tenTwentyThirtyFiveSprintRequestBody.distance,
            seconds: tenTwentyThirtyFiveSprintRequestBody.seconds
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //Sprint10x5
    func setSprint10x5TestForPlayer(id: String, Sprint10x5RequestBody: Sprint10x5RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postSprint10x5Test/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = Sprint10x5Request(
            seconds: Sprint10x5RequestBody.seconds
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //ISRT
    func setShuttleRunTestForPlayer(id: String, newLevel: Int, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postISRTTest/\(id)")!
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
    
    //YYIRT
    func setYoYoTestForPlayer(id: String, newLevel: Int, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postYYIRTTest/\(id)")!
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
   
    //Anthro
    func setFatPercentageTestForPlayer(id: String, FatPercentageRequestBody: FatPercentageRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postAnthroTest/\(id)")!
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
    
    //APHV
    func setPHVTestForPlayer(id: String, PHVRequestBody: PHVRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postAPHVTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = PHVRequest(
            lengthCM: PHVRequestBody.lengthCM,
            sitHeightCM: PHVRequestBody.sitHeightCM,
            weightKG: PHVRequestBody.weightKG
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //RPE
    func setRPETestForPlayer(id: String, rpeRequestBody: RPERequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postRPETest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = RPERequest(
            trainingstype: rpeRequestBody.trainingstype,
            sessiontype: rpeRequestBody.sessiontype,
            date_of_training: rpeRequestBody.date_of_training,
            starting_time: rpeRequestBody.starting_time,
            duration: rpeRequestBody.duration,
            days_before_or_after_training: rpeRequestBody.days_before_or_after_training,
            rpe_score: rpeRequestBody.rpe_score,
            satisfaction: rpeRequestBody.satisfaction,
            comments: rpeRequestBody.comments
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //SAR
    func setSitAndReachTestForPlayer(id: String, SitAndReachRequestBody: SitAndReachRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postSARTest/\(id)")!
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
    
    //CNAAQ
    func setCNAAQTestForPlayer(id: String, cnaaqRequestBody: CNAAQRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postCNAAQTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = CNAAQRequest(
            question_1: cnaaqRequestBody.question_1,
            question_2: cnaaqRequestBody.question_2,
            question_3: cnaaqRequestBody.question_3,
            question_4: cnaaqRequestBody.question_4,
            question_5: cnaaqRequestBody.question_5,
            question_6: cnaaqRequestBody.question_6,
            question_7: cnaaqRequestBody.question_7,
            question_8: cnaaqRequestBody.question_8,
            question_9: cnaaqRequestBody.question_9,
            question_10: cnaaqRequestBody.question_10,
            question_11: cnaaqRequestBody.question_11,
            question_12: cnaaqRequestBody.question_12,
            question_13: cnaaqRequestBody.question_13,
            question_14: cnaaqRequestBody.question_14,
            question_15: cnaaqRequestBody.question_15,
            question_16: cnaaqRequestBody.question_16,
            question_17: cnaaqRequestBody.question_17,
            question_18: cnaaqRequestBody.question_18,
            question_19: cnaaqRequestBody.question_19,
            question_20: cnaaqRequestBody.question_20,
            question_21: cnaaqRequestBody.question_21
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //MCSYS
    func setMCSYSTestForPlayer(id: String, mcsysRequestBody: MCSYSRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postMCSYSTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = MCSYSRequest(
            question_1: mcsysRequestBody.question_1,
            question_2: mcsysRequestBody.question_2,
            question_3: mcsysRequestBody.question_3,
            question_4: mcsysRequestBody.question_4,
            question_5: mcsysRequestBody.question_5,
            question_6: mcsysRequestBody.question_6,
            question_7: mcsysRequestBody.question_7,
            question_8: mcsysRequestBody.question_8,
            question_9: mcsysRequestBody.question_9,
            question_10: mcsysRequestBody.question_10,
            question_11: mcsysRequestBody.question_11,
            question_12: mcsysRequestBody.question_12
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //AGQ
    func setAGQTestForPlayer(id: String, agqRequestBody: AGQRequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postAGQTest/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = AGQRequest(
            question_1: agqRequestBody.question_1,
            question_2: agqRequestBody.question_2,
            question_3: agqRequestBody.question_3,
            question_4: agqRequestBody.question_4,
            question_5: agqRequestBody.question_5,
            question_6: agqRequestBody.question_6,
            question_7: agqRequestBody.question_7,
            question_8: agqRequestBody.question_8,
            question_9: agqRequestBody.question_9,
            question_10: agqRequestBody.question_10,
            question_11: agqRequestBody.question_11,
            question_12: agqRequestBody.question_12
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
    
    //MTQ10
    func setMTQ10TestForPlayer(id: String, mtq10RequestBody: MTQ10RequestBody, completion: @escaping (Result<setTestResponse, RequestError>) -> Void){
        let url = URL(string: "\(dashboard_base_url)postMTQ10Test/\(id)")!
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Bearer \(accesToken!)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        let parameters = MTQ10Request(
            question_1: mtq10RequestBody.question_1,
            question_2: mtq10RequestBody.question_2,
            question_3: mtq10RequestBody.question_3,
            question_4: mtq10RequestBody.question_4,
            question_5: mtq10RequestBody.question_5,
            question_6: mtq10RequestBody.question_6,
            question_7: mtq10RequestBody.question_7,
            question_8: mtq10RequestBody.question_8,
            question_9: mtq10RequestBody.question_9,
            question_10: mtq10RequestBody.question_10
        )
        
        let encoder = JSONEncoder()
        guard let body = try? encoder.encode(parameters) else {return}
        urlRequest.httpBody = body
        execute(request: urlRequest, completion: completion)
    }
}
