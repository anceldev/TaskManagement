//
//  TextPicker.swift
//  TaskManagement
//
//  Created by Ancel Dev account on 1/3/24.
//

import SwiftUI

enum Fruit: String, CaseIterable, Identifiable {
    case apple, banana, mango, orange, strawberry, grape
    var id: String { self.rawValue }
}


struct CustomPicker<SelectionValue, Content>: View where SelectionValue == Content.Element, Content: RandomAccessCollection, Content.Element: Identifiable & Equatable, Content.Element.ID == String {
    
    //    @Binding var selection: SelectionValue?
    @Binding var selection: SelectionValue
    @Binding var disabled: Bool
    let items: () -> Content
    
    @State var isPicking = false
    @State var hoveredItem: SelectionValue?
    @Environment(\.isEnabled) var isEnabled
    
    let buttonHeight: CGFloat = 31
    let arrowSize: CGFloat = 16
    let cornerRadius: CGFloat = 20
    
    
    var body: some View {
        // Select Button - Selected item
        VStack {
            HStack() {
                HStack(spacing: 6) {
                    Image(systemName: "star.circle")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(selection as! Priority == Priority.none ? .gray3 : .primaryGreen)
                    
                    Text(selection.id.capitalized)
                        .workSans(12, style: .medium)
                        .lineLimit(1)
                }
                Spacer()
                Image(systemName: isPicking ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: isPicking ? 6.19 : 11)
                    .animation(.easeIn, value: 1)
//                    .padding(.leading, 6)
            }
            .padding(.horizontal, 10)
            .frame(height: buttonHeight)
            .frame(width: 112)
            .clipShape(Capsule())
            .overlay {
                Capsule()
                    .stroke(.gray3, lineWidth: 1)
            }
            .onTapGesture {
                if disabled{
                    isPicking.toggle()
                }
            }
            .overlay(alignment: .topLeading) {
                VStack {
                    if isPicking {
                        Spacer(minLength: buttonHeight + 10)
                        ScrollView {
                            VStack(alignment: .leading , spacing: 0) {
                                ForEach(items()) { item in
                                    Button {
                                        selection = item
                                        print(selection)
                                        isPicking.toggle()
                                    } label: {
                                        Text(item.id.capitalized)
                                            .workSans(12, style: .medium)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.7)
                                            .frame(height: buttonHeight)
                                            .frame(maxWidth: .infinity)
                                            .background {
                                                RoundedRectangle(cornerRadius: cornerRadius)
                                                    .fill(hoveredItem == item ? .red : Color.clear)
                                                    .padding(.horizontal, 8)
                                                    .padding(.bottom, 10)
                                                    .offset(y: 5)
                                            }
                                            .onHover { isHovered in
                                                if isHovered {
                                                    hoveredItem = item
                                                }
                                            }
                                    }
                                    .buttonStyle(.plain)
                                    Divider()
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .scrollIndicators(.never)
                        .frame(height: CGFloat(items().count) * buttonHeight)
                        .background(.gray1)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius)
                                .stroke(.gray3, lineWidth: 1)
                        )
                        .transition(.scale(scale: 0.8, anchor: .top).combined(with: .opacity).combined(with: .offset(y: -10)))
                    }
                }
            }
            .opacity(isEnabled ? 1.0 : 0.6)
            .clashDisplay(13, .regular)
            .animation(.easeInOut(duration: 0.12), value: isPicking)
            .sensoryFeedback(.selection, trigger: selection)
//            .zIndex(1)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    @State var disabled = true
    @State var priority = Priority.none
    return VStack {
        CustomPicker(selection: $priority, disabled: $disabled)
        {
            Priority.allCases
        }
    }
    .background(.black)
    .frame(width: 280, height: 280, alignment: .top)
    .padding()
}
