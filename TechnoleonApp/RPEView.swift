//
//  RPEView.swift
//  TechnoleonApp
//
//  Created by user220873 on 1/3/23.
//

import SwiftUI

struct RPEView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var RPEBody = RPERequestBody()
    @State var date: String = ""
    @State var time: String = ""
    @State var days: String = ""
    @State var rpe: String = ""
    @State var satisfaction: String = ""
    @State var comments: String = ""
    
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    @State private var selectedType = NSLocalizedString("Trainingstype", comment: "Trainingstype")
    @State private var sessionType = NSLocalizedString("Sessiontype", comment: "Sessiontype")
    @State private var duration = NSLocalizedString("Duration", comment: "Duration")
    private var trainingTypes = [NSLocalizedString("Football", comment: "Football"), NSLocalizedString("Badminton", comment: "Badminton"), NSLocalizedString("Basketball", comment: "Basketball"), NSLocalizedString("Boxing", comment: "Boxing"), NSLocalizedString("Dancing", comment: "Dancing"), NSLocalizedString("Fitness", comment: "Fitness"), NSLocalizedString("Golf", comment: "Golf"), NSLocalizedString("Gymnastics", comment: "Gymnastics"), NSLocalizedString("Handball", comment: "Handball"), NSLocalizedString("Running", comment: "Running"), NSLocalizedString("Hiking", comment: "Hiking"), NSLocalizedString("Hockey", comment: "Hockey"), NSLocalizedString("Baseball", comment: "Baseball"), NSLocalizedString("Ice Hockey", comment: "Ice Hockey"), NSLocalizedString("Inline Skating", comment: "Inline Skating"), NSLocalizedString("Judo", comment: "Judo"), NSLocalizedString("Karate", comment: "Karate"), NSLocalizedString("Climbing", comment: "Climbing"), NSLocalizedString("Korfball", comment: "Korfball"), NSLocalizedString("Mountain Biking", comment: "Mountain Biking"), NSLocalizedString("Horse Riding", comment: "Horse Riding"), NSLocalizedString("Powerlifting", comment: "Powerlifting"), NSLocalizedString("Rowing", comment: "Rowing"), NSLocalizedString("Rugby", comment: "Rugby"), NSLocalizedString("Skating", comment: "Skating"), NSLocalizedString("Shorttrack", comment: "Shorttrack"), NSLocalizedString("Softball", comment: "Softball"), NSLocalizedString("Squash", comment: "Squash"), NSLocalizedString("Tennis", comment: "Tennis"), NSLocalizedString("Volleyball", comment: "Volleyball"), NSLocalizedString("Cycling", comment: "Cycling"), NSLocalizedString("Sailing", comment: "Sailing"), NSLocalizedString("Swimming", comment: "Swimming")]
    
    private var sessionTypes = [NSLocalizedString("Expensive fitness training", comment: "Expensive fitness training"), NSLocalizedString("Intensive fitness training", comment: "Intensive fitness training"), NSLocalizedString("Recovery", comment: "Recovery"), NSLocalizedString("Power", comment: "Power"), NSLocalizedString("Skills", comment: "Skills"), NSLocalizedString("Sprint", comment: "Sprint"), NSLocalizedString("Tests", comment: "Tests"), NSLocalizedString("Individual technique training", comment: "Individual technique training"), NSLocalizedString("Official match", comment: "Official match"), NSLocalizedString("Practice match", comment: "Practice match"), NSLocalizedString("Rest", comment: "Rest")]
    
    
    private var timestamps = ["0:15", "0:30", "0:45", "1:00", "1:15", "1:30", "1:45", "2:00", "2:15", "2:30", "2:45", "3:00"]
    
    @State var isTrainingTypeSelected: Bool = false
    @State var isSessionTypeSelected: Bool = false
    @State var isDurationSelected: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView{
                VStack{
                    DisclosureGroup("\(selectedType)", isExpanded: $isExpanded1){
                        ScrollView {
                            VStack{
                                ForEach(trainingTypes, id: \.self) { type in
                                    Text("\(type)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.selectedType = type
                                            isTrainingTypeSelected = true
                                            withAnimation{
                                                self.isExpanded1.toggle()
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
                    
                    DisclosureGroup("\(sessionType)", isExpanded: $isExpanded2){
                        ScrollView {
                            VStack{
                                ForEach(sessionTypes, id: \.self) { type in
                                    Text("\(type)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all)
                                        .onTapGesture {
                                            self.sessionType = type
                                            isSessionTypeSelected = true
                                            withAnimation{
                                                self.isExpanded2.toggle()
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
                    
                    VStack{
                        Text(NSLocalizedString("Date of training", comment: "Date of training"))
                        HStack{
                            TextField(NSLocalizedString("ex. 13-04-2023", comment: "Date"), text: $date)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    VStack{
                        Text(NSLocalizedString("Starting time", comment: "Starting time"))
                        HStack{
                            TextField(NSLocalizedString("ex. 14:15", comment: "Time"), text: $time)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    VStack{
                        DisclosureGroup("\(duration)", isExpanded: $isExpanded3){
                            ScrollView {
                                VStack{
                                    ForEach(timestamps, id: \.self) { type in
                                        Text("\(type)")
                                            .frame(maxWidth: .infinity)
                                            .font(.title3)
                                            .padding(.all)
                                            .onTapGesture {
                                                self.duration = type
                                                isDurationSelected = true
                                                withAnimation{
                                                    self.isExpanded3.toggle()
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
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
                
                VStack{
                    VStack{
                        Text(NSLocalizedString("Days before or after the training", comment: "Days before or after the training"))
                        HStack{
                            TextField(NSLocalizedString("ex. -1 or 3", comment: "Days"), text: $days)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    VStack{
                        Text(NSLocalizedString("RPE score", comment: "RPE score"))
                        Text("(min: 1, max: 10, step: 1)")
                        HStack{
                            TextField(NSLocalizedString("ex. 5", comment: "RPE"), text: $rpe)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    VStack{
                        Text(NSLocalizedString("Satisfaction of the training", comment: "Satisfaction of the training"))
                        Text("(min: 1, max: 5, step: 0.5)")
                        HStack{
                            TextField(NSLocalizedString("ex. 2.5", comment: "Satisfaction"), text: $satisfaction)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    
                    VStack{
                        Text(NSLocalizedString("Comments", comment: "Comments"))
                        HStack{
                            TextField(NSLocalizedString("", comment: "Comments"), text: $comments)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                                .frame(width: 335, height: 35)
                                .overlay(Rectangle().frame(width: 330, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                }
                
                
                NavigationLink(destination: EndOfTestView().onAppear{setRPETest()}) {
                    Text(NSLocalizedString("Save the data", comment: "Save the data"))
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    //.disabled(isFormNotValid)
            }
            Spacer()
        }
        .navigationTitle(NSLocalizedString("RPE_title", comment: "RPE_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setRPEBody(){
        RPEBody.trainingstype = selectedType
        RPEBody.sessiontype = sessionType
        RPEBody.date_of_training = date
        RPEBody.starting_time = time
        RPEBody.duration = duration
        RPEBody.days_before_or_after_training = days
        RPEBody.rpe_score = Int(rpe)
        RPEBody.satisfaction = satisfaction
        RPEBody.comments = comments
    }
    
    func setRPETest(){
        setRPEBody()
        technoleonAPI.setRPETestForPlayer(id: loggedInUser.player_id!, rpeRequestBody: RPEBody) { (result) in
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


struct RPEView_Previews: PreviewProvider {
    static var previews: some View {
        RPEView()
    }
}
