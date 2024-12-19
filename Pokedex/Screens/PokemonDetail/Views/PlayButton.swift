//
//  PlayButton.swift
//  Pokedex
//
//  Created by Karim Cordilia on 19/12/2024.
//

import SwiftUI

struct PlayButton: View {
    @State private var isPressed = false
    let typeColor: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            isPressed = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
            action()
        }) {
            ZStack {
                Circle()
                    .fill(TypeColorMapper.getTypeColor(for: typeColor))
                    .frame(width: 70, height: 70)
                    .shadow(color: isPressed ? Color.black.opacity(0.2) : Color.black.opacity(0.4),
                            radius: isPressed ? 2 : 6,
                            x: 0,
                            y: isPressed ? 1 : 3)
                
                Triangle()
                    .fill(Color.white)
                    .frame(width: 24, height: 24)
                    .offset(x: 3) // To center the triangle visually
            }
        }
        .scaleEffect(isPressed ? 0.9 : 1.0) // Add press effect
        .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
        .buttonStyle(PlainButtonStyle())
    }
}

// Custom Shape for Play Icon
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// Preview
struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(typeColor: "fire") {
            print("Play button tapped!")
        }
        .previewLayout(.sizeThatFits)
    }
}
