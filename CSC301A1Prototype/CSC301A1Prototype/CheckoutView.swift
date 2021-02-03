//
//  CheckoutView.swift
//  CSC301A1Prototype
//
//  Created by Changhao Song on 2020-09-23.
//

import SwiftUI

// CONSTANTS:
let taxRate: Float = 0.13

// Useful functions:
func calculateSubtotal(shoppingCartItems: Array<ShoppingItem>) -> Float {
    var subtotal: Float = 0.0
    for item in shoppingCartItems {
        subtotal += item.totalPrice()
    }
    return subtotal
}

func calculateTotal(subtotal: Float, coupon: String, tax: Float = taxRate) -> Float{
    var discount: Float = 0.0
    if coupon != "NULL"{
        discount = 0.2 // 20% off
    }
    return subtotal * (1 + tax) * (1 - discount)
}



var shoppingCartItems: Array<ShoppingItem> = [apple, banana]

struct CheckoutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Shopping Cart")
                .font(.title)
                .padding()
            if subtotal > 0 {
            ScrollView(.vertical, showsIndicators: false){
                CheckoutItemView(item: apple)
                CheckoutItemView(item: banana)
                    VStack{
                        HStack{
                            Spacer()
                            VStack{
                                Text("Subtotal: \(subtotal.toRoundedString())")
                                Text("Coupon: NULL")
                                Text("Tax: \(taxRate.toRoundedString())")
                                Text("Total: \(total.toRoundedString())")
                            }
                            .padding()
                        }

                    }
                }
            }
            else {
                VStack{
                    Spacer()
                    Text("No item selected")
                        .font(.title)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

struct CheckoutItemView: View {
    var item: ShoppingItem
    var body: some View {
        if item.numSelected > 0 {
            HStack {
                VStack {
                    Text(item.name)
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                    item.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                }
                .padding(.horizontal)
                Spacer()
                VStack {
                    Text("$ \(item.price.toRoundedString())")
                    Text("x \(item.numSelected)")
                        
                }
                .padding()
                
            }
            .padding()
        }
    }
}



struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
