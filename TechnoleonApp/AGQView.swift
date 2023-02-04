//
//  AGQView.swift
//  TechnoleonApp
//
//  Created by user220873 on 12/6/22.
//

import SwiftUI

struct AGQView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var AGQBody = AGQRequestBody()
    
    private var questions = [
        Question(id: 1, question: NSLocalizedString("AGQ_q1", comment: "Q1")),
        Question(id: 2, question: NSLocalizedString("AGQ_q2", comment: "Q2")),
        Question(id: 3, question: NSLocalizedString("AGQ_q3", comment: "Q3")),
        Question(id: 4, question: NSLocalizedString("AGQ_q4", comment: "Q4")),
        Question(id: 5, question: NSLocalizedString("AGQ_q5", comment: "Q5")),
        Question(id: 6, question: NSLocalizedString("AGQ_q6", comment: "Q6")),
        Question(id: 7, question: NSLocalizedString("AGQ_q7", comment: "Q7")),
        Question(id: 8, question: NSLocalizedString("AGQ_q8", comment: "Q8")),
        Question(id: 9, question: NSLocalizedString("AGQ_q9", comment: "Q9")),
        Question(id: 10, question: NSLocalizedString("AGQ_q10", comment: "Q10")),
        Question(id: 11, question: NSLocalizedString("AGQ_q11", comment: "Q11")),
        Question(id: 12, question: NSLocalizedString("AGQ_q12", comment: "Q12"))
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
                                Text("< \(NSLocalizedString("Totally disagree", comment: "disagree"))")
                                    .font(.custom("", size: 12))
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5))
                                Spacer()
                                Text("\(NSLocalizedString("Totally agree", comment: "agree")) >")
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
                
                NavigationLink(destination: EndOfTestView().onAppear{setAGQTest()}) {
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
        .navigationTitle(NSLocalizedString("AGQ_title", comment: "AGQ_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setAGQBody(){
        
    }
    
    func setAGQTest(){

    }
}

struct AGQView_Previews: PreviewProvider {
    static var previews: some View {
        AGQView()
    }
}
