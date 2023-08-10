//
//  WebView.swift
//  MarvelApi
//
//  Created by López Aboal Rosalía on 4/8/23.
//

import SwiftUI
import WebKit

// MARK: - Detail View URL

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        return view
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}
