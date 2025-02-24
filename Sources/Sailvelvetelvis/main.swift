import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Sailvelvetelvis: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://sailvelvetelvis.com")!
    var name = "Sail Velvet Elvis"
    var description = "Set sail on Lake Pontchartrain aboard North America's only Pegasus 50 sailboat for breathtaking New Orleans skyline views and unforgettable sunsets."
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Sailvelvetelvis().publish(withTheme: .sailvelvetelvisTheme)
