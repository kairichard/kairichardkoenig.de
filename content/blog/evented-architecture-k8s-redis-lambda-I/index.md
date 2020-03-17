---
title: Building an evented architecture with Kubernetes, Redis-Stream and Lambda - Part 1
date: 2020-01-11T19:30:08+10:00
draft: true
weight: 4
summary: Microservice and event-driven architectures are sometimes hard to get started with. This mini series will get you off the ground.
---

Glad you are here, we at [Bitspark](https://bitspark.de) built an app that allows you to create a program visually and deploy it. 
And this blog post describes how the backend of that app works together. And you guessed correctly it has something to do with Redis, Kubernetes and (AWS) Lambda.

### Is this for me?

Since you already clicked on the link I assume you have heard of one of technologies mentioned in the headline.
This series is for you if you want to build a event driven architecure but don't want to use Kafka or want to learn about an application of Redis-Streams.
However this series does not describe how to migrate to an event based architecture, meaning if you run a monolith in production and want to cut into pieces this is not for you, although it might inspire some thinking. Mind you, what I describe here is not the perfect setup or architecture - it's just the one we used and it turned out quite well but of course also has it's drawbacks. But we will get to that eventually.

### What is Event-Driven Microservice Architecture?

In event-driven architecture, when a service performs some piece of work that other services might be interested in, that service produces an event — a record of the **performed** action. An emphasis here is on the past tense, events must always described something that has already happened. Other services consume those events so that they can perform any of their own tasks needed as a result of the event.

### Requirements and assumptions

As with every architecure they are built *for* specific requirements *on* general assumptions.
- exactly once delivery
- deduplication
- no work lost
- scalable
- replaying
- eventual consistent
- cheap
- complete decoupling
- database per service

### Getting ready

### How to structure the Service

### Deploying your first service

### Publishing events

### Enter Redis Streams

### End of Part I