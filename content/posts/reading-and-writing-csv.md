+++
title = "Reading and Writing CSV files"
date = "2022-12-22T00:02:18+02:00"
author = "vbetsun"
cover = "images/csv-processing.svg"
tags = ["technic", "csv"]
keywords = ["csv", "read", "write"]
description = "How to read and write CSV files?"
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
+++

**CSV (Comma Separated Values)** is a very popular import and export data format used in spreadsheets and databases. 
Each line in a CSV file is a data record. Each record consists of one or more fields, separated by commas. 
While CSV is a very simple data format, there can be many differences, such as different delimiters, new lines, or quoting characters.


Four our next examples we're going to use the next dataset:

| #id  | name   | age | breed            |
|------|--------|-----|------------------|
| 1    | Mik    | 3   | Chartreux        |
| 2    | Gabby  | 3   | Bombay           |
| ...  | ...    | ... | ...              |
| 5000 | Shizik | 17  | Norwegian Forest |

> I'd strongly recommend using `#` character for specifying table header as commented line


## Read CSV

### Read Line-By-Line

```go
package main

import (
	"encoding/csv"
	"errors"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
	f, err := os.Open("cats.csv")

	if err != nil {
		log.Fatal(err)
	}

	r := csv.NewReader(f)
	r.Comment = '#'
    r.FieldsPerRecord = 4
	r.ReuseRecord = true

	for {
		row, err := r.Read()

        if errors.Is(err, io.EOF) {
			break
		}
		if err != nil {
			log.Fatal(err)
		}

		fmt.Println(row)
	}
}
```

### Read All

```go
package main

import (
	"encoding/csv"
	"errors"
	"fmt"
	"io"
	"log"
	"os"
)

func main() {
	f, err := os.Open("cats.csv")

	if err != nil {
		log.Fatal(err)
	}

	r := csv.NewReader(f)
	r.Comment = '#'
    r.FieldsPerRecord = 4
	r.ReuseRecord = true

	rows, err := r.ReadAll()
	if err != nil {
		log.Fatal(err)
	}
	for _, row := range rows {
		fmt.Println(row)
	}
}
```

```bash
go test -bench=. -benchmem

BenchmarkRead-4             1444            723509 ns/op          111240 B/op       5014 allocs/op
BenchmarkReadAll-4           890           1257324 ns/op          861174 B/op      10028 allocs/op
```