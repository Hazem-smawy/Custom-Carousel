//
//  Home.swift
//  Custom Carousel
//
//  Created by hazem smawy on 9/29/22.
//

import SwiftUI

struct Home: View {
    // MARK: - View Properties
    @State var currentTab:Tab = .heart
    @Namespace var animation
    // MARK: - Carousel Properties
    @State var currentIndex: Int = 0
    
    var body: some View {
        VStack(spacing:15) {
            HeaderView()
            SearchBar()
           (Text("Featured")
            .fontWeight(.semibold) +
            Text(" Movies")
           )
           .font(.title2)
           .frame(maxWidth:.infinity, alignment: .leading)
           .padding(.top, 15)
           .foregroundColor(.white)
            // MARK: - Custom Carousel
            CustomCarousel(index: $currentIndex, items: moveis, cardPadding: 150, id: \.id) { movie ,cardSize in
                // MARK: - Your Custom Cell
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: cardSize.width, height: cardSize.height)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding(.horizontal, -15)
            .padding(.vertical)
            TabBar()
        }
        .padding([.horizontal,.top], 15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background {
            GeometryReader { proxy in
                let size = proxy.size
                TabView(selection: $currentIndex) {
                    ForEach(moveis.indices, id:\.self){ index in
                        Image(moveis[index].artwork)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipped()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentIndex)
                Rectangle()
                    .fill(.ultraThinMaterial)
                // MARK: - Image will Come Once We Implement Custom Carousel
                
                LinearGradient(colors: [.clear,.black], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Custom Tab Bar
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases , id: \.rawValue) { tab in
                VStack(spacing: -2) {
                    Image(systemName: tab.rawValue)
                        .font(.title.weight(.light))
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.6))
                    
                    if currentTab == tab {
                        Circle()
                            .fill(.white)
                            .frame(width: 5, height: 5)
                            .offset(y: 10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut){
                        currentTab = tab
                    }
                }
            }
        }
        .padding(.horizontal,5)
        .padding(.bottom, 10)
    }
    
    
    // MARK: - Search Bar
    @ViewBuilder
    func SearchBar() -> some View {
        HStack(spacing:15){
            Image(systemName: "bell")
                .font(.title3)
                .foregroundColor(.gray)
            
            TextField("Search",text: .constant(""))
                .padding(.vertical, 10)
            
            Image(systemName: "mic")
                .font(.title3)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 6)
        .background {
            RoundedRectangle(cornerRadius: 15 ,style: .continuous)
                .fill(Color.white.opacity(0.12))
        }
        .padding(.top, 20)
    }
    
    // MARK: - Header View
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                (Text("Hello")
                    .fontWeight(.semibold) +
                Text(" iJustine")
                )
                .font(.title2)
                .foregroundColor(.white)
                
                Text("Book your favourite movie")
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth:.infinity, alignment:  .leading)
            
            Button {
                //
            } label: {
                Image("images")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }

        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
