+++
title = "Choose A Good Structure"
date = "2022-12-21T19:54:52+02:00"
author = "vbetsun"
cover = ""
tags = ["project", "structure"]
keywords = ["flat", "mvc", "ddd"]
description = "How to choose a correct structure for the project?"
showFullContent = false
readingTime = true
hideComments = false
color = "" #color from the theme settings
+++

## Flat Structure

This type of structure gives you a lot of flexibility without an overhead.

```sh
app
├── core.go
├── db.go
├── main.go
└── server.go
```

Also you can use `cmd` folder for storing several entry-points for the app (eg. for api and cli).
The structure should be like follows:

```sh
app
├── cmd
│   ├── api
│   │   └── main.go
│   └── cli
│       └── main.go
├── core.go
├── db.go
└── server.go
```

## MVC Structure

**Model–view–controller (MVC)** is a software architectural pattern commonly used for developing user interfaces that divide the related program logic into three interconnected elements.
This is done to separate internal representations of information from the ways information is presented to and accepted from the user

#### Views

The main responsibility of views is **rendering/serialization** of data.
In a traditional way, views render output as `html`, but for modern applications it also ok to serialize output in `json` or `xml`.

#### Controllers

Controllers in MVC are responsible for routing functionality and aggregation of data.
They won’t be directly responsible for db queries or rendering data.

#### Models

Models are responsible for interacting with application data.
It typically means that models interact with database, validate incoming and serialize outgoing data, communicate with 3-rd party services.

```sh
app
├── http
│   ├── handler.go
│   └── http.go
├── json
│   ├── json.go
│   └── user.go
├── psql
│   ├── psql.go
│   └── user.go
└── main.go
```

## DDD Structure

**Domain-driven design (DDD)** is a major software design approach, focusing on modeling software to match a domain according to input from that domain's experts.

Domain-driven design is predicated on the following goals:

- placing the project's primary focus on the core domain and domain logic;
- basing complex designs on a model of the domain;
- initiating a creative collaboration between technical and domain experts to iteratively refine a conceptual model that addresses particular domain problems.

```sh
app
├── core
│   ├── user.go
│   └── card.go
├── service
│   ├── auth
│   │   └── auth.go
│   ├── payment
│   │   └── payment.go
│   └── user
│       └── user.go
├── storage
│   ├── psql
│   │   └── psql.go
│   └── file
│       └── file.go
├── transport
│   ├── http
│   │   ├── handler.go
│   │   └── http.go
│   └── ws
│       ├── handler.go
│       └── ws.go
└── main.go
```
> In general, communication in DDD looks like:
> 
> `request` <--> `transport` <--> `service` <--> `storage / other service` <--> `core`

