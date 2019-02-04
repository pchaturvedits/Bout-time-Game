//
//  facts .swift
//  bout time game
//
//  Created by Manish Chaturvedi on 1/17/19.
//  Copyright © 2019 Manish Chaturvedi. All rights reserved.
//

import Foundation
import GameKit
struct Events {
  var events: String
  var  occuranceDate:Int
}
struct GameManager {
var storedFacts: [Int] = []
var indexOfSelectedQuestion: Int = 0
var shouldGenerateRandomNumber = true
    var gameRunTime = 60
    let staticPlayTime = 60
    var score: Int = 0
    var totalRounds = 6
    var round = 0
    var correctAnswer = 0
let facts: [Events] =
[Events(events: "Charles Babbage begins work on Analytical Engine.", occuranceDate: 1835),
Events(events: "Ada Lovelace creates first computer program.", occuranceDate: 1842),
Events(events: "Alan Turing publishes principles of modern computing.", occuranceDate: 1936),
Events(events: "Konrad Zuse creates the Z2 electromechanical relay computer.", occuranceDate: 1939),
Events(events: "British crpytologists develop device to decrypt German Enigma Machine messages during WWII.", occuranceDate: 1939),
Events(events: "IBM creates the Harvard Mark I general purpose computer.", occuranceDate: 1944),
Events(events: "Alan Turing develops the Turing Test to measure human and computer intelligence.", occuranceDate: 1950),
Events(events: "UNIVAC, the first commercially successful computer, is delivered to the U.S. Bureau of Census.", occuranceDate: 1951),
Events(events: "Oldest known recording of computer generated music played by the Ferranti Mark 1.", occuranceDate: 1951),
Events(events: "FORTRAN development begins.", occuranceDate: 1954),
Events(events: "First conference on artificial intelligence held at Dartmouth College.", occuranceDate: 1956),
Events(events: "First dot matrix printer marketed by IBM.", occuranceDate: 1957),
Events(events: "Development on LISP programming language begins.", occuranceDate: 1958),
Events(events: "COBOL developed by Grace Murray Hopper.", occuranceDate: 1959),
Events(events: "ALGOL, the first structured, procedural programming language, released.", occuranceDate: 1960),
Events(events: "Spacewar!, an early computer game, written by MIT student Steve Russell.", occuranceDate: 1962),
Events(events: "First prototype of a computer mouse created by Douglas Engelbart.", occuranceDate: 1963),
Events(events: "IBM System/360 launches--the first business and scientific computer, and notable for using 8-bit bytes.", occuranceDate: 1964),
Events(events: "Moore's Law, an observation that processor complexity doubled every year, published by Gordon Moore.", occuranceDate: 1965),
Events(events: "Hewlett-Packard enters the general purpose computer market.", occuranceDate: 1966),
Events(events: "The floppy disk is invented at IBM.", occuranceDate: 1967),
Events(events: "Intel is founded.", occuranceDate: 1968),
Events(events: "ARPANET, the original basis of the Internet, begins.", occuranceDate: 1969),
Events(events: "The first Request for Comments, RFC 1 published.", occuranceDate: 1969)]



mutating func generateRandomNumber()-> Int{
    var indexOfSelectedQuestion: Int = 0
    var shouldGenerateRandomNumber = true
    while shouldGenerateRandomNumber {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: self.facts.count)
        
        if storedFacts.contains(indexOfSelectedQuestion) {
            shouldGenerateRandomNumber = true
        }else {
            storedFacts.append(indexOfSelectedQuestion)
            shouldGenerateRandomNumber = false
        }
        
    }
    return indexOfSelectedQuestion
}
   
    
}

