//
//  VetPercentageView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct VetPercentageView: View {
    @ObservedObject var technoleonAPI = TechnoleonAPI.shared
    @ObservedObject var loggedInUser = LoggedInUser.shared
    @ObservedObject var ktk3Body = KtK3RequestBody.shared
    @State var attempt1: String = ""
    @State private var isExpanded = false
    @State private var selectedLichaamsdeel = "Lichaamsdeel"
    
    private var lichaamsdelen = ["Borst", "Bovenbeen", "Buik", "Heup"]
    
    var body: some View {
        VStack{
            Spacer()
            Text("Kies lichaamsdeel voor test")
                .font(.title2)
                
            DisclosureGroup("\(selectedLichaamsdeel)", isExpanded: $isExpanded){
                ScrollView {
                    VStack{
                        ForEach(lichaamsdelen, id: \.self) { lichaamsdeel in
                            Text("\(lichaamsdeel)")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedLichaamsdeel = lichaamsdeel
                                    withAnimation{
                                        self.isExpanded.toggle()
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
        
            Text("Dikte van de huidplooi")
                .font(.title2)
            Text("in millimeter")
                .font(.custom("", size: 16))
            
                HStack{
                    TextField("Dikte (mm)", text: $attempt1)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .frame(width: 300, height: 40)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).padding(EdgeInsets(top: 10, leading: 0, bottom: -5, trailing: 0)).foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11)), alignment: .bottom)
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                                
                NavigationLink(destination: EndOfTestView().onAppear{ }) {
                    Text("Sla gegevens op")
                        .font(.custom("", size: 22))
                        .foregroundColor(Color.white)
                        .frame(width: 250, height: 20)
                        .padding()
                        .background(Color(red: 0.90, green: 0.31, blue: 0.11))
                }.cornerRadius(10)
                    .padding(EdgeInsets(top: 70, leading: 0, bottom: 0, trailing: 0))
            Spacer()
            }
            .navigationTitle("Vetpercentage")
            .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
        }
    
    func setSitAndReachTest(){
        /*technoleonAPI.setKTK3TestForPlayer(id: loggedInUser.playerId!, KTK3RequestBody: ktk3Body) { (result) in
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
        }*/
    }
}
struct VetPercentageView_Previews: PreviewProvider {
    static var previews: some View {
        VetPercentageView()
    }
}
