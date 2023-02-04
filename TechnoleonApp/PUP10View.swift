//
//  PUP10View.swift
//  TechnoleonApp
//
//  Created by user220873 on 11/29/22.
//

import SwiftUI

struct PUP10View: View {
    @ObservedObject var stopwatchManager = StopwatchManager()
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var PUP10Body = PUP10RequestBody()
    @State var wrong_target: Int = 0
    @State var taken_away: Int = 0
    @State var outside_cones: Int = 0
    @State var to_high_outside_cones: Int = 0
    @State var over_the_line_outside_cones: Int = 0
    @State var wrong_area_outside_cones: Int = 0
    @State var to_high_inside_cones: Int = 0
    @State var over_the_line_inside_cones: Int = 0
    @State var wrong_area_inside_cones: Int = 0
    var isFormNotValid: Bool {
        if stopwatchManager.timeToSave.isEmpty {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            PUP10StopwatchView(stopwatchManager: stopwatchManager)
            Spacer()
            
            HStack{
                VStack{
                    Text(NSLocalizedString("Wrong target", comment: "Wrong target"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 2, leading: 7, bottom: 0, trailing: 0))
                        .foregroundColor(Color.white)
                    Button(action: {wrong_target += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                    
                    Button(action: {if wrong_target >= 1 {wrong_target -= 1}}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 7, bottom: 0, trailing: 0))
                    Text("\(wrong_target)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 7, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text(NSLocalizedString("Taken away", comment: "Taken away"))
                        .font(.custom("", size: 11))
                        .foregroundColor(Color.white)
                    Button(action: {taken_away += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {if taken_away >= 1 {taken_away -= 1}}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                    Text("\(taken_away)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text(NSLocalizedString("Outside cones", comment: "Outside cones"))
                        .font(.custom("", size: 11))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                        .foregroundColor(Color.white)
                    Button(action: {outside_cones += 1}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 60)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                    Button(action: {if outside_cones >= 1 {outside_cones -= 1}}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 7))
                    Text("\(outside_cones)")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(90)
                        .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 7))
                }
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
            .cornerRadius(10)
            
            VStack{
                Text(NSLocalizedString("Pass through outside cones", comment: "Pass through outside cones"))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                    .foregroundColor(Color.white)
                HStack{
                    VStack{
                        Text(NSLocalizedString("To high", comment: "To high"))
                            .font(.custom("", size: 11))
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                            .foregroundColor(Color.white)
                        Button(action: {to_high_outside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        
                        Button(action: {if to_high_outside_cones >= 1 {to_high_outside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 7, bottom: 0, trailing: 0))
                        Text("\(to_high_outside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 7, bottom: 0, trailing: 0))
                    }
                    
                    VStack{
                        Text(NSLocalizedString("Over the line", comment: "Over the line"))
                            .font(.custom("", size: 11))
                            .foregroundColor(Color.white)
                        Button(action: {over_the_line_outside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        Button(action: {if over_the_line_outside_cones >= 1 {over_the_line_outside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                        Text("\(over_the_line_outside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                    }
                    
                    VStack{
                        Text(NSLocalizedString("Wrong area", comment: "Wrong area"))
                            .font(.custom("", size: 11))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                            .foregroundColor(Color.white)
                        Button(action: {wrong_area_outside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                        Button(action: {if wrong_area_outside_cones >= 1 {wrong_area_outside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 7))
                        Text("\(wrong_area_outside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 7))
                    }
                }
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
            .cornerRadius(10)
            
            VStack{
                Text(NSLocalizedString("Pass through inside cones", comment: "Pass through inside cones"))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                    .foregroundColor(Color.white)
                HStack{
                    VStack{
                        Text(NSLocalizedString("To high", comment: "To high"))
                            .font(.custom("", size: 11))
                            .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                            .foregroundColor(Color.white)
                        Button(action: {to_high_inside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        .padding(EdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 0))
                        
                        Button(action: {if to_high_inside_cones >= 1 {to_high_inside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 7, bottom: 0, trailing: 0))
                        Text("\(to_high_inside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 7, bottom: 0, trailing: 0))
                    }
                    
                    VStack{
                        Text(NSLocalizedString("Over the line", comment: "Over the line"))
                            .font(.custom("", size: 11))
                            .foregroundColor(Color.white)
                        Button(action: {over_the_line_inside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        Button(action: {if over_the_line_inside_cones >= 1 {over_the_line_inside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                        Text("\(over_the_line_inside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 0))
                    }
                    
                    VStack{
                        Text(NSLocalizedString("Wrong area", comment: "Wrong area"))
                            .font(.custom("", size: 11))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                            .foregroundColor(Color.white)
                        Button(action: {wrong_area_inside_cones += 1}){
                            Spacer()
                            VStack{
                                Text("+1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                                Spacer()
                            }
                        }
                        .frame(width: 100, height: 60)
                        .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7))
                        Button(action: {if wrong_area_inside_cones >= 1 {wrong_area_inside_cones -= 1}}){
                            Spacer()
                            VStack{
                                Spacer()
                                Text("-1")
                                    .bold()
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            }
                        }
                        .frame(width: 100, height: 50)
                        .background(Color(red: 0.73, green: 0.05, blue: 0.05))
                        .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 7))
                        Text("\(wrong_area_inside_cones)")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                            .cornerRadius(90)
                            .padding(EdgeInsets(top: -75, leading: 0, bottom: 0, trailing: 7))
                    }
                }
            }
            .background(Color(red: 0.62, green: 0.65, blue: 0.87))
            .cornerRadius(10)
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{setPUP10Test()}) {
                Text(NSLocalizedString("Save the data", comment: "Save the data"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle(NSLocalizedString("PUP10_title", comment: "PUP10_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setPUP10Body(){
        PUP10Body.final_time = stopwatchManager.timeToSave
        PUP10Body.wrong_target = wrong_target
        PUP10Body.taken_away = taken_away
        PUP10Body.outside_cones = outside_cones
        PUP10Body.to_high_outside_cones = to_high_outside_cones
        PUP10Body.over_the_line_outside_cones = over_the_line_outside_cones
        PUP10Body.wrong_area_outside_cones = wrong_area_outside_cones
        PUP10Body.to_high_inside_cones = to_high_inside_cones
        PUP10Body.over_the_line_inside_cones = over_the_line_inside_cones
        PUP10Body.wrong_area_inside_cones = wrong_area_inside_cones
    }
    
    func setPUP10Test(){
        setPUP10Body()
        technoleonAPI.setPUP10TestForPlayer(id: loggedInUser.player_id!, pup10RequestBody: PUP10Body) { (result) in
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


struct PUP10View_Previews: PreviewProvider {
    static var previews: some View {
        PUP10View()
    }
}
