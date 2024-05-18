//
//  UIImageViewTests.swift
//  UIKitPlusTests
//
//  Created by Jaewon Yun on 5/18/24.
//

import UIKitPlus
import XCTest

final class UIImageViewTests: XCTestCase {

    func test_contentClippingRect_whenOnlyWidth() {
        let image = UIImage(resource: ImageResource(name: "100_100px.png", bundle: Bundle(for: Self.self)))
        
        // MARK: Not yet determined height
        
        let imageView1 = UIImageView()
        imageView1.contentMode = .scaleAspectFit
        imageView1.image = image
        imageView1.frame = CGRect(x: 0, y: 0, width: 50, height: 0)
        
        XCTAssertEqual(imageView1.contentClippingRect.origin.x, 0)
        XCTAssertEqual(imageView1.contentClippingRect.size, CGSize(width: 50, height: 50))
        
        // MARK: Not yet determined width
        
        let imageView2 = UIImageView()
        imageView2.contentMode = .scaleAspectFit
        imageView2.image = image
        imageView2.frame = CGRect(x: 0, y: 0, width: 0, height: 200)
        
        XCTAssertEqual(imageView2.contentClippingRect.origin.y, 0)
        XCTAssertEqual(imageView2.contentClippingRect.size, CGSize(width: 200, height: 200))
    }
    
    func test_contentClippingRect_whenNotSetScaleAspectFit() {
        let image = UIImage(resource: ImageResource(name: "100_100px.png", bundle: Bundle(for: Self.self)))
        
        UIView.ContentMode.allCases.forEach { contentMode in
            if contentMode == .scaleAspectFit { return }
            
            let imageView = UIImageView()
            imageView.contentMode = contentMode
            imageView.image = image
            imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
            XCTAssertEqual(imageView.contentClippingRect, CGRect(x: 0, y: 0, width: 200, height: 300))
        }
    }
    
    func test_contentClippingRect_whenNoImage() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertEqual(imageView.contentClippingRect, CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    func test_contentClippingRect() {
        let image = UIImage(resource: ImageResource(name: "100_100px.png", bundle: Bundle(for: Self.self)))
        XCTAssertEqual(image.size, CGSize(width: 100, height: 100))
        
        // MARK: Expand
        
        let imageView1 = UIImageView()
        imageView1.contentMode = .scaleAspectFit
        imageView1.image = image
        imageView1.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        XCTAssertEqual(imageView1.contentClippingRect, CGRect(x: 0, y: 0, width: 200, height: 200))
        
        let imageView2 = UIImageView()
        imageView2.contentMode = .scaleAspectFit
        imageView2.image = image
        imageView2.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        
        XCTAssertEqual(imageView2.contentClippingRect, CGRect(x: 50, y: 0, width: 100, height: 100))
        
        let imageView3 = UIImageView()
        imageView3.contentMode = .scaleAspectFit
        imageView3.image = image
        imageView3.frame = CGRect(x: 0, y: 0, width: 150, height: 200)
        
        XCTAssertEqual(imageView3.contentClippingRect, CGRect(x: 0, y: 25, width: 150, height: 150))
        
        // MARK: Collapse
        
        let imageView4 = UIImageView()
        imageView4.contentMode = .scaleAspectFit
        imageView4.image = image
        imageView4.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        XCTAssertEqual(imageView4.contentClippingRect, CGRect(x: 0, y: 0, width: 50, height: 50))
        
        let imageView5 = UIImageView()
        imageView5.contentMode = .scaleAspectFit
        imageView5.image = image
        imageView5.frame = CGRect(x: 0, y: 0, width: 25, height: 50)
        
        XCTAssertEqual(imageView5.contentClippingRect, CGRect(x: 0, y: 12.5, width: 25, height: 25))
        
        let imageView6 = UIImageView()
        imageView6.contentMode = .scaleAspectFit
        imageView6.image = image
        imageView6.frame = CGRect(x: 0, y: 0, width: 75, height: 25)
        
        XCTAssertEqual(imageView6.contentClippingRect, CGRect(x: 25, y: 0, width: 25, height: 25))
        
        // MARK: Mix
        
        let imageView7 = UIImageView()
        imageView7.contentMode = .scaleAspectFit
        imageView7.image = image
        imageView7.frame = CGRect(x: 0, y: 0, width: 50, height: 150)
        
        XCTAssertEqual(imageView7.contentClippingRect, CGRect(x: 0, y: 50, width: 50, height: 50))
        
        let imageView8 = UIImageView()
        imageView8.contentMode = .scaleAspectFit
        imageView8.image = image
        imageView8.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        
        XCTAssertEqual(imageView8.contentClippingRect, CGRect(x: 50, y: 0, width: 50, height: 50))
    }
}

extension UIView.ContentMode: CaseIterable {
    public static var allCases: [UIView.ContentMode] = [
        .scaleToFill,
        .scaleAspectFit,
        .scaleAspectFill,
        .redraw,
        .center,
        .top,
        .bottom,
        .left,
        .right,
        .topLeft,
        .topRight,
        .bottomLeft,
        .bottomRight,
    ]
}
