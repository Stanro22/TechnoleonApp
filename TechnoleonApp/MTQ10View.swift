//
//  MTQ10View.swift
//  TechnoleonApp
//
//  Created by user220873 on 12/13/22.
//

import SwiftUI

struct MTQ10View: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var MTQ10Body = MTQ10RequestBody()
    
    private var questions = [
        Question(id: 1, question: NSLocalizedString("MTQ10_q1", comment: "Q1")),
        Question(id: 2, question: NSLocalizedString("MTQ10_q2", comment: "Q2")),
        Question(id: 3, question: NSLocalizedString("MTQ10_q3", comment: "Q3")),
        Question(id: 4, question: NSLocalizedString("MTQ10_q4", comment: "Q4")),
        Question(id: 5, question: NSLocalizedString("MTQ10_q5", comment: "Q5")),
        Question(id: 6, question: NSLocalizedString("MTQ10_q6", comment: "Q6")),
        Question(id: 7, question: NSLocalizedString("MTQ10_q7", comment: "Q7")),
        Question(id: 8, question: NSLocalizedString("MTQ10_q8", comment: "Q8")),
        Question(id: 9, question: NSLocalizedString("MTQ10_q9", comment: "Q9")),
        Question(id: 10, question: NSLocalizedString("MTQ10_q10", comment: "Q10"))
    ]
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView{
                VStack{
                    ForEach(questions, id: \.self) { question in
                        VStack(alignment: .leading){
                            Text("\(question.id). \(question.question)")
                                .font(.custom("", size: 16))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                            
                            HorizontalRadioButtonLayout()
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 0))
                            
                            HStack{
                                Text("< \(NSLocalizedString("Totally disagree", comment: "Disagree"))")
                                    .font(.custom("", size: 12))
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
                                Spacer()
                                Text("\(NSLocalizedString("Totally agree", comment: "Agree")) >")
                                    .font(.custom("", size: 12))
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
                            }
                        }
                        .background(Color(red: 0.62, green: 0.65, blue: 0.87))
                        .cornerRadius(10)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                NavigationLink(destination: EndOfTestView().onAppear{setMTQ10Test()}) {
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
        .navigationTitle(NSLocalizedString("MTQ10_title", comment: "MTQ10_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setMTQ10Body(){
        
    }
    
    func setMTQ10Test(){

    }
}

struct MTQ10View_Previews: PreviewProvider {
    static var previews: some View {
        MTQ10View()
    }
}
