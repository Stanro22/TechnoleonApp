//
//  TestInfoView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct TestInfoView: View {
    let testInfo: TestInfo
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Text(testInfo.name!)
                .font(.largeTitle)
            Text(testInfo.skills!)
                .font(.custom("", size: 14))
                .foregroundColor(Color.gray)
            Spacer()
            Text("Inleiding")
                .font(.title)
            Text(testInfo.description!)
                .font(.custom("", size: 16))
            Spacer()
            Text("Benodigdheden")
                .font(.title)
            Text(testInfo.itemsNeeded!)
                .font(.custom("", size: 16))
            Spacer()
        }
        .navigationTitle("Informatie")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

//struct TestInfoView_Previews: PreviewProvider {
    //static var previews: some View {
        //TestInfoView()
    //}
//}
