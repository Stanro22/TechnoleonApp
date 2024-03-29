//
//  InsaitJoyView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct InsaitJoyView: View {
    @ObservedObject var insaitJoyBody = InsaitJoyRequestBody.shared
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    @State private var selectedNiveau = NSLocalizedString("LevelISRT", comment: "LevelISRT")
    private var niveaus = [NSLocalizedString("Rookie", comment: "Rookie"), NSLocalizedString("Advanced", comment: "Advanced"), NSLocalizedString("Expert", comment: "Expert")]
    @State private var selectedPractice = NSLocalizedString("Drill", comment: "Drill")
    private var practices = ["Juggle", "Pull a vee", "Back side chop"]
    @State private var selectedTime = NSLocalizedString("Time", comment: "Time")
    private var times = ["30 " + NSLocalizedString("seconds", comment: "seconds"), "60 " + NSLocalizedString("seconds", comment: "seconds")]
    @State var isNiveauSelected: Bool = false
    @State var isPracticeSelected: Bool = false
    @State var isTimeSelected: Bool = false
    var isFormNotValid: Bool {
        if isNiveauSelected == false && isPracticeSelected == false && isTimeSelected == false {
            return true
        }
        return false
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text(NSLocalizedString("Settings", comment: "Settings"))
                .font(.title2)
                
            DisclosureGroup("\(selectedNiveau)", isExpanded: $isExpanded1){
                ScrollView {
                    VStack{
                        ForEach(niveaus, id: \.self) { niveau in
                            Text("\(niveau)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedNiveau = niveau
                                    isNiveauSelected = true
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
            
            DisclosureGroup("\(selectedPractice)", isExpanded: $isExpanded2){
                ScrollView {
                    VStack{
                        ForEach(practices, id: \.self) { practice in
                            Text("\(practice)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedPractice = practice
                                    isPracticeSelected = true
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
            DisclosureGroup("\(selectedTime)", isExpanded: $isExpanded3){
                ScrollView {
                    VStack{
                        ForEach(times, id: \.self) { time in
                            Text("\(time)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedTime = time
                                    isTimeSelected = true
                                    withAnimation{
                                        self.isExpanded3.toggle()
                                    }
                                }
                        }
                    }
                }.frame(width: 300, height: 100)
            }
            .accentColor(Color(red: 0.90, green: 0.31, blue: 0.11))
            .foregroundColor(Color.black)
            .frame(width: 300)
            .padding(.all)
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            Spacer()
            
            NavigationLink(destination: InsaitJoyPractice().onAppear{setInsaitJoyBody()}) {
                Text(NSLocalizedString("To the drill", comment: "To the drill"))
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.38, green: 0.44, blue: 0.64))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 180, leading: 0, bottom: 5, trailing: 0))
                .disabled(isFormNotValid)
        }
        .navigationTitle(NSLocalizedString("Insait Joy settings", comment: "Insait Joy settings"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setInsaitJoyBody(){
        setNiveau()
        setDrill()
        setTime()
    }
    
    func setNiveau(){
        if selectedNiveau == "Beginner" {
            insaitJoyBody.level = "BEGINNER"
        }
        if selectedNiveau == "Geavanceerd" {
            insaitJoyBody.level = "ADVANCED"
        }
        if selectedNiveau == "Expert" {
            insaitJoyBody.level = "EXPERT"
        }
    }
    
    func setDrill(){
        if selectedPractice == "Juggle" {
            insaitJoyBody.drill = "JUGGLE"
        }
        if selectedPractice == "Pull a vee" {
            insaitJoyBody.drill = "PULL_A_VEE"
        }
        if selectedPractice == "Back side chop" {
            insaitJoyBody.drill = "BACK_SIDE_CHOP"
        }
    }
    
    func setTime(){
        if selectedTime == "30 seconden" {
            insaitJoyBody.trainingTime = "THIRTY_SECONDS"
        }
        if selectedTime == "60 seconden" {
            insaitJoyBody.trainingTime = "SIXTY_SECONDS"
        }
    }
}

struct InsaitJoyView_Previews: PreviewProvider {
    static var previews: some View {
        InsaitJoyView()
    }
}
