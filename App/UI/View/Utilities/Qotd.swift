//
//  Funny.swift
//  Aurora
//
//  Created by samara on 6/27/23.
//

import Foundation

func qOTD() -> String {
    let calendar = Calendar.current
    let currentDate = Date()
    let month = calendar.component(.month, from: currentDate)
    
    switch month {
    case 1:  return "You have cat to kitten me right meow 🐱"
    case 2:  return "Windows not really using for manipulating OSX images, compiled in mingw tool for this working unstable and incorrectly."
    case 3:  return "The eye sees only what the mind is prepared to comprehend."
    case 4:  return "You asked everyday for 47 days for an eta. So you can wait in silence in another 47 days."
    case 5:  return "One of the painful things about our time is that those who feel certainty are stupid, and those with any imagination and understanding are filled with doubt and indecision."
    case 6:  return "do you think aaron tells his boss like sorry im taking the day off i need to watch wwdc with my jailbreak server"
    case 7:  return "I can patch ipsw witch checkra1n manually? I flash patched ipsw with checkm8 exploit"
    case 8:  return "what the fuck is this jailbreak drama y'all mad furries bro"
    case 9:  return "Snap back to reality."
    case 10: return "https://dsc.gg/palera1n"
    case 11: return "initproc exited -- exit namespace 1 subcode 0x7 description: none"
    case 12: return "i cant get over the fact that over at apple HQ is a bunch of sweats beig paid millions each, and their biggest sworn enemy is a discord server full of people doing hugs and having anime pics as profile pics, i fucking love it, much apprechiated"
    default: return "Nothing to see here..."
    }
}
