---
title: 'telstar - Producers and consumers for redis streams'
date: 2019-02-11T19:27:37+10:00
draft: false
links:
    - url: https://github.com/Bitspark/telstar/
      icon: fab fa-github
      text: Source
      color: dark
year: 2019
---

#### telstar - producers and consumers for redis streams



This library is what came out of creating a distributed service architecture for one of our products. Telstar makes it easy to write consumer groups and producers against redis streams.
In order to run our distributed architecture at [@bitspark](https://bitspark.de) we needed a way to receive and produces messages with an exactly once delivery design. We think that, by packing up our assumptions into a separate library we can make it easy for other services to adhere to our initial design and/or comply to future changes.
