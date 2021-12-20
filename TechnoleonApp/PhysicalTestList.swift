//
//  TestListCell.swift
//  TechnoleonApp
//
//  Created by user206981 on 11/24/21.
//

import SwiftUI

struct PhysicalTestList: View {
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("KTK3+")
                                .foregroundColor(Color.black)
                            Text("Coördinatie, balans")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("PHV")
                                .foregroundColor(Color.black)
                            Text("Biologische leeftijd")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Sit and reach")
                                .foregroundColor(Color.black)
                            Text("Mobiliteit")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Vetpercentage")
                                .foregroundColor(Color.black)
                            Text("Biometrie")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
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
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
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
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("10, 20 en 35 meter sprint")
                                .foregroundColor(Color.black)
                            Text("Snelheid")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("10x5 meter sprint")
                                .foregroundColor(Color.black)
                            Text("Explosiviteit")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Interval shuttle run")
                                .foregroundColor(Color.black)
                            Text("Uithoudingsvermogen")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
                
                NavigationLink(destination: KTK3View()){
                    HStack{
                        VStack(alignment: .leading){
                            Text("Yo-Yo uithoudingsvermogen test")
                                .foregroundColor(Color.black)
                            Text("Uithoudingsvermogen")
                                .font(.custom("", size: 14))
                                .foregroundColor(Color.gray)
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .foregroundColor(Color(red: 0.90, green: 0.31, blue: 0.11))
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
            }
        }
    }
}

struct PhysicalTestList_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalTestList()
    }
}
