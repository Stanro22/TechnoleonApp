//
//  TestListCell.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/24/21.
//

import SwiftUI

struct PhysicalTestList: View {
    @ObservedObject var testManager = TestManager.shared
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: {PlayerSelectionView().onAppear(){
                    resetTests()
                    testManager.isKTK3set = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("KTK3_title", comment: "KTK3_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("KTK3_skills", comment: "KTK3_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: KTK3Info())){
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
                    testManager.isPHVset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("APHV_title", comment: "APHV_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("APHV_skills", comment: "APHV_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: PHVInfo())){
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
                    testManager.isSitAndReachset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("Sit_and_reach_title", comment: "Sit_and_reach_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("Sit_and_reach_skills", comment: "Sit_and_reach_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: SitAndReachInfo())){
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
                    testManager.isFatPercentageset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("Fatpercentage_title", comment: "Fatpercentage_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("Fatpercentage_skills", comment: "Fatpercentage_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: VetPercentageInfo())){
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                                .frame(width: 25, height: 25)
                        }
                            .frame(width: 25, height: 25)
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
                    testManager.isTTestset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text("T-Test")
                                .foregroundColor(Color.black)
                            Text("Wendbaarheid")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: T_TestInfo())){
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
                    testManager.isOneLegStanceset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text("One leg stance")
                                .foregroundColor(Color.black)
                            Text("Coördinatie, balans")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: OneLegStanceInfo())){
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
                    testManager.isTenTwentyThirtyFiveset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("Sprint3_title", comment: "Sprint3_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("Sprint3_skills", comment: "Sprint3_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: Sprint10m20m35mInfo())){
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
                    testManager.isTenxFiveset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("Sprint10x5_title", comment: "Sprint10x5_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("Sprint10x5_skills", comment: "Sprint10x5_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: Sprint10x5Info())){
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
                
                NavigationLink(destination: {ShuttleRunView().onAppear(){
                    resetTests()
                    testManager.isShuttleRunset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("ISRT_title", comment: "ISRT_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("ISRT_skills", comment: "ISRT_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: ShuttleRunInfo())){
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
                
                NavigationLink(destination: {YoYoView().onAppear(){
                    resetTests()
                    testManager.isYoYoset = true
                }}){
                    HStack{
                        VStack(alignment: .leading){
                            Text(NSLocalizedString("YYIRT_title", comment: "YYIRT_title"))
                                .foregroundColor(Color.black)
                            Text(NSLocalizedString("YYIRT_skills", comment: "YYIRT_skills"))
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        NavigationLink(destination: TestInfoView(testInfo: YoYoInfo())){
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

struct PhysicalTestList_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalTestList()
    }
}
