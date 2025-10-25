//
//  WebView.swift
//  Better Tails
//
//  Created by Marian Lisette Hernandez Guzman on 25/10/25.
//

import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
