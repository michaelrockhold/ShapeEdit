//
//  CanvasView.swift
//  ShapeEdit
//
//  Created by Dmytro Anokhin on 23/07/2021.
//

import SwiftUI


struct CanvasView: View {

    @Binding var graphics: [Graphic]

    @State var canvasSize = CGSize(width: 1920.0, height: 1080.0)

//    private var graphicsCollection: BindingCollection<[Graphic]> {
//        BindingCollection(base: $graphics)
//    }

    var body: some View {
        canvas
            .aspectRatio(canvasSize.width / canvasSize.height, contentMode: .fit)
    }

    @ViewBuilder var canvas: some View {
        ZStack(alignment: .topLeading) {
            ForEach($graphics) { graphic in
                makeView(graphic.wrappedValue)
            }
        }
    }

    @ViewBuilder func makeView(_ graphic: Graphic) -> some View {
        ZStack {
            switch graphic.content {
                case .rect:
                    Rectangle()
                        .fill(graphic.fill.color)

                case .triangle:
                    Triangle()
                        .fill(graphic.fill.color)

                case .circle:
                    Circle()
                        .fill(graphic.fill.color)
            }
        }
        .frame(width: graphic.size.width, height: graphic.size.height, alignment: .center)
        .position(graphic.offset)
    }
}


struct Triangle: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: 0.0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0.0, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}


extension Graphic.Fill {

    var color: Color {
        switch self {
            case .red:
                return Color.red
            case .green:
                return Color.green
            case .blue:
                return Color.blue
        }
    }
}