let word = "newprogramminglanguages"
var isPalindrome = true

for i in 0..<word.count/2 {
    let start = word.index(word.startIndex, offsetBy: i)
    let end = word.index(word.endIndex, offsetBy: -i-1)
    if word[start] != word[end] {
        isPalindrome = false
        break
    }
}

if isPalindrome {
    print("YES")
} else {
    print("NO")
}
