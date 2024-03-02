//
//  ContentView.swift
//  Shared
//
//  Created by Dmytro Anokhin on 22/07/2021.
//

import SwiftUI


struct ContentView: View {

    @Binding var document: ShapeEditDocument

    @State var selection: Set<String> = Set<String>()

    @State private var isLibraryPresented = false

    @State var selectedGraphics: [Graphic]? = nil

    var body: some View {
#if os(macOS)
        NavigationSplitView {
            List(document.graphics, children: \.children, selection: $selection) { graphicItem in
                NavigationLink {
//                    Text("NavLink")
                    CanvasView(graphics: $document.graphics, selection: $selection)
                } label: {
                    LinkLabel(item: graphicItem)
                }
            }
        } detail: {
//            Text("Detail")
            CanvasView(graphics: $document.graphics, selection: $selection)
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItemGroup(placement: .automatic) {
                NewItemMenu(doc: $document)
            }
        }

#else
        List(document.graphics, children: \.children, selection: $selection) { graphicItem in
                NavigationLink {
                    CanvasView(graphics: $document.graphics, selection: $selection)
                        .toolbar {
                            ToolbarItemGroup(placement: .automatic) {
                                NewItemMenu(doc: $document)
                            }
                        }
                } label: {
                    LinkLabel(item: graphicItem)
                }
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItemGroup(placement: .automatic) {
                NewItemMenu(doc: $document)
            }
        }

#endif // iOS
    }

    struct LinkLabel: View {
        var item: Graphic
        var body: some View {
            HStack {
                GraphicShapeView(graphic: item)
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(height: 17.0)
                Text(item.name)
            }.padding(.leading, 8.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(ShapeEditDocument()))
    }
}
