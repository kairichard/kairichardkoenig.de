---
title: How nature might cut the monolith?
date: 2020-03-11T19:30:08+10:00
draft: false
weight: 2
keywords: 
    - tech
summary: Inspired by nature let's look at what strategy we could derive to cut down a monolith
---

Strange question, I know. Would it be good or bad? Would you deploy something you know will break at some point? Car manufacturers [certainly do](https://www.hotcars.com/10-car-manufacturers-with-highest-recall-rate-and-8-with-lowest/), and other industries are doing it too. Are you releasing software that will break? I know you don't mean to, but that is why you have monitoring and failover systems set up in the first place.

Now that we established that almost every software engineer is guilty of deploying broken software at some point, we can move on and think about how we can turn that into something useful. 

An important addition: If lives are at stake, please do everything you can to avoid deploying software you know might break, looking at you Boeing. 

#### Executable knowledge

Shipping bugs to production cannot be a good thing, or can it?  How can we increase the value of applications? And how might intentionally breaking things help?

Code in the broadest sense is executable knowledge. It has embedded assumptions about the world in a form that is translatable into machine instructions.  That makes it somewhat similar to math. In math, our brains run the instructions. The formulas and solutions are embeddings of our knowledge of the observable universe.

Math also evolves, or more so, our understanding of the world evolves and then finds it's way back into math. But sometimes the opposite is also true where math informs us of new ways to think about the world.

A trivial assumption could thus be that indeed, value creation has a lot to do with forming a better understanding of the world around us.

Our understanding of the world is primarily gained by probing and observing. This means whatever we study needs to have an observable outcome that functions as input to a new hypothesis - this, on a very basic level, describes the scientific method.

#### Fitness for Software?

However, in software, if we randomly delete or change instructions in source code, the only outcome we get is whether it builds or not. Not so meaningful. What is missing here is the educated guess every good scientist takes before probing the world with an experiment she created.

Let us leave the scientific method aside for a brief moment and look at nature. Nature gets a few things right when it comes to evolution.
When we transfer the dynamics of code, knowledge, and value to lifelike dynamics, we might find something more useful to perform than manipulating AST-Nodes and waiting for it to build.

In this setting, code and knowledge can be translated as DNA. Value and destruction as life and death. The dynamics of survival are key in this thought experiment. Software is only ever useful when it is used, right? And the good thing is that we already have a concept for this: -> dead code. Yet, dead code, in most languages and tools, is only found during compile/parse time, not during run time.  Our survival function must take in the actual used and unused parts of the code* to determine the survival, not just a static analysis.

Suppose now we know what parts of the code are used. That is our educated guess we needed from above.

#### Delete code for a better software?

Do you now remove a class that was only used once in 14 days, or do you keep it around? What would nature do? What would we gain if it were gone? Code that is rarely used could still provide a lot of value, for instance, a monthly expense report that only needs to run once - but is part of a large codebase.

The value of deleting code is a leaner, more fit for purpose codebase.  The good part about this is deleting code based on usage can be automated.

#### But what about the deleted part?

Back to nature, we manipulate the code e.g., DNA, through our understanding of value, which in this case,  is whether the code is used or not.

To recap, you need to understand the value creation of your software and how that is made up to be able to augment evolving it through automation.

Several strategies can help with finding parts of the code that are not participating in value creation. The only one that makes sense, in my opinion, is to use lines covered during a more extended period of execution in production.

Gather metrics on the actual usage and cut the most unused parts and make them into their own projects applying the same principle again. Rinse and repeat.
This is basically how to cut down a monolith. A little inspired by nature.

Let me know what you think at [@kai_richard](https://twitter.com/kai_richard)