//
//  CardView.swift
//  Hike
//
//  Created by Bruno Mazzocchi on 14/10/24.
//

import SwiftUI
import Darwin

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    
    // MARK: - FUNCTIONS
    func randomImage() {
        var newNumber: Int
        repeat {
            newNumber = Int(arc4random_uniform(5)) + 1
        } while newNumber == imageNumber
        imageNumber = newNumber
    }
    var body: some View {
        ZStack {
            CustomBackgroundView()
            // MARK: - MAIN CONTENT
            
            VStack {
                VStack (alignment: .leading){
                    // MARK: - HEADER
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint:.bottom
                                )
                            )
                        Spacer()
                        Button {
                            // ACTION: Show a sheet
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }.sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                    
                }
                .padding(.horizontal, 20)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                
                // MARK: - FOOTER
                Button {
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                ],
                                startPoint: .top,
                                endPoint:.bottom
                            )
                        )
                }
                .buttonStyle(GradientButton())
            }
            
        }
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
