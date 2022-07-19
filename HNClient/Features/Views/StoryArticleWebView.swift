//
//  StoryArticleWebView.swift
//  HNClient
//
//  Created by Paolo Baeli on 19/07/22.
//

import SwiftUI
import WebKit


struct StoryArticleWebView: UIViewRepresentable {
    
    var url: URL
    @Binding var loading: Bool
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        let request = URLRequest(url: url)
        webView.load(request)
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        WebViewCoordinator(didStart: {
            loading = true
        }, didFinish: {
            loading = false
        })
    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    
    var didStart: () -> Void
    var didFinish: () -> Void
    
    init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
    
}


/*
struct StoryArticleWebView_Previews: PreviewProvider {
    static var previews: some View {
        StoryArticleWebView(url: URL(string: "https://olwal.com/hidden")!, loading: )
    }
}
*/
