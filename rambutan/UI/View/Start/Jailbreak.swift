//
//  Jailbreak.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import UIKit

struct Jailbreak: View {
  @State private var shadowScale: CGFloat = 1.0
  @State private var showRebootView = false
  
  @State var textStatus1      = "Status: Not running"
  @State var textStatus2      = ""
  @State var textStatus3      = ""
  
  var body: some View {
	ZStack {
	  if showRebootView {
		Reboot()
		  .transition(.opacity)
	  } else {
		VStack {
		  Spacer()
		  VStack {
			Image(systemName: "house.fill")
			  .resizable()
			  .frame(width: 64, height: 53)
			  .foregroundColor(Color(UIColor.label).opacity(0.4))
			  .shadow(color: Color.black.opacity(0.1), radius: 10)
			  .modifier(PulsatingShadow(scale: shadowScale))
		  }
		  .shadow(color: Color.black.opacity(0.1), radius: 10)
		  .padding(10)
		  .padding(.bottom, 30)
		  Spacer()
		  HStack {
			VStack {
			  HStack {
				Spacer()
				VStack {
				  Text(textStatus1)
					.foregroundColor(Color(UIColor.label))
					.font(.headline)
				  Text(textStatus2)
					.foregroundColor(Color(UIColor.label).opacity(0.7))
					.font(.subheadline)
				  Text(textStatus3)
					.foregroundColor(Color(UIColor.label).opacity(0.4))
					.font(.footnote)
				}
				Spacer()
			  }
			  .padding(.leading, 10)
			  .padding()
			  .background(Blur(style: .systemThinMaterial))
			  .foregroundColor(.white)
			  .cornerRadius(26)
			  .padding(.bottom, 5)
			  .shadow(color: Color.black.opacity(0.1), radius: 10)
			}
		  }
		  .padding(10)
		  .padding(.bottom, 30)
		}
		.padding()
	  }
	}
	.animation(.easeInOut)
	.onAppear {
//	  DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//		showRebootView = true
//	  }
	  animateShadow()
        DispatchQueue(label: "Exploit").async {
            launchExampleExploit()
        }
	}
  }
  
  private func animateShadow() {
	withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
	  shadowScale = 1.3
	}
  }
  
  func launchExampleExploit() {
	statusUpdate("Status: Launching kexploitd")
      sleep(1)
	statusUpdate("Status: balls")
      sleep(1)
	statusUpdate("Status: balls2")
      sleep(1)
	statusUpdate("Status: balls4")
      sleep(1)
	statusUpdate("Status: balls9")
	print("balls")
  }
  
  func statusUpdate(_ s: String) {
	textStatus3 = textStatus2
	textStatus2 = textStatus1
	textStatus1 = s
  }
}

struct PulsatingShadow: ViewModifier {
  let scale: CGFloat
  
  func body(content: Content) -> some View {
	content
	  .shadow(color: Color.white.opacity(0.8), radius: 10 * scale)
	  .scaleEffect(scale)
  }
}


