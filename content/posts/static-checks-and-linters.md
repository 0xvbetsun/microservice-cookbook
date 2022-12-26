+++
title = "Static Checks And Linters"
date = "2022-12-22T22:15:37+02:00"
author = "vbetsun"
cover = "images/linter.png"
tags = ["technic", "linter", "static"]
keywords = ["linter", "static"]
description = "How to run linters and statically check the project?"
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
+++

## Golang CI lint

**Enabled by Default**
 - errcheck
 - gosimple 
 - govet 
 - ineffassign 
 - staticcheck 
 - typecheck 
 - unused
 
 I'm personally prefer `uber` linter or my own, a little bit extended version

This is `uber`'s one:
 ```yaml
 # .golangci.yml
run:
  timeout: 5m
  modules-download-mode: readonly

linters:
  enable:
    - errcheck
    - goimports
    - golint
    - govet
    - staticcheck

issues:
  exclude-use-default: false
  max-issues-per-linter: 0
  max-same-issues: 0
```

and the following configuration is mine preferable
```yaml
# .golangci.yml
run:
  timeout: 5m
  modules-download-mode: readonly
  
linters:
  enable:
    # bugs
    - contextcheck
    - errorlint
    - exportloopref
    - gosec
    # complexity
    - cyclop
    - funlen
    # style
    - dupl
    - revive
    - unconvert
    - promlinter
    # format
    - gci
    - gofumpt
    # test
    - paralleltest
    - tenv
    # performance
    - prealloc

issues:
  exclude-use-default: false
  max-issues-per-linter: 0
  max-same-issues: 0
```
And run it with:

```bash
golangci-lint run ./...
```

For some performance improvements I'd recommend using **fieldalignment**

Which you can install with next command:s

```bash
go install golang.org/x/tools/go/analysis/passes/fieldalignment/cmd/fieldalignment@latest
```

And after that use this linter:

```bash
fieldalignment ./...
```