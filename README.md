token-choice
---

`how`: Contract state:

```
    // HOW state:
    // 0: init
    // 1: sign
    // 2: pick bleg
    // 3: pick rube
    // 4: save bleg
    // 5: save rube
```


`bleg`: Token A

`lbs`: How much of token A

`rube`: Token B

`kgs` How much of token B

`creator`: The address offering the choice

`chooser`: The address that gets to choose

`pick`: The chooser can pick `lbs` of `bleg` or `kgs` of `rube` any time between `open` and `shut` (creator gets the other)

`save`: The creator can save `lbs` of `bleg` or `kgs` of `rube` any time after `shut` (chooser gets the other)

`open`: The first time the chooser can make a choice

`shut`: The first time the creator can make a choice (chooser has expired)
