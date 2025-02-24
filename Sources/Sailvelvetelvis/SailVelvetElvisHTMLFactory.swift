//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-14.
//

//
//  File.swift
//
//
//  Created by Ben Schultz on 5/15/23.
//
import Foundation
import Publish
import Plot
import Ink

struct SailVelvetElvisHTMLFactory: HTMLFactory {
   
    
    typealias Site = Sailvelvetelvis
        
    func makeIndexHTML(for index: Publish.Index, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML {
        let htmlHeadInfo = HeaderInfo(location: context.index, title: "sailvelvetelvis.com")
        return HTML(
            htmlHeadInfo.node,
            PageTemplate(index: index).convertToNode()
        )
    }
    
    func makePageHTML(for page: Publish.Page, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML {
        let htmlHeadInfo = SailVelvetElvisHTMLFactory.HeaderInfo(location: context.index, title: "sailvelvetelvis.com")
        return HTML(
            htmlHeadInfo.node,
            PageTemplate(page: page).convertToNode()
        )
    }



    func makeSectionHTML(for section: Publish.Section<Sailvelvetelvis>, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML {
        return HTML("hello section")
    }
   
    
    func makeItemHTML(for item: Publish.Item<Sailvelvetelvis>, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML {
        HTML("hello item")
    }
    
    func makeTagListHTML(for page: Publish.TagListPage, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML? {
        HTML("hello tag list")
    }
    
    func makeTagDetailsHTML(for page: Publish.TagDetailsPage, context: Publish.PublishingContext<Sailvelvetelvis>) throws -> Plot.HTML? {
        HTML("hello tag details")
    }
    

}
