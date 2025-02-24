//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-16.
//

import Foundation
import Plot
import Publish

extension SailVelvetElvisHTMLFactory {

    struct HeaderInfo {
        let site: any Website = Sailvelvetelvis()
        let location: Location
        let title: String
        let rssFeedPath: Path? = .defaultForRSSFeed
        let rssFeedTitle: String? = nil
        let stylesheetPaths: [Path] = ["/style/lightview.css",
                                       "/style/style2.css?v=\(EnvironmentKey.styleAndScriptVersion)",]
        let scriptPaths: [Path] = ["https://code.jquery.com/jquery-3.7.0.min.js",
                                   "/scripts/lightview.js",]
        
        
//        let gaScript = """
//              window.dataLayer = window.dataLayer || [];
//              function gtag(){dataLayer.push(arguments);}
//              gtag('js', new Date());
//
//              gtag('config', 'G-KL8PZZGY28');
//        """
//        
//        //var gaNode: Node<HTML.HeadContext> { .script(.text(gaScript)) }
//        
//        var additionalNodeGa: () -> Node<HTML.HeadContext> {
//            {() -> Node<HTML.HeadContext> in
//                return .script(.text(gaScript))
//
//            }
//        }
        
        var additionalNodes = [Node<HTML.HeadContext>]()
        
        var node: Node<HTML.DocumentContext> {
            .head(
                .encoding(.utf8),
                .siteName(site.name),
                .url(site.url(for: location)),
                .title(title),
                .description(site.description),
                .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
                .forEach(scriptPaths, { return .script(.src($0.string)) as Node<HTML.HeadContext> }),
                .forEach(stylesheetPaths, { .stylesheet($0) }),
                .viewport(.accordingToDevice),
                .unwrap(site.favicon, { _ in .favicon("/img/headers/favicon.ico") }),
                .unwrap(rssFeedPath, { path in
                    let title = rssFeedTitle ?? "Subscribe to \(site.name)"
                    return .rssFeedLink(path.absoluteString, title: title)
                }),
    //                .unwrap(location.imagePath ?? site.imagePath, { path in
    //                    let url = site.url(for: path)
    //                    return .socialImageLink(url)
    //                }),
    //            additionalNodeGa(),
                .forEach(additionalNodes, { addNode in
                    addNode
                })
            )
        }
    }
}

