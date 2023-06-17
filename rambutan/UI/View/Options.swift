//
//  DetailView.swift
//  rambutan
//
//  Created by samara on 6/16/23.
//

import SwiftUI
import UIKit
import PhotosUI

struct Options: View {
  @State var isUsingDefaultBackground = false
  @State private var selectedImage: UIImage?
  @State private var selectedImageData: Data?
  
  @State private var showingImagePicker = false
  
  var body: some View {
	ZStack {
	  VStack {
		Spacer()
		Image(systemName: "gear")
		  .resizable()
		  .frame(width: 75, height: 75)
		  .foregroundColor(Color(UIColor.label).opacity(0.4))
		  .shadow(color: Color.black.opacity(0.1), radius: 10)
		  .animation(.easeInOut(duration: 0.4))
		
		Spacer()
		HStack {
		  VStack {
			Section(header: CustomSectionHeader(title: "Customization")) {
			  VStack {
				CheckmarkView(title: "Custom Background", isSelected: isUsingDefaultBackground) {
				  isUsingDefaultBackground.toggle()
				}
				
				if isUsingDefaultBackground {
				  Divider()
				  Button(action: {
					self.showingImagePicker = true
				  }) {
					HStack {
					  Text("Select Image")
						.foregroundColor(Color(UIColor.label))
					  Spacer()
					}
				  }
				  .sheet(isPresented: $showingImagePicker, content: {
					ImagePicker(sourceType: .photoLibrary, selectedImage: $selectedImage)
					  .ignoresSafeArea()
				  })
				}
			  }
			  .padding(.leading, 10)
			  .padding()
			  .background(Blur(style: .systemThinMaterial))
			  .foregroundColor(.white)
			  .cornerRadius(26)
			  .padding(.bottom, 5)
			}
			
			
			
			Section(header:
					  CustomSectionHeader(title: "Settings")
			) {
			  VStack {
				HStack {
				  Spacer()
				  VStack {
					Toggle("Show More Logs", isOn: .constant(true))
					  .foregroundColor(Color(UIColor.label))
					Divider()
					Toggle("iOS OTA Updates", isOn: .constant(false))
					  .foregroundColor(Color(UIColor.label))
				  }
				  Spacer()
				}
				.padding()
				.background(Blur(style: .systemThinMaterial))
				.cornerRadius(26)
				.padding(.bottom, 5)
			  }
			}
			
			Section(header:
					  CustomSectionHeader(title: "Utilities")
			) {
			  VStack {
				HStack {
				  createButton(text: "Respring") {
					print("Respring tapped")
				  }
				  createButton(text: "UICache") {
					print("UICache tapped")
				  }
				}
				HStack {
				  createButton(text: "Userspace Reboot") {
					print("Userspace Reboot tapped")
				  }
				}
			  }
			}
		  }
		}
		.shadow(color: Color.black.opacity(0.1), radius: 10)
		.padding(10)
		.padding(.bottom, 30)
	  }
	  .padding()
	}
	
  }
}
