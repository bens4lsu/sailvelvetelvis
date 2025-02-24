//
//  File.swift
//  Sailvelvetelvis
//
//  Created by Ben Schultz on 2025-01-31.
//


import Foundation
import Plot
import Publish

struct PageTemplate: Component {
    
    let bodyContent: Component
    let currentYear = Calendar.current.component(.year, from: Date())
    
    init(index: Index) {
        self.bodyContent = index.content.body
    }
    
    init(page: Page) {
        self.bodyContent = page.body
    }
    
    init(component: any Component) {
        self.bodyContent = component
    }
    
    var bodyHeader: Component {
        Header {
            Div {
                Image("/img/velvetelvis.png")
            }
            Div {
                Link(url: "/") {
                    H1 {
                        Span("Sail")
                        Span("Velvet Elvis").class("italic")
                    }
                }
               
            }.class("wrapper")
        }
    }
    
    var bodyFooter: Component {
        Footer {
            Div {
                Text("Follow Velvet Elvis home to New Orleans from her shipyard in Kranj, Slovenia at ")
                Link("bigtrip.sailvelvetelvis.com", url: "https://bigtrip.sailvelvetelvis.com")
            }
            Div {
                Paragraph {
                    Text("© 2023 - \(currentYear) ")
                    Link("sailvelvetelvis.com", url: "https://sailvelvetelvis.com")
                }
            }
        }
    }
    
    var body: Component {
        ComponentGroup {
            bodyHeader
            Div {
                bodyContent
            }.class("content")
            bodyFooter
        }
    }
}
