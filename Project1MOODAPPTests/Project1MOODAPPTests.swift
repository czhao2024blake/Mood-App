//
//  Project1MOODAPPTests.swift
//  Project1MOODAPPTests
//
//  Created by Christopher Zhao24 on 2/23/24.
//

import XCTest
@testable import Project1MOODAPP

final class Project1MOODAPPTests: XCTestCase {
    
    func testTokenizePhraseCorrectTokenNumber(){
        //  1.  Given a String, return the right number of tokens for that String.
        //given
        let analyzer = StringAnalysis()
        
        
        //when
        let tokens = analyzer.tokenizePhrase("Hello World")
        
        //Then
        XCTAssertEqual(tokens.count, 2)
    }
        // 2. Given a String with some capitalized words, ensure the corresponding token elements are lower case.
        func testTokenizePhraseLowercase(){
            //given
            let analyzer = StringAnalysis()
            //when
            let tokens = analyzer.tokenizePhrase("Hello World")
            
            //Then
            XCTAssertEqual(tokens, ["hello", "world"])
        }
        // 3. Given a String with varying amounts of whitespace between words, ensure all whitespace is removed from the tokenized phrase.
        func testTokenizePhraseSpaces(){
            //given
            let analyzer = StringAnalysis()
            //when
            let tokens = analyzer.tokenizePhrase("Hello        World  hello")
            
            //Then
            XCTAssertEqual(tokens, ["hello", "world", "hello"])
        }
        // 4. Handle sentences with punctuation
        func testTokenizePhrasePuncuation(){
            //given
            let analyzer = StringAnalysis()
            
            //when
           let tokens = analyzer.tokenizePhrase("Hello, World! hello")
            
            //Then
            XCTAssertEqual(tokens, ["hello", "world", "hello"])
        }
        // 5.  Given a String that is all one word, verify you get back precisely one token
        func testTokenizePhraseWordChunk(){
            //given
            let analyzer = StringAnalysis()
            
            //when
           let tokens = analyzer.tokenizePhrase("HelloWorldhello")
            
            //Then
            XCTAssertEqual(tokens.count, 1)
        }
        // 6.  Handle an empty String elegantly
        func testTokenizePhraseEmptyString(){
            //given
            let analyzer = StringAnalysis()
            //when
            let tokens = analyzer.tokenizePhrase("")
            
            //Then
            XCTAssertEqual(tokens, [""])
        }
        /*
         
         COUNT OCCURENCES
         
         */
    func testCountOccurencesAppearsOnce(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.countOccurences(["one","two","three","four","one","two","three"], "four")
        
        //Then
        XCTAssertEqual(tokens, 1)
    }
         
            //given
    func testCountOccurencesAppearsMultipleTimes(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.countOccurences(["one","two","three","four","one","two","three"], "one")
        
        //Then
        XCTAssertEqual(tokens, 2)
    }
          
    func testCountOccurencesDoesNotAppear(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.countOccurences(["one","two","three","four","one","two","three"], "five")
        
        //Then
        XCTAssertEqual(tokens, 0)
    }

    func testCountOccurencesAppearsAsSubset(){
        //given
        let analyzer = StringAnalysis()
        //when
        let tokens = analyzer.countOccurences(["sand","sandwitch","witch"], "sand")
                
        //Then
        XCTAssertEqual(tokens, 1)
            }
    func testCountOccurencesEmptyParameter(){
        //given
        let analyzer = StringAnalysis()
        //when
        let tokens = analyzer.countOccurences(["sand","sandwitch","witch"], "")
                
        //Then
        XCTAssertEqual(tokens, -10)
            }

    
    /*
     
     AnalyzeTextKeywords
     
     */
        
        func testAnalyzeTextKeywordsNumberOfKeywords(){
            //given
            let analyzer = StringAnalysis()
            
            //when
            let tokens = analyzer.analyzeTextKeywords(["one","two","two","three","three","three","zero"], ["one", "two"])
            
            //Then
            XCTAssertEqual(tokens, [1,2])
        }
    func testAnalyzeTextKeywordsNoKeywordsInString(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.analyzeTextKeywords(["one","two","two","three","three","three","zero"], ["twelve"])
        
        //Then
        XCTAssertEqual(tokens, [0])
    }
    func testAnalyzeTextKeywordsNoLength(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.analyzeTextKeywords([], ["one", "two"])
        
        //Then
        XCTAssertEqual(tokens, [0])
    }
    
    
    func testAnalyzeTextKeywordsNoKeywordsGiven(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.analyzeTextKeywords(["one","two","two","three","three","three","zero"], [])
        
        //Then
        XCTAssertEqual(tokens, [])
    }
    /*
     
     COMPUTE TEXT WEIGHTS
     
     */
        func testComputeTextWeightTextWeightComputation(){
            //given
            let analyzer = StringAnalysis()
            
            //when
            let tokens = analyzer.computeTextWeight([1,2,0,], [1,2,0])
            
            //Then
            XCTAssertEqual(tokens, 5)
        }
    
        func testComputeTextWeightTextWeightEmptyArrays(){
            //given
            let analyzer = StringAnalysis()
            
            //when
            let tokens = analyzer.computeTextWeight([], [])
            
            //Then
            XCTAssertEqual(tokens, 0)
        }
    func testComputeTextWeightTextWeightArrayLengthMismatch(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.computeTextWeight([1,2,0,1], [1,2,0])
        
        //Then
        XCTAssertEqual(tokens, -10)
    }

    
    //categorize
    func testStronglyNegative(){
        
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.categorizeValue(-99)
        
        //Then
        XCTAssertEqual(tokens, "Strongly Negative")
        
        
    }
    func testNegative(){
        
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.categorizeValue(-10)
        
        //Then
        XCTAssertEqual(tokens, "Negative")
        
        
        
        
    }
    func testNeutral(){
        
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.categorizeValue(0)
        
        //Then
        XCTAssertEqual(tokens, "Neutral")
        
        
        
        
    }
    func testPositive(){
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.categorizeValue(10)
        
        //Then
        XCTAssertEqual(tokens, "Positive")
        
        
        
    }
    func testStronglyPositive(){
        
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.doEverything(inputText: "alert")
        //Then
        XCTAssertEqual(tokens, "Positive")
        
        
        
        
    }
    
    func testEverything(){
        
        //given
        let analyzer = StringAnalysis()
        
        //when
        let tokens = analyzer.doEverything(inputText: "alert")
        
        //Then
        XCTAssertEqual(tokens, "Positive")
        
        
        
        
    }

    
    
    }



