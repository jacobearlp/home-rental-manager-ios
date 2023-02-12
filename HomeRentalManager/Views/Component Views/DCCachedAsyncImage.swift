//
//  DCCachedAsyncImage.swift
//  HomeRentalManager
//
//  Created by Jacob on 2/10/23.
//

//
// A simple wrapper around CachedAsyncImage package.
// The CachedAsyncImage extends functionality of the AsyncImage by adding cache capabilities.
// Package homepage: https://github.com/lorenzofiamingo/swiftui-cached-async-image
//
// Usage:
//  DCCachedAsyncImage(url: URL, urlCache: URLCache?, content: (Image) -> Content?, placeholder: View)
//   where
//      url is an URL object pointing to an image
//      urlCache is an optional URLCache object (see URLCache extension below)
//      content is a closure receiving Image parameter to apply modifiers or be returned as is
//      placeholder is a View to be shown while image is being loaded
//
// For example, using default .shared URLCache:
//     DCCachedAsyncImage(url: url) {image in
//          image
//             .aspectRatio(contentMode: .fit)
//             .frame(minWidth: imageSize, minHeight: imageSize)
//             .cornerRadius(8)
//     } placeholder: {
//         ProgressView()
//     }
//
// Example using only disk cache with size 10G
//     DCCachedAsyncImage(url: url, urlCache: .DCURLCacheDiskOnly) {image in
//          ...
//

import SwiftUI
import CachedAsyncImage

public struct DCCachedAsyncImage<Content, Placeholder>: View where Content: View, Placeholder: View {
    let url: URL?
    let urlCache: URLCache = .shared
    @ViewBuilder var content: (Image) -> Content
    @ViewBuilder let placeholder: Placeholder

    public var body: some View {
        if let url {
            CachedAsyncImage(url: url, urlCache: urlCache) { image in
                content(image)
            } placeholder: {
                placeholder
            }
        } else {
            placeholder
        }
    }
}

//
// Custom URLCache instances
//
extension URLCache {
    static private let allowedDiskCapacity = 10*1024*1024*1024  // 10G
    static private let allowedMemCapacity = 512*1024*1024       // 512M
    static let DCURLCacheMemAndDisk = URLCache(memoryCapacity: allowedMemCapacity, diskCapacity: allowedDiskCapacity)
    static let DCURLCacheMemOnly = URLCache(memoryCapacity: allowedMemCapacity, diskCapacity: 0)
    static let DCURLCacheDiskOnly = URLCache(memoryCapacity: 0, diskCapacity: allowedDiskCapacity)
}

