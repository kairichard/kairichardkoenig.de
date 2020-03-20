---
title: You don't need tests
date: 2019-02-11T19:30:08+10:00
draft: false
weight: 4
keywords: 
    - tech
summary: Tests, yes tests, tests make you slow; they give you a false sense of confidence. You should determine the health of the system in other ways than solely relying on tests.  
---
Tests, yes tests, tests make you slow; they give you a false sense of confidence. You should determine the health of the system in other ways than solely relying on tests.

#### Test assumptions - but not too soon

Tests are a way of fortifying assumptions about the world. Assumptions you found through careful probing and understanding requirements and context.

Prototypes and MVPs, for instance, don't need many tests because they haven't yet found assumptions about the world that prove to be valid. Tests slow you down eventually, so only start adding them when a product enters a phase where your assumptions are correct, and you want to make sure not to destroy them accidentally.

When entering a maturity stage of a product, some companies end up having tons of tests about every aspect, which in the end, slows them down too much - among other things of course. A truckload of tests also renders software resistant to fast and chaotic change. So in a maturing phase, you should build back those tests to gain more flexibility.  Allowing assumptions to be changed quickly and rapidly is crucial for products that need to evolve further or undergo dramatic change.

#### What to test and what not to test

First, don't test what you don't own.
For example, testing that UUIDs can be generated from that 3rd party library, you just installed is just nuts. And stop testing if a field gets correctly mapped between the database and your application when you use an ORM.

What you should test is the central promise, your primary assumption about what brings value to your customers. And it is crucial to understand what your customers actually define as value.

#### Stop using coverage; it is meaningless

Well, it means the lines visited during a test run, so it is not meaningless. But in the context of having an impact on your primary goal, revenue, users, interactions, coverage does not tell you anything. It's a vanity metric. What is more, impactful is to show visited lines during production, because that starts to bear some meaning. It shows for examples which parts of your application are heavily relied up on, which could mean that is where most of the value comes from. But using (production) coverage does not exempt you from talk to your power-users.

#### Examples

Take Facebook, for example. Their main goal is creating relevant ad space to sell to advertisers. How do they do that? By attracting and keeping users engaged to the platform for as long as possible. And now it's your exercise to figure out where they probably have the most tests.

Take the application we are building at [Bitspark](https://bitspark.de/). It's a microservice architecture around a [VPL-Runtime](https://github.com/Bitspark/slang). The central piece of software that we [build](https://github.com/Bitspark/telstar) to enable all services to talk to each other has extensive [tests](https://github.com/Bitspark/telstar/blob/master/test_telstar.py) and even a [simulation](https://github.com/Bitspark/telstar/blob/master/telstar/tests/test_telstar.sh) to guarantee properties we want.
The VPL-Runtime has a few [tests](https://github.com/Bitspark/slang/tree/master/tests), but the services don't except for some parts of the authentication and parts of how we deploy user instances.  
The frontend, naah. Why? Because we don't know yet what brings the most value and we need a high degree of flexibility.

Want to skip tests altogether may be the [shift to the right](https://www.getxray.app/blog/shift-left-and-shift-right-testing-strategies/) is for you.
But that requires large amounts of interaction with your system. I would read it anyway because it might give you a new perspective on testing.

In essence:

- test only parts of the code that are essential to value creation
- choose wisely where to use tests and for what purpose (seniority is key here)
- don't use coverage as metric for anything
- remove non-primary goal-related tests to regain lost flexibility of a mature product

I encourage you to delete some tests today! And tell me how it felt.