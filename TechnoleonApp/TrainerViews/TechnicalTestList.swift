//
//  TechnicalTestList.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/20/21.
//

import SwiftUI

struct TechnicalTestList: View {
    @ObservedObject var testManager = TestManager.shared
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: {PlayerSelectionView().onAppear(){
                    resetTests()
                    testManager.isFSTset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("FST_title", comment: "FST_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("FST_skills", comment: "FST_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: FSTInfo())){
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                                .frame(width: 25, height: 25)
                        }

                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                
                NavigationLink(destination: {PlayerSelectionView().onAppear(){
                    resetTests()
                    testManager.isLSPTset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("LSPT_title", comment: "LSPT_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("LSPT_skills", comment: "LSPT_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: LSPTInfo())){
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                                .frame(width: 25, height: 25)
                        }

                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                
                NavigationLink(destination: {PlayerSelectionView().onAppear(){
                    resetTests()
                    testManager.isInsaitJoyset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("IJBT_title", comment: "IJBT_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("IJBT_skills", comment: "IJBT_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: InsaitJoyInfo())){
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                                .frame(width: 25, height: 25)
                        }

                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.black)
                            .frame(width: 10, height: 20)
                    }
                    .frame(width: 350, height: 50, alignment: .leading)
                }
                .overlay(Divider().background(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
        }
    }
    
    func resetTests(){
        testManager.isKTK3set = false
        testManager.isPHVset = false
        testManager.isSitAndReachset = false
        testManager.isFatPercentageset = false
        testManager.isTTestset = false
        testManager.isOneLegStanceset = false
        testManager.isTenTwentyThirtyFiveset = false
        testManager.isTenxFiveset = false
        testManager.isShuttleRunset = false
        testManager.isYoYoset = false
        testManager.isFSTset = false
        testManager.isLSPTset = false
        testManager.isInsaitJoyset = false
        testManager.isGiTset = false
    }
}

struct TechnicalTestList_Previews: PreviewProvider {
    static var previews: some View {
        TechnicalTestList()
    }
}
