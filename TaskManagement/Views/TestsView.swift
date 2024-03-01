//
//  Home.swift
//  ScrollableTabView
//
//  Created by Ancel Dev account on 16/11/23.
//

import SwiftUI

struct TestView: View {
    
    @State private var selectedTab: Tab?
    @Environment(\.colorScheme) private var scheme
    
    @State private var tabProgress: CGFloat = 0
    
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                HStack {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "bell.badge")
                    })
                }
                .font(.title2)
                .overlay {
                    Text("Messages")
                        .font(.title3.bold())
                }
                .foregroundStyle(.primary)
                .padding(15)
                /// Custom Tab Bar
                CustomBar()
                
                /// Paging View using new iOS 17 APIs
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        SampleView(.purple)
                            .id(Tab.chats)
                            .containerRelativeFrame(.horizontal)
                        SampleView(.red)
                            .id(Tab.calls)
                            .containerRelativeFrame(.horizontal)
                        SampleView(.blue)
                            .id(Tab.settings)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                
                //            .scrollPosition(id: $selectedTab)
                //            .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                //            .scrollClipDisabled()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.gray.opacity(0.1))
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("House")
                    } label: {
                        Image(systemName: "house")
                    }
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func CustomBar() -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id:\.rawValue) { tab in
                HStack(spacing: 10) {
//                    Image(systemName: tab.systemImage)
                    Image(systemName: selectedTab == tab ? "circle.inset.filled" : "circle")
                    Text(tab.rawValue)
                        .font(.callout)
//                        .foregroundStyle(selectedTab == tab ? .green : .red)
                }
                .foregroundStyle(selectedTab == tab ? .green : .red)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selectedTab = tab
                    }
//                    print(selectedTab?.rawValue)
                }
            }
        }
        .background {
            GeometryReader {
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(Tab.allCases.count)
                
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .background(.gray.opacity(0.1), in: .capsule)
        .padding(.horizontal, 15)
    }
    
    // Sample view for demostrating Scrollable Tab Bar Indicato
    @ViewBuilder
    func SampleView(_ color: Color) -> some View {
//        Color(color)
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                ForEach(1...10, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient)
                        .frame(height: 150)
                }
            })
            .padding(15)
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
        .mask {
            Rectangle()
                .padding(.bottom, -100)
        }
    }
}

#Preview {
    TestView()
}







enum Tab: String, CaseIterable {
    case chats = "Chats"
    case calls = "Calls"
    case settings = "Settings"
    
    var systemImage: String {
        switch self {
        case .calls:
            return "phone"
        case .chats:
            return "bubble.left.and.bubble.right"
        case .settings:
            return "gear"
        }
    }
}
