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
- ✅ nearest neighbors in terms of years
    - ✅ use dicitonary?
    - ✅ save all compatibilities to dictionary as keys
    - ✅ calculate animal distances[^1]
        - ✅ Δ(Dragon, Rat) = [4, -8] 
        - ✅ Δ(Rat, Dragon) = [-4, 8]
        - ✅ Δ(Rat, Rat) = [-12, 0, 12]
        - ✅ Δ(Pig, Rat) = [11, -1]
        - ✅ Δ(Rat, Pig) = [1, -11]
    - ✅ save distances to nearest neighbors dictionary
        - ✅ Dragon1976 has 2 Rat neighbors: 4 years older and 8 years younger
        - ✅ Dragon1976 has 2 Rooster neighbors: 7 years older and 5 years younger
        - ✅ Dragon1976 has 2 Monkey neighbors: 8 years older and 4 years younger
        - ✅ Pig1976 Carlos Santana's neighbors are 
            - Rabbit: 8 years older, 4 years younger
            - Tiger: 9 years older, 3 years younger
            - Goat: 4 years older, 8 years younger
        - ✅ Goat1955 Steve Jobs's neighbors are
            - Goat: -12, 0, 12
            - Rabbit: 4, -8
            - Horse: 1, -11
            - Pig: 8, -4
        - ✅ Horse1930 Warren Buffett's neighbors are
            - Tiger: -8, 4
            - Goat: -1, 11
            - Dog: -4, 8
        - ✅ Rooster1933 Yoko Ono's neighbors are
            - Ox: -4, 8 
            - Dragon: -7, 5
            - Snake: 4, -8
- 🔥 Show ages of every nearest neighbor
    - Can we not depend on Foundation in ChineseCompatibilitiesWithAges?
    - What happens when age is fuzzy? Today is near Chinese new year?


[^1]: Should years *older* be denoted as positive or negative? Why positive: calculating the distance is simple subtraction of the years of birth. `Goat 1991 - Tiger 1986 = 5; Goat 1991 - Tiger 1998 = -7`. Why negative: simply add the distance value to the base year. `Goat 1991 + -5 = Tiger 1986; Goat 1991 + 7 = Tiger 1998`. Why positive: IMO someone who is 2 years older than me is seen coloquially to be a positive number. I simply add 2 to my age to get their age. Conversely, for someone 2 years younger than me, I would subtract 2 years from my age (in essence, this would be a negative number). 
