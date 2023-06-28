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
    case 3:  return "Why don't you start acting like a developer and not a child and make it available to people and other developers like you did and not keep it to yourself like god knows who you are"
    case 4:  return "Auoura bisectors with the multiple chip varieties encoded into the chipset the iphone uses to control the system storage and SEP. Internally hijacking SEP to use the new and improved fstether exploit used for manipulation of the Display Drivers to also hijack webkit to power the new faceid modular testFlight system used to display that message and have working faceid biometric authentications arm64_32-arm-os"
    case 5:  return "Cute cat? Lmfaooooo"
    case 6:  return "do you think aaron tells his boss like sorry im taking the day off i need to watch wwdc with my jailbreak server 🥺"
    case 7:  return "I can patch ipsw witch checkra1n manually? I flash patched ipsw with checkm8 exploit"
    case 8:  return "meow :3 meow nya~~ :33 meow meow nyaaaa~ :3 meow mreow mrrp"
    case 9:  return "🐳"
    case 10: return "Welcome.... to https://dsc.gg/palera1n !!!!!!!!!!!!!"
    case 11: return "number of people who have recovery looped with palera1n: 31+"
    case 12: return "i cant get over the fact that over at apple HQ is a bunch of sweats beig paid millions each, and their biggest sworn enemy is a discord server full of people doing hugs and having anime pics as profile pics, i fucking love it, much apprechiated"
    default: return "Nothing to see here..."
    }
}
