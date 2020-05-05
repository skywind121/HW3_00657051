//
//  ViewCharacter.swift
//  HW3_00657051
//
//  Created by SW on 2020/5/4.
//  Copyright © 2020 SW. All rights reserved.
//

import SwiftUI

struct ViewCharacter: View {
    @Binding var name: String
    @Binding var action:Int
    var type = ["可愛", "美麗", "帥氣", "勇猛"]
    var chamName = ["提摩", "阿璃", "伊澤瑞爾", "蓋倫"]
    
    var body: some View {
        VStack{
            Text("\(name),你抽中的英雄是")
            
            Image(type[action])
                .resizable()
                .scaledToFill()
                .frame(width:220, height:220)
            
            Text("\(chamName[action])")
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(10)

        }
    }
}

struct ViewCharacter_Previews: PreviewProvider {
    static var previews: some View {
        ViewCharacter(name: .constant("Name"), action: .constant(0))
    }
}
