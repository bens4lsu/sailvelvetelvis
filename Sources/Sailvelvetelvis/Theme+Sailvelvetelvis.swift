//
//  File.swift
//  
//
//  Created by Ben Schultz on 2023-11-14.
//

import Foundation
import Foundation
import Publish

extension Theme where Site == Sailvelvetelvis {
    static var sailvelvetelvisTheme: Theme {
        Theme(htmlFactory: SailVelvetElvisHTMLFactory(), resourcePaths: ["Resources/style/style2.css"])
    }
}
