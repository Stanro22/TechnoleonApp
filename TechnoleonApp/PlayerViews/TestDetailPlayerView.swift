//
//  TestDetailPlayerView.swift
//  TechnoleonApp
//
//  Created by user206503 on 1/11/22.
//

import SwiftUI

struct TestDetailPlayerView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = User.shared
    var test: Test
    @State var testForData: Test?
    @State var specificTest: SpecificTest?
    @State var dateSet: Bool = false
    @State var date: Date?
    @State var loadingTest: Bool = false
    @State var loadingData: Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                HStack{
                    Text(NSLocalizedString("Name", comment: "Name") + ":")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 20))
                    Spacer()
                    Text("\(loggedInUser.name!)")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 20))
                }
                .frame(width: 300, height: 40)
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                .cornerRadius(20)
                
                HStack{
                    Text(NSLocalizedString("Test date", comment: "Test date") + ":")
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 0))
                        .font(.custom("", size: 20))
                    Spacer()
                        if dateSet == false{
                            ProgressView(NSLocalizedString("Loading date", comment: "Loading date"))
                                .onAppear(){
                                    setDate()
                                }
                        }
                        else{
                            Text(date!, style: .date)
                                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 5))
                                .font(.custom("", size: 20))
                        }
                }
                .frame(width: 300, height: 40)
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0.62, green: 0.65, blue: 0.90))
                .cornerRadius(20)
            }
            
            VStack{
                HStack{
                    if loadingTest == false{
                        ProgressView(NSLocalizedString("Loading tests", comment: "Loading tests"))
                            .onAppear(){
                                getTestById(id: test.id!)
                            }
                    }
                    else{
                        if loadingData == false {
                            ProgressView(NSLocalizedString("Loading data", comment: "Loading data"))
                                .onAppear(){
                                    if testForData != nil {
                                        setSpecificTest(test: testForData!)
                                    }
                                }
                        }
                        else{
                            Text("\(specificTest!.scoreFields!)")
                                .padding()
                                .foregroundColor(Color.white)
                            Spacer()
                            Text("\(specificTest!.values!)")
                                .padding()
                                .foregroundColor(Color.white)
                        }
                    }
                }
                .frame(width: 330)
                Spacer()
            }
            .frame(width: 330, height: 200)
            .background(Color(red: 0.62, green: 0.65, blue: 0.90))
            .cornerRadius(20)
            Spacer()
            
            PlayerTabBar(isOverViewActive: false, isTestsActive: false, isProfileActive: false)
        }
        .navigationTitle("\(test.getTestName(test: test))")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
    
    func setDate(){
        if test.created != nil{
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateFormat = dateFormatter.date(from: test.created!)!
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateFormat)
            let finalDate = calendar.date(from: components)
            self.date = finalDate
            dateSet = true
        }
    }
    
    func setSpecificTest(test: Test){
        let testDetailsFactory = TestDetailsFactory()
        self.specificTest = testDetailsFactory.getSpecificTest(test: test)
        loadingData = true
    }
    
    func getTestById(id: String){
        technoleonAPI.getTestById(id: id) { (result) in
            switch result {
            case .success(let response):
                setTestData(response: response)
                loadingTest = true
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
    
    func setTestData(response: TestResponse){
        self.testForData = Test()
        self.testForData?.playerId = response.playerId
        self.testForData?.category = response.category
        self.testForData?.lsptTestId = response.lsptTestId
        self.testForData?.lsptTest = response.lsptTest
        self.testForData?.ktK3plusTestId = response.ktK3plusTestId
        self.testForData?.ktK3plusTest = response.ktK3plusTest
        self.testForData?.giTTestId = response.giTTestId
        self.testForData?.giTTest = response.giTTest
        self.testForData?.phvTestId = response.phvTestId
        self.testForData?.phvTest = response.phvTest
        self.testForData?.sitAndReachTestId = response.sitAndReachTestId
        self.testForData?.sitAndReachTest = response.sitAndReachTest
        self.testForData?.fatPercentageTestId = response.fatPercentageTestId
        self.testForData?.fatPercentageTest = response.fatPercentageTest
        self.testForData?.fstTestId = response.fstTestId
        self.testForData?.fstTest = response.fstTest
        self.testForData?.insaitJoyTestId = response.insaitJoyTestId
        self.testForData?.insaitJoyTest = response.insaitJoyTest
        self.testForData?.intervalShuttleRunTestId = response.intervalShuttleRunTestId
        self.testForData?.intervalShuttleRunTest = response.intervalShuttleRunTest
        self.testForData?.tvpS3TestId = response.tvpS3TestId
        self.testForData?.tTestId = response.tTestId
        self.testForData?.tTest = response.tTest
        self.testForData?.vfmtTestId = response.vfmtTestId
        self.testForData?.tenx5MSprintTestId = response.tenx5MSprintTestId
        self.testForData?.tenx5MSprintTest = response.tenx5MSprintTest
        self.testForData?.yoYoStaminaTestId = response.yoYoStaminaTestId
        self.testForData?.yoYoStaminaTest = response.yoYoStaminaTest
        self.testForData?.tenTwentyThirtyFiveSprintId = response.tenTwentyThirtyFiveSprintId
        self.testForData?.tenTwentyThirtyFiveSprint = response.tenTwentyThirtyFiveSprint
        self.testForData?.id = response.id
        self.testForData?.created = response.created
        self.testForData?.modified = response.modified
    }
}

//struct TestDetailPlayerView_Previews: PreviewProvider {
  //  static var previews: some View {
  //      TestDetailPlayerView()
  //  }
//}
