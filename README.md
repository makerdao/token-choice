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

`deadline: The chooser gets until this point to decide (roles reverse afterwards)
