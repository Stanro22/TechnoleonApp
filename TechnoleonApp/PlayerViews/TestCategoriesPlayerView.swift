//
//  TestCategoriesPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/17/22.
//

import SwiftUI

struct TestCategoriesPlayerView: View {
    var body: some View {
            VStack{
                Spacer()
                Text(NSLocalizedString("Choose the testcategory", comment: "Choose the testcategory"))
                    .font(.custom("", size: 24))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                
                VStack{
                    Text(NSLocalizedString("Physical", comment: "Physical"))
                        .foregroundColor(Color.black)
                    NavigationLink(destination: TestListView(chosenCategorie: NSLocalizedString("Physical", comment: "Physical"))){
                        Image("heart")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                    .cornerRadius(90)
                    .disabled(true)
                }
                .frame(width: 130, height: 130)
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text(NSLocalizedString("Cognitive", comment: "Cognitive"))
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: NSLocalizedString("Cognitive", comment: "Cognitive"))){
                            Image("eye")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 30)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    Spacer()
                    VStack{
                        Text(NSLocalizedString("Mental", comment: "Mental"))
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: NSLocalizedString("Mental", comment: "Mental"))){
                            Image("mental")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    Spacer()
                }
                Spacer()
                
                HStack{
                    Spacer()
                    VStack{
                        Text(NSLocalizedString("Technical", comment: "Technical"))
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: NSLocalizedString("Technical", comment: "Technical"))){
                            Image("ball")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                    Spacer()
                    VStack{
                        Text(NSLocalizedString("Match", comment: "Match"))
                            .foregroundColor(Color.black)
                        NavigationLink(destination: TestListView(chosenCategorie: NSLocalizedString("Match", comment: "Match"))){
                            Image("match")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color.white)
                        }
                        .frame(width: 70, height: 70)
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                        .cornerRadius(90)
                        .disabled(true)
                    }
                    .frame(width: 130, height: 130)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 50))
                    Spacer()
                }
                Spacer()
                                
                PlayerTabBar(isOverViewActive: false, isTestsActive: true, isProfileActive: false)
            }
            .navigationTitle(NSLocalizedString("Categories", comment: "Categories"))
            .navigationBarBackButtonHidden(true)
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    }


struct TestCategoriesPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TestCategoriesPlayerView()
    }
}
