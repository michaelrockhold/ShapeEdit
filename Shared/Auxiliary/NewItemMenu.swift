//
//  NewItemMenu.swift
//  ShapeEdit
//
//  Created by Michael Rockhold on 3/2/24.
//

import SwiftUI

struct NewItemMenu: View {
    @Binding var doc: ShapeEditDocument

    private func newEllipse() -> Graphic {
        return Graphic(id: UUID().uuidString,
                       name: "Ellipse",
                       content: .ellipse,
                       children: nil,
                       fill: .yellow,
                       stroke: nil,
                       offset: .zero,
                       size: LibraryView.graphicSize)
    }

    private func newTriangle() -> Graphic {
        Graphic(id: UUID().uuidString,
                name: "Triangle",
                content: .triangle,
                children: nil,
                fill: .magenta,
                stroke: nil,
                offset: .zero,
                size: LibraryView.graphicSize)
    }

    private func newRectangle() -> Graphic {
        Graphic(id: UUID().uuidString,
                name: "Rectangle",
                content: .rect,
                children: nil,
                fill: .cyan,
                stroke: nil,
                offset: .zero,
                size: LibraryView.graphicSize)
    }
    
    var body: some View {
        Menu(content: {
            Button(action: {
                doc.graphics.append(newEllipse())
            }, label: {
                Label("New Ellips", systemImage: "circle.fill")
            })

            Button(action: {
                doc.graphics.append(newTriangle())
            }, label: {
                Label("New Triangle", systemImage: "triangle.fill")
            })

            Button(action: {
                doc.graphics.append(newRectangle())
            }, label: {
                Label("New Square", systemImage: "square.fill")
            })

        }, label: {
            Image(systemName: "square.on.circle")
                .imageScale(.large)
            //                .background(Color.red)
        })
        //        .background(Color.green)
        //        Menu(content: {
        //            Button(action: {print("option A")}, label: {Label("My option A", systemImage: "folder.badge.plus")})
        //            Button(action: {print("option B")}, label: {Label("My option B", systemImage: "doc.badge.plus")})
        //        }, label: {
        //            Image(systemName: "plus.circle")
        //                .imageScale(.large)
        //                .background(Color.red)
        //        })
        //        .background(Color.green)
    }
}

//#Preview {
//    NewItemMenu()
//}
