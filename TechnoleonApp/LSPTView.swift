//
//  LSPTView.swift
//  TechnoleonApp
//
//  Created by user206503 on 12/22/21.
//

import SwiftUI

struct LSPTView: View {
    @ObservedObject var timerManager = StopwatchManager()
    
    var body: some View {
        VStack{
            Spacer()
            Button(action: timerManager.reset){
                Text("Reset")
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.red)
            }
            .cornerRadius(15)
            
            Text(secondsToMinutesAndSeconds(seconds: timerManager.seconds))
                .font(.custom("", size: 40))
                .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
                .frame(width: 180, height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 90)
                        .stroke(lineWidth: 3)
                        .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                )
                .onAppear(){
                    self.timerManager.seconds = 0
                }
                
            Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(Color(red: 0.15, green: 0.21, blue: 0.40))
                .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.seconds = 0
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                })
            Spacer()
            
            HStack{
                VStack{
                    Text("Bank gemist")
                        .font(.custom("", size: 11))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Verkeerde bank")
                        .font(.custom("", size: 11))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Doelgebied gemist")
                        .font(.custom("", size: 11))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Spacer()
            
            HStack{
                VStack{
                    Text("Pylon geraakt")
                        .font(.custom("", size: 11))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Pass buiten doelgebied")
                        .font(.custom("", size: 10))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
                
                VStack{
                    Text("Tien cm strip geraakt")
                        .font(.custom("", size: 10))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Text("+1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                            Spacer()
                        }
                    }
                    .frame(width: 100, height: 70)
                    .background(Color(red: 0.15, green: 0.21, blue: 0.40))
                    Button(action: {}){
                        Spacer()
                        VStack{
                            Spacer()
                            Text("-1")
                                .bold()
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5))
                        }
                    }
                    .frame(width: 100, height: 50)
                    .background(Color.red)
                    .padding(EdgeInsets(top: -8, leading: 0, bottom: 0, trailing: 0))
                }
            }
            Spacer()
            
            NavigationLink(destination: EndOfTestView().onAppear{ }) {
                Text("Sla gegevens op")
                    .font(.custom("", size: 22))
                    .foregroundColor(Color.white)
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color(red: 0.90, green: 0.31, blue: 0.11))
            }.cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        }
        .navigationTitle("Insait Joy instellingen")
        .navigationBarColor(UIColor(red: 0.15, green: 0.21, blue: 0.40, alpha: 1.00))
    }
}

struct LSPTView_Previews: PreviewProvider {
    static var previews: some View {
        LSPTView()
    }
}
