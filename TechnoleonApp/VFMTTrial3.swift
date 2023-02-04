//
//  VFMTTrial3.swift
//  TechnoleonApp
//
//  Created by user220873 on 11/18/22.
//

import SwiftUI

struct VFMTTrial3: View {
    @ObservedObject var stopwatchManager = StopwatchManager()
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var VFMTBody = VFMTRequestBody.shared
    @State var errors: Int = 0
    var isFormNotValid: Bool {
        if stopwatchManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                Text(NSLocalizedString("Trial 3", comment: "Trial 3"))
                    .font(.custom("", size: 30))
                Text(NSLocalizedString("Time to save", comment: "Time to save") + ":")
                    .font(.custom("", size: 16))
                Text(stopwatchManager.timeToSave)
                    .font(.custom("", size: 16))
            }
            Spacer()
            
            StopwatchView(stopwatchManager: stopwatchManager)
            Spacer()
            
            Text(NSLocalizedString("Errors", comment: "Errors"))
            HStack{
                Spacer()
                Button(action: {if errors >= 1 {errors -= 1}}){
                    Text("-")
                        .font(.custom("", size: 50))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                }
                .frame(width: 50, height: 50)
                .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                .cornerRadius(10)
                
                Text("\(errors)")
                    .font(.custom("", size: 50))
                    .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))

                Button(action: {errors += 1}){
                    Text("+")
                        .font(.custom("", size: 50))
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
                .frame(width: 50, height: 50)
                .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                .cornerRadius(10)
                Spacer()
            }
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setVFMTTest()}) {
                Text(NSLocalizedString("Save the data", comment: "Save the data"))
                    .font(.custom("", size: 22))                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle(NSLocalizedString("VFMT_title", comment: "VFMT_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setVFMTBody(){
        VFMTBody.trial3_end_time = stopwatchManager.timeToSave
        VFMTBody.trail3_errors = errors
    }
    
    func setVFMTTest(){
        setVFMTBody()
        technoleonAPI.setVFMTTestForPlayer(id: loggedInUser.player_id!, vfmtRequestBody: VFMTBody) { (result) in
            switch result {
            case .success(_):
                print("SUCCES")
            case .failure(let error):
                switch error{
                case .urlError(let urlError):
                    print("URL error: \(String(describing: urlError))")
                case .decodingError(let decodingError):
                    print("decode error: \(String(describing: decodingError))")
                case .genericError(let error):
                    print("error: \(String(describing: error))")
                }
            }
        }
    }
}

struct VFMTTrial3_Previews: PreviewProvider {
    static var previews: some View {
        VFMTTrial3()
    }
}
