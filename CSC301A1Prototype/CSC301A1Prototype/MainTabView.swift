//
//  TabView.swift
//  CSC301A1Prototype
//
//  Created by Changhao Song on 2020-09-24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    
                }
            CheckoutView()
                .tabItem {
                    VStack{
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
