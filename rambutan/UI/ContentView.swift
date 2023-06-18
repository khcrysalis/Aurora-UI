//
//  ContentView.swift
//  rambutan
//
//  Created by samara on 6/15/23.
//

import SwiftUI

struct ContentView: View {
  @State var isTabViewShown = true
  @Environment(\.colorScheme) var colorScheme
  @State private var selectedTab: Tabs = .main
  @State private var blurOpacity: Double = 0.7
  
  var body: some View {
	ZStack {
	  Image("milad-fakurian-u8Jn2rzYIps-unsplash")
		.resizable()
		.aspectRatio(contentMode: .fill)
		.edgesIgnoringSafeArea(.vertical)
	  
	  Blur(style: .systemMaterial)
		.ignoresSafeArea()
		.opacity(0.4)
		.blur(radius: 100)
	  
	  if !isTabViewShown {
		Blur(style: .systemMaterialDark)
		  .ignoresSafeArea()
		  .opacity(0.7)
	  }
	  
	  ZStack {
		if selectedTab != .main {
		  Blur(style: .systemUltraThinMaterialDark)
			.ignoresSafeArea()
			.opacity(blurOpacity)
		}
	  }
	  .animation(.easeOut(duration: 0.4))
	  
	  if isTabViewShown {
		TabView(selection: $selectedTab) {
		  Options()
			.frame(width: UIScreen.main.bounds.width)
			.tag(Tabs.options)
		  Main(isTabViewShown: $isTabViewShown)
			.frame(width: UIScreen.main.bounds.width)
			.tag(Tabs.main)
		  Credits()
			.frame(width: UIScreen.main.bounds.width)
			.tag(Tabs.credits)
		}
		.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
		.indexViewStyle(.page(backgroundDisplayMode: .always))
		.opacity(blurOpacity)
		.transition(.move(edge: .bottom))
	  } else {
		Jailbreak()
		  .frame(width: UIScreen.main.bounds.width)
	  }
	}
	.animation(.easeOut(duration: 0.4))
  }
  
  enum Tabs {
	case options
	case main
	case credits
  }
}

