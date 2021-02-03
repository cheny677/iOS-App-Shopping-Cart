//
//  ContentView.swift
//  CSC301A1Prototype
//
//  Created by Yutong Chen on 2020-09-23.
//

import SwiftUI

public var apple = ShoppingItem(name: "Apple", price: 3.99, image: "apple")
public var banana = ShoppingItem(name: "Banana", price: 3.99, image: "banana")
public var subtotal = calculateSubtotal(shoppingCartItems: shoppingCartItems)
public var total = calculateTotal(subtotal: subtotal, coupon: "NULL")

struct ContentView: View {
    
    @State private var couponExpanded = false
    @State private var couponSelectedNum = 0
    @State private var appleIsExpanded = false
    @State private var appleIsSelected = 0
    @State private var bananaIsExpanded = false
    @State private var bananaIsSelected = 0
    @State private var promoCodeEntered = ""
    @State private var showingAlert = false

   
    var body: some View {
            
         NavigationView{
            ZStack (alignment: .bottom) {
                    VStack (alignment: .leading) {
                        
                        
                        
                        Button(action: {}){
                            NavigationLink(destination: CheckoutView()){
                                Image(systemName: "cart")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .padding()
                                    .background(Color.yellow).clipShape(Circle()).padding()
                            }.navigationTitle("Shopping Center")
                            
                            NavigationLink(destination: CheckoutView()){
                                Text("Check out \(appleIsSelected + bananaIsSelected) items !").foregroundColor(.orange).padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing], 20.0/*@END_MENU_TOKEN@*/)
                            }.navigationTitle("Shopping Center")
                            
                          
                        }.background(Color.black.opacity(0.8)).clipShape(Capsule()).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                    
                        
                        
                        
                        
                        
                        // Apply Promo Code
                        HStack{
                            TextField("Enter Your Promo Code", text: $promoCodeEntered)
                                .accentColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                            
                            
                            Button(action: {
                                self.showingAlert = true
                            }){
                                Text("Apply")
                                    .font(.title2)
                                    .foregroundColor(Color.green)
                                    .padding(.horizontal)
                                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(8)
                                    .alert(isPresented: $showingAlert) {
                                                Alert(title: Text("Congrats!"), message: Text("You are eligible for a 10% off discount."), dismissButton: .default(Text("Got it!")))
                                            }
                            }
                        }

                        ScrollView(.vertical, showsIndicators: false) {
                            
                            
                            
                            // First row containing top two items
                            HStack (spacing: 20) {
                                // First item in first row
                                VStack(){
                                    VStack () {
                                        Spacer()
                                        
                                        Text("Apple")
                                            .font(.system(size: 18))
                                            .foregroundColor(.red)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top)
                                        
                                        Image("apple").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
                                        
                                        Text("$3.99")
                                            .foregroundColor(.purple)
                                            .font(.system(size: 20))
                                            .padding(.bottom, 0.5)
                                        
                                        Text("Quantity")
                                            .multilineTextAlignment(.center)
                                            .padding(.bottom)
                                        Spacer()
                                        
                                    }.padding(.bottom).frame(width: 160, height: 220).background(Color.secondary.opacity(0.8)).cornerRadius(12)
                                    VStack {
                                        
                                        DisclosureGroup("\(appleIsSelected)", isExpanded: $appleIsExpanded){
                                            ScrollView{
                                                VStack{
                                                    ForEach(0...100, id:\.self){  num in
                                                        Text("\(num)")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 20))
                                                            .padding(.all)
                                                            .onTapGesture{
                                                                self.appleIsSelected = num
                                                                apple.selectNum(num: num)
                                                                subtotal = calculateSubtotal(shoppingCartItems: shoppingCartItems)
                                                                total = calculateTotal(subtotal: subtotal, coupon: "NULL")
                                                                withAnimation{
                                                                    self.appleIsExpanded.toggle()
                                                                }
                                                                
                                                            }
                                                    }
                                                }
                                            }.frame(height: 240)
                                        }
                                        .padding(.horizontal)
                                        .accentColor(.white)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/)
                                    }
                                }
                                // Second item in first row
                                VStack(){
                                    VStack () {
                                        Spacer()
                                        
                                        Text("Banana")
                                            .font(.system(size: 18))
                                            .foregroundColor(.red)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top)
                                        
                                        Image("banana").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
                                        
                                        Text("$3.99")
                                            .foregroundColor(.purple)
                                            .font(.system(size: 20))
                                            .padding(.bottom, 0.5)
                                        
                                        Text("Quantity")
                                            .multilineTextAlignment(.center)
                                            .padding(.bottom)
                                        Spacer()
                                        
                                    }.padding(.bottom).frame(width: 160, height: 220).background(Color.secondary.opacity(0.8)).cornerRadius(12)
                                    VStack {
                                        
                                        DisclosureGroup("\(bananaIsSelected)", isExpanded: $bananaIsExpanded){
                                            ScrollView{
                                                VStack{
                                                    ForEach(0...100, id:\.self){  num in
                                                        Text("\(num)")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 20))
                                                            .padding(.all)
                                                            .onTapGesture{
                                                                self.bananaIsSelected = num
                                                                banana.selectNum(num: num)
                                                                subtotal = calculateSubtotal(shoppingCartItems: shoppingCartItems)
                                                                total = calculateTotal(subtotal: subtotal, coupon: "NULL")
                                                                withAnimation{
                                                                    self.bananaIsExpanded.toggle()
                                                                }
                                                                
                                                            }
                                                    }
                                                }
                                            }.frame(height: 240)
                                        }
                                        .padding(.horizontal)
                                        .accentColor(.white)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.pink/*@END_MENU_TOKEN@*/)
                                    }
                                }
                            }
                            
                        }
                    }.padding().edgesIgnoringSafeArea(.bottom)
                    
            }.background(Image("background"))
        }
    }
}

struct PopUp : View {
    var body : some View{
        HStack {
            Text("ds")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
        }
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
