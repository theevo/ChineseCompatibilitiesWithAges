#  Discovery Tree

## 🔥 ChineseCompatibilitiesWithAges
- ✅ Input birthday, output Animal
- ✅ Input birthday, output age
- ✅ AgeCalculator
    - ✅ Testing ages against Date() works today, but won’t work next year!
        - ✅ pass parameter that sets "today" date
    - ✅ test error invalidBirthdayInputString
    - ✅ add error for failed `dateComponents.year`
    - ✅ edge cases
        - ✅ age 0
        - ✅ age 1
        - ✅ negative age
- ✅ Lists compatibilities 
- ✅ Localize animal names
    - ✅ map to SexagenaryCycle1924
    - ✅ map to ChineseZodiacCompatibility
        - ✅ move extensions to their own file
- 🔥 nearest neighbors in terms of years
    - ✅ use dicitonary?
    - ✅ save all compatibilities to dictionary as keys
    - 🔥 calculate animal distances[^1]
        - ✅ Δ(Dragon, Rat) = [4, -8] 
        - ✅ Δ(Rat, Dragon) = [-4, 8]
        - ✅ Δ(Rat, Rat) = [-12, 0, 12]
        - 🔥 Δ(Pig, Rat) = [11, -1]


[^1]: Should years *older* be denoted as positive or negative? Why positive: calculating the distance is simple subtraction of the years of birth. `Goat 1991 - Tiger 1986 = 5; Goat 1991 - Tiger 1998 = -7`. Why negative: simply add the distance value to the base year. `Goat 1991 + -5 = Tiger 1986; Goat 1991 + 7 = Tiger 1998`. Why positive: IMO someone who is 2 years older than me is seen coloquially to be a positive number. I simply add 2 to my age to get their age. Conversely, for someone 2 years younger than me, I would subtract 2 years from my age (in essence, this would be a negative number). 
