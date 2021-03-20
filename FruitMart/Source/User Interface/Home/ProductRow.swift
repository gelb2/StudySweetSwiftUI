//
//  ProductRow.swift
//  FruitMart
//
//  Created by sokol on 2021/03/20.
//  Copyright © 2021 Giftbot. All rights reserved.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            productImage
            productDescription
        }
        .frame(height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
        .padding(.vertical, 8)
    }
}

//기본 타입에서는 프로퍼티를 정의하고 뷰 프로토콜의 핵심인 body를 구현하는 작업만 담당하고 그 이외에는 확장 영역으로 구분한다
//물론 다른 방법을 이용해서 코드를 정리하는 것도 괜찮다
private extension ProductRow {
    var productImage: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }

    var productDescription: some View {
        VStack(alignment: .leading) {
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text(product.description)
                .font(.footnote)
                .foregroundColor(Color.secondaryText)
            
            Spacer()
            
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }

    var footerView: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            Text("₩").font(.footnote)
                + Text("\(product.price)").font(.headline)
            
            Spacer()
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
            
            Image(systemName: "cart")
                .foregroundColor(Color.peach)
                .frame(width: 32, height: 32)
        })
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[0])
    }
}
