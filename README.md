#SwiftChameleon
Package with usefull extensions


#Swift 

##Bool
###setTrue & setFalse
```
var value: Bool = false
value.setTrue() // value is true
value.setFalse() // value is false
```

##Double
###Nice String
```
var value: Double = 12.12345
value.string(2) // return Double String with given decimal places
value.currencyString(2) // return Double String with given decimal places & local currency
```

###Numbers
```
var value: Double = 12.123142
value.roundedTo(2) // return rounded Double with decimal places
value.roundedInt // return rounded Double as Int
value.int // return not rounded Double as Int
value.float // return float value
```

#SwiftUI
##Button
You can make every view to a Button or loading Button
```
Image(systenName: "pen")
    .button(<#T##role: ButtonRole?##ButtonRole?#>, action: <#T##() -> Void#>)
        
        
Image(systemName: "pen")
    .loadingButton(<#T##role: ButtonRole?##ButtonRole?#>, isLoading: <#T##Binding<Bool>#>, action: <#T##() -> Void#>)
        
```
