func isPalindrome(word: String) -> Bool { 
    if (word.count <= 1) { 
        return true 
         
    } 
    else { 
        let first = word.first! 
        let last = word.last! 
        if first != last { 
            return false 
        } 
        else { 
            let start = word.index(after: word.startIndex) 
            let end = word.index(before: word.endIndex) 
            let substring = word[start..<end] 
            return isPalindrome(word: String(substring)) 
        } 
    } 
} 
 
let word = "racecar" 
if isPalindrome(word: word) { 
    print("YES") 
} 
else { 
    print("NO") 
}