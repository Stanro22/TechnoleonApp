//
//  CNAAQView.swift
//  TechnoleonApp
//
//  Created by user220873 on 12/13/22.
//

import SwiftUI

struct CNAAQView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    @ObservedObject var CNAAQBody = CNAAQRequestBody()
    
    private var questions = [
        Question(id: 1, question: NSLocalizedString("CNAAQ_q1", comment: "Q1")),
        Question(id: 2, question: NSLocalizedString("CNAAQ_q2", comment: "Q2")),
        Question(id: 3, question: NSLocalizedString("CNAAQ_q3", comment: "Q3")),
        Question(id: 4, question: NSLocalizedString("CNAAQ_q4", comment: "Q4")),
        Question(id: 5, question: NSLocalizedString("CNAAQ_q5", comment: "Q5")),
        Question(id: 6, question: NSLocalizedString("CNAAQ_q6", comment: "Q6")),
        Question(id: 7, question: NSLocalizedString("CNAAQ_q7", comment: "Q7")),
        Question(id: 8, question: NSLocalizedString("CNAAQ_q8", comment: "Q8")),
        Question(id: 9, question: NSLocalizedString("CNAAQ_q9", comment: "Q9")),
        Question(id: 10, question: NSLocalizedString("CNAAQ_q10", comment: "Q10")),
        Question(id: 11, question: NSLocalizedString("CNAAQ_q11", comment: "Q11")),
        Question(id: 12, question: NSLocalizedString("CNAAQ_q12", comment: "Q12")),
        Question(id: 13, question: NSLocalizedString("CNAAQ_q13", comment: "Q13")),
        Question(id: 14, question: NSLocalizedString("CNAAQ_q14", comment: "Q14")),
        Question(id: 15, question: NSLocalizedString("CNAAQ_q15", comment: "Q15")),
        Question(id: 16, question: NSLocalizedString("CNAAQ_q16", comment: "Q16")),
        Question(id: 17, question: NSLocalizedString("CNAAQ_q17", comment: "Q17")),
        Question(id: 18, question: NSLocalizedString("CNAAQ_q18", comment: "Q18")),
        Question(id: 19, question: NSLocalizedString("CNAAQ_q19", comment: "Q19")),
        Question(id: 20, question: NSLocalizedString("CNAAQ_q20", comment: "Q20")),
        Question(id: 21, question: NSLocalizedString("CNAAQ_q21", comment: "Q21"))
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
                
                NavigationLink(destination: EndOfTestView().onAppear{setCNAAQTest()}) {
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
        .navigationTitle(NSLocalizedString("CNAAQ_title", comment: "CNAAQ_title"))
        .navigationBarItems(trailing: Image(systemName: "info.circle.fill").foregroundColor(Color.white))
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setCNAAQBody(){
        
    }
    
    func setCNAAQTest(){

    }
}

struct CNAAQView_Previews: PreviewProvider {
    static var previews: some View {
        CNAAQView()
    }
}
