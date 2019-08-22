---
title: 'Principles'
date: 2019-02-11T19:30:08+10:00
draft: false
weight: 4
summary: This document helps Kai steer his decisions on a daily basis and with being consistent with what to strive for.
---

---

> This document adapted version of what was originally conceived while working at [Paessler AG](https://paessler.com) as an Engineering manager in 2016. It's the result of collaboration with [Pascal Fleck](https://paessler.com) and inspiration from [Nanobox](https://content.nanobox.io/the-developer-manifesto/).

---

This document helps me steer my decisions on a daily basis and with being consistent with what to strive for.

#### Instead of doing the easy thing do the right thing

Easy is what bites you later, "easy" can become technical debt, inconsistency or faulty software and processes. Do what is right for the right reasons and focus on [high leverage](https://gist.github.com/rondy/af1dee1d28c02e9a225ae55da2674a6f) and not just easy wins.

#### Humans are more important then code

The only true asset a software company has are it's employees.
If you have to decide between completing features X, attending meeting Y or helping your colleague choose the human.

#### Our Surroundings will change

Don't assume that system X is going to be there for the next months or seconds (network).
Build your solution an a away so that almost no assumptions are made. Whether system X becomes Y or disappears entirely should not matter. Create a landscape where changing integrations/implementations and processes becomes easy.

#### Divide and conquer

Big, hard problems become easy if you cut them into small pieces.
If a problems seems hard, think about how you can cut it into two smaller, easier problems. If one of those problems is still too hard, cut it in half again. If it's still hard, cut scope.

#### Throw things away

It's not the code/app/product/feature that is valuable, it's the understanding you've gained from building it.
Never be afraid to throw something away and do it again, it will almost always be faster to build and much better the second (or third, or Nth) time around.

#### Redundancy and duplication

Redundancy sucks. But dependencies are worse.
The only reasonable thing to depend on is a full-fledged, real module, not an amorphous bunch of code.
You can usually look at a problem and guess quite well if its solution has good chances to become a real module, with a real owner, with a stable interface making all its users happy enough.
Redundancy is bad, but dependencies can actually paralyze you – kill dependencies first.

#### Small sharp tools

Composability. Simple tools which do one thing well and can be composed with other tools to create a nearly infinite number of results. For example, the unix methodology e.g. stdin/stdout and pipes. Small is beautiful. This isn't just tools, it's also teams.

#### Signal vs. noise

Every message and notification should be actionable.
Avoid stealing your and the time of colleagues by reducing the number of senseless emails and notifications.

#### Decision-making via ownership, not consensus or authority

Every CI-Pipeline, web page, blog post, machine or service should have a single owner.
Many people may collaborate on it, but the owner makes the final call on what happens with the owned thing.
If something doesn't have an owner, no one should be working on it or trying to make decisions about it. Before those things can happen, it has to be owned.
If an item gets dropped for some reason (for example, the current owner switching teams or leaving the company), it's fair game for anyone else to pick up.
Apple's term for an owner is directly responsible individual. 

#### Do-ocracy / intrapreneurship

Ask forgiveness, not permission. Build strong people networks and build software that works.

#### Everything is an experiment

Anything we do - an app, a feature, a standing meeting, a blog post - is always subject to change. That includes discontinuing or shutting down whatever the thing is.

#### Do less

Do we really need that feature? Can we delete that code? Do we really need that command?

#### Consistency matters

Consistency is key to write maintainable software systems.
Create reusable and consistent patterns. Your brain is the greatest pattern matching machine there is.

#### Abstractions

If you don’t know whether or not a component will change, your software will be best if you assume it will not change. Thus saving the need to invent an abstraction.

#### Interfaces matter

Everything has an interface. A platform has an API. A computer has a keyboard, a mouse, and a GUI operating system. Code has readers. Teams have interfaces too. Try to delight users with consistency and thought out interfaces.
The two critical components of a good interface are that it be narrow and well-defined.

#### Names matter

Think careful about how something is named. Pick exactly one name for each concept the user needs to track, and use it consistently. For example, don't talk about "reuse_order" in the code and name the button that does exactly that "edit order". Use the names the domain expert uses for something.

#### Maniacal focus on simplicity

There is no step 1.

#### Write well

Good writing is a powerful tool for communication. Clear writing is clear thinking. Avoid commit or merge messages like "Fixed a broken thing" - [Dilbert on writing](https://dilbertblog.typepad.com/the_dilbert_blog/2007/06/the_day_you_bec.html)

#### Competitive Advantage

Focus on building an advantage in your core business. With everything you do you need to able to state where and why an initiative gives you an advantage.

#### Goals, Impact and Accountability

Write down what you want to achieve by when and share it with your peers. Measure and quantify the impact you plan to have. Assign clear responsibilities, emergent responsibilities are nice but they won't carry you through rough seas.

#### Criticism

Constructive criticism is the best kind. Avoid keeping quiet with your criticism about someone or something for the sake of politeness. Don't say something about someone to a third party that you wouldn't say to their face.
