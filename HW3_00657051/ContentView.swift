//
//  ContentView.swift
//  HW3_00657051
//
//  Created by SW on 2020/5/4.
//  Copyright © 2020 SW. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var setPicture: Double = 0
    @State private var name = ""
    @State private var showAlert = false
    @State private var secondPage = false
    @State private var chooseAction = 0
    var action = ["可愛", "美麗", "帥氣", "勇猛"]
    
    @State private var chooseGender = 0
    var gender = ["男","女"]
    
    @State private var selectDate = Date()
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    var year: Int{
        Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        NavigationView{
            VStack(spacing:30){
                
                Image("LOL")
                    .resizable()
                    .scaledToFit()
                    //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 4 * 3)
                    .clipped()
                    .brightness(self.setPicture)
                PictureSlider(setPicture: self.$setPicture)
                
                
                Form{
                    
                    VStack{
                        Text("你的名字是?")
                            .offset(x:-140)
                        TextField("請輸入名字",text:self.$name)
                    }
                    DatePicker("出生日期", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents: .date)
                    
                    
                    VStack{
                        Text("性別")
                            .offset(x:-173)
                        Picker(selection: self.$chooseGender,label: Text("性別")){
                           ForEach(0..<self.gender.count){(index) in
                               Text(self.gender[index])
                           }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 380)
                        .clipped()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                    }
 
                    VStack{
                        Text("你喜歡怎樣的角色?")
                            .offset(x:-115)
                        Picker(selection: self.$chooseAction,label: Text("你喜歡怎樣的角色?")){
                           ForEach(0..<self.action.count){(index) in
                               Text(self.action[index])
                           }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: 380)
                        .clipped()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                    }
                    Button(action:{
                        if(self.name == ""){
                            self.showAlert = true
                        }
                        else{
                            self.secondPage = true
                        }
                    }){
                        Text("抽選英雄>>")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .foregroundColor(.black)
                        .padding(5)
                        .offset(x:250)
                    }.alert(isPresented: $showAlert){ () -> Alert in
                        return Alert(title: Text("等一下！"), message: Text("你還沒寫名字！"))
                    }
                    .sheet(isPresented: self.$secondPage){
                        ViewCharacter(name: self.$name, action: self.$chooseAction)
                    }
                    
                    
                }
                //.frame(width: UIScreen.main.bounds.width, height: 60)
                Spacer()
               
               
                
                
                
            }
            
            .offset(y:100)
            .edgesIgnoringSafeArea(.all)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PictureSlider: View {
    @Binding var setPicture: Double
    
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: self.$setPicture,in:0...1,minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)){
                Text("")
            }
            
        }
        
    }
}
