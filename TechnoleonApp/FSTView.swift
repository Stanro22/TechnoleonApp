//
//  FSTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct FSTView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var fstBody = FSTRequestBody()
    @ObservedObject var timerManager = StopwatchManager()
    @ObservedObject var slalomManager = StopwatchManager()
    @ObservedObject var dribbleManager = StopwatchManager()
    @ObservedObject var backwardsManager = StopwatchManager()
    @ObservedObject var figureManager = StopwatchManager()
    @ObservedObject var passManager = StopwatchManager()
    @State var round: Int = 0
    @State private var isExpanded = false
    @State private var selectedResult = NSLocalizedString("Result", comment: "Result")
    private var results = ["Goal", "Post", "Miss"]
    @State var IsResultSelected: Bool = false
    var isFormNotValid: Bool {
        if timerManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                VStack{
                    HStack{
                        Text(NSLocalizedString("Slalom", comment: "Slalom"))
                        Spacer()
                        Text("\(slalomManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                    .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                    HStack{
                        Text(NSLocalizedString("Dribble", comment: "Dribble"))
                        Spacer()
                        Text("\(dribbleManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                    .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                    HStack{
                        Text(NSLocalizedString("Backwards", comment: "Backwards"))
                        Spacer()
                        Text("\(backwardsManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                    .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                    HStack{
                        Text(NSLocalizedString("8-figure", comment: "8-figure"))
                        Spacer()
                        Text("\(figureManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                    .overlay(Rectangle().frame(width: 190, height: 2, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                    HStack{
                        Text(NSLocalizedString("Pass", comment: "Pass"))
                        Spacer()
                        Text("\(passManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 5, trailing: 0))
                    .overlay(Rectangle().frame(width: 230, height: 4, alignment: .bottom).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color(red: 0.38, green: 0.44, blue: 0.64)), alignment: .bottom)
                    HStack{
                        Text(NSLocalizedString("End time", comment: "End time"))
                        Spacer()
                        Text("\(timerManager.timeToSave)")
                    }
                    .frame(width: 200, height: 30)
                    .padding(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
                
                Button(action: resetTimes){
                    Text("Reset")
                        .foregroundColor(Color.white)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                }
                .cornerRadius(15)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                
                Text(secondsToMinutesAndSeconds(seconds: Int(timerManager.seconds)))
                    .font(.custom("", size: 40))
                    .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                    .frame(width: 180, height: 180)
                    .overlay(
                        RoundedRectangle(cornerRadius: 90)
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                    )
                    .onAppear(){
                        self.timerManager.seconds = 0
                    }
                
                HStack{
                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                        .onTapGesture(perform: {
                            if self.timerManager.timerMode == .initial {
                                self.timerManager.seconds = 0
                                self.slalomManager.seconds = 0
                            }
                            self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                            if self.timerManager.timerMode == .running {
                                self.slalomManager.start()
                            }
                        })
                    Spacer()
                    Button(action: {setTableTimes()}){
                        Text(NSLocalizedString("Round", comment: "Round"))
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                    }
                    .cornerRadius(10)
                }
                .frame(width: 170, height: 50)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                Spacer()
                
                DisclosureGroup("\(selectedResult)", isExpanded: $isExpanded){
                    ScrollView {
                        VStack{
                            ForEach(results, id: \.self) { result in
                                Text("\(result)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all)
                                    .onTapGesture {
                                        self.selectedResult = result
                                        IsResultSelected = true
                                        withAnimation{
                                            self.isExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    }.frame(width: 300, height: 150)
                }
                .accentColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .foregroundColor(Color.black)
                .frame(width: 300)
                .padding(.all)
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                Spacer()
                
                NavigationLink(destination: EndOfTestView().onAppear{setFSTTest()}) {
                    Text(NSLocalizedString("Save the data", comment: "Save the data"))
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                    .disabled(isFormNotValid)
            }
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle(NSLocalizedString("FST_title", comment: "FST_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setTableTimes(){
        self.round += 1
        if round == 1 {
            self.slalomManager.pause()
            self.dribbleManager.start()
        }
        if round == 2 {
            self.dribbleManager.pause()
            self.backwardsManager.start()
        }
        if round == 3 {
            self.backwardsManager.pause()
            self.figureManager.start()
        }
        if round == 4 {
            self.figureManager.pause()
            self.passManager.start()
        }
        if round == 5 {
            self.passManager.pause()
            self.timerManager.pause()
        }
    }
    
    func resetTimes(){
        timerManager.reset()
        slalomManager.reset()
        dribbleManager.reset()
        backwardsManager.reset()
        figureManager.reset()
        passManager.reset()
        self.round = 0
    }
    
    func setFSTBody(){
        fstBody.slalomTime = "00:\(slalomManager.timeToSave)"
        fstBody.dribbletime = "00:\(dribbleManager.timeToSave)"
        fstBody.backwardTime = "00:\(backwardsManager.timeToSave)"
        fstBody.figureTime = "00:\(figureManager.timeToSave)"
        fstBody.passingTime = "00:\(passManager.timeToSave)"
        fstBody.goalPostMiss = selectedResult
    }
    
    func setFSTTest(){
        setFSTBody()
        technoleonAPI.setFSTTestForPlayer(id: loggedInUser.player_id!, FSTRequestBody: fstBody) { (result) in
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

struct FSTView_Previews: PreviewProvider {
    static var previews: some View {
        FSTView()
    }
}
