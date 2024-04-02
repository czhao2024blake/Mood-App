//
//  ViewModel.swift
//  Project1MOODAPP
//
//  Created by Christopher Zhao24 on 2/23/24.
//
import Foundation
import SwiftUI

class viewModel: ObservableObject {
    //next button
    @Published var nextButtonPressed: Bool = false
   
    }



class StringAnalysis: ObservableObject{
    
    @Published var inputText: String = ""
    
    func tokenizePhrase(_ text: String)->[String]{
        let punctuationCharacterSet = CharacterSet.punctuationCharacters
        let lowercasedText = text.lowercased()
        let stringWithoutPunctuation = lowercasedText.components(separatedBy: punctuationCharacterSet).joined(separator: "")
        let textArray = stringWithoutPunctuation.split(separator: " ", omittingEmptySubsequences: true)
        
        
        
        if text == ""{
            return [""]
        }
        return textArray.map(String.init)
    }
    
    //occurences?
    func countOccurences(_ text: [String], _ keyword: String) -> Int{
        if text.count == 0 || keyword == ""{
            return -10
        }
        var occurences = 0
        for i in 0 ... text.count - 1{
            
            
            if text[i] == keyword{
                occurences += 1
            }
        }
        return occurences
    }
    
    func analyzeTextKeywords(_ text: [String],_ keywords: [String]) -> [Int]{
        var keywordCounts: [Int] = []
        if text.count == 0{
            return [0]
        }
        if keywords == []{
            return []
        }
        for i in 0 ... keywords.count - 1{
            keywordCounts.append(countOccurences(text, keywords[i]))
        }
        
        return keywordCounts
    }
    
    func computeTextWeight(_ counts: [Int],_ weights: [Int]) -> Int{
        if (counts.count != weights.count) {
            return -10
        }
        if counts == [] && weights == []{
            return 0
        }
        
        var output = 0
        
        for i in 0 ... counts.count - 1 {
            output += counts[i] * weights[i]
        }
        
        return output
    }
    
    func categorizeValue(_  value: Int) -> String{
        if value <= -15{
            return "Strongly Negative"
        } else if value <= -2{
            return "Negative"
        }else if value <= 1{
            return "Neutral"
        }else if value <= 14{
            return "Positive"
        }else {
            return "Strongly Positive"
        }
        
    }
    
    func doEverything(inputText: String) -> String{
        let tokenizedPhrase:[String] = tokenizePhrase(inputText)
        let keywordCounts = analyzeTextKeywords(tokenizedPhrase, keywords)
        let textWeight = computeTextWeight(keywordCounts, values)
        
        return categorizeValue(textWeight)
    }
    func returnQuote(_ value: String) -> String{
        //
        guard let quotes = phrases[value] else{
            return "bad input value"
        }
            let randomIndex = Int.random(in: 0..<quotes.count)
            return quotes[randomIndex]
    
        }

    }


