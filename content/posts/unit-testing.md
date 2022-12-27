+++
title = "Unit Testing"
date = "2022-12-22T00:15:37+02:00"
author = "vbetsun"
cover = "images/unit-testing.png"
tags = ["technic", "unit", "mocks", "coverage", "tests"]
keywords = ["unit", "mocks", "coverage", "tests"]
description = "How to write and run unit tests?"
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
+++

### Benchmarks

```go
package main

import (
    "testing"
)

func BenchmarkPrimeNumbers(b *testing.B) {
    num := 1000
    for i := 0; i < b.N; i++ {
        primeNumbers(num)
    }
}
```

And run it with

```bash
go test -bench=. -benchmem
```