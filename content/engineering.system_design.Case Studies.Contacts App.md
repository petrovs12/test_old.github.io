---
created: 2024-12-07T12:11
updated: 2024-12-07T12:13
---
```markdown
---
id: 4qpfhbntquym64jjo4n9q0a
title: Contacts App
desc: ''
updated: 1733569983190
created: 1733569865159
---

# Contacts App

## Setup

The way I usually introduce this question to candidates is by referencing the ‘contacts’ section in Gmail. I say, ‘Let’s imagine there is a web service which populates that contacts view. We’re going to make a mobile addressbook that shows those contacts. Just as they are in Gmail, we’d like to order the contacts by last active time and show a green dot if they are currently active’

I then move to drawing a wireframe. In person, I’d draw on a white board. In a phone setting, I’d do either: an Excalidraw sketch: Copy this text into an .excalidraw file and load it, or an ASCII art you can paste into coderpad: P132492932

## Common questions from candidates after problem setup

Candidates frequently ask a few of the following questions. I don’t usually seek to provide this information unless the candidate requests it, since I think most candidates (especially more senior E4s and up), will determine this on their own.

### Q: How many contacts?

A: Generally, I direct candidates to determine this based on their own expectations, since I think it gives some signal on product sense. The most common range is 300-5000 (a few candidates know that 5k is the max number of FB friends someone can have). If someone wants to do more than this, I steer them away, since it makes the problem a bit of a different question.

### Q: How often do the presence values need to be updated?

A: This is another question I direct candidates to determine this on their own. I ask something like ‘How would the user experience be affected by different values here?’ Most reasonable candidates realize that if they pick some over 1-2 minutes, the user experience will suffer (I’ll call someone who I think is offline when they are actually around).

### Q: Do I need to cache?

A: This is another question I direct candidates to determine this on their own. I consider it a red flag if the candidate thinks about this and concludes that they don't need caching. Even more so than a photo's feed app, it’s extremely important for a contact app to use disk storage -- both in terms of user experience and data usage. More on that later. In short, though, I usually don’t let them avoid this problem. It is usually enough to say something simple like ‘It would be annoying to be on a poor network and not be able to find the phone number for one of my contacts’.

### Q: I've seen this question on Glassdoor

A: This is an unfortunate situation. We know that some of our design (pirate) questions are on Glassdoor. What to do here is really up to you as interviewer, if you have another design (pirate) question that you are calibrated on and hasn't been asked of this candidate already, then go for that. It's also not a huge deal to go forward with this question -- the words 'Contacts App' are on Glassdoor (as are the words Photo viewer), however there is no real discussion of how to answer the question. Just make sure that you note it in your feedback, and having seen a design question is very different from having been asked a Design (Pirate), so if the candidate has already been asked this question, definitely do not ask it again.

## Interviewer Resources

### Detailed walk through

If you’re new to this question, it’s recommended that you read up on the details here.

### Discussions

The interviewer’s primary goal in each interview is to gather adequate signal across the focus areas. Typically, this signal is acquired through discussions of different aspects of the problem. Discussions for this question are below, and are organized into “Core” (typically covered), “Deep dive” (E5+), and “Optional” (infrequently covered). Additionally, the discussions are tagged with the focus areas they are most strongly associated with.

#### Core Discussions

##### Architecture (Solution Design / Mobile Domain Expertise)

Apps should generally have a good level of encapsulation. Ideally, candidates will drive the conversation to define these components but if not, a good way to start:

###### Q: What happens after applicationDidFinishLaunchingWithOptions: ?

This should hopefully push the candidate to define how the components are created and wired up. When the app delegate creates the view controller, how does the view controller get access to other components (like a networking class?). Is it injected in or is it a singleton?

To trigger a deeper conversation around architecture you can dig into the responsibility specific objects, how they are wired together, and how they communicate. For example:

###### Q: What object is responsible for this logic?

Useful when someone has given you a high level description of a strategy. For example, “When a contact shows up on screen, we’ll trigger a fetch of the contact profile picture”.

###### Q: Who owns object X? / How does object X get its dependencies?

This can be asked at any point after a subsystem is discussed. For example, when the candidate wraps up talking about their View Controller, asking which objects owns it and how that VC gets access to other objects in the system. This probes the candidate to consider how dependencies (such as managers / caches) are accessed. Singletons are fine for small apps but ideally dependencies should be injected into View Controllers for better encapsulation.

###### Q: What is the signature of method Y on X’s API?

Communication between a View Controller and a dependency (or anything that needs a response from a strong reference) often has callbacks (especially for asynchronous code). This question allows for a quick way to see how that communication will be designed. Delegation / blocks have tradeoffs (locally captured variables for blocks) are better encapsulated than NSNotifications.

##### Data Flow (Technical Excellence)

There should be a comprehensible flow of data in the app. Mentioning MVVM or VIPER is not enough detail. There should be a reasonable ‘mental stack trace’ from the network to the UI.

###### Q: Walk me through what happens when a network response comes in until the UI is updated.

This probes into where the state is held. How does the data source read it? Where is this state updated? (in what class does the business logic actually live) If a candidate is providing a hand wavy response, focus on the objects the data passes through. Is the block handled in the VC or some controller responsible for parsing / disk state / etc For an offline experience, this data should be stored to disk.

###### Array of View Models

###### Q: How are these created and managed?

###### Q: If storing on disk, how?

NSCoding / (NSURLCache the JSON)

###### Core Data

###### Q: How does the UI retrieve NSManagedObjects?

NSFetchedResultsController

###### VIPER / MVP

###### Q: How do the interactor and presenter manage entities?

###### Combine

###### Q: How are the publishers and subscribers implemented?

###### Q: How is the UI refreshed?

##### Server API (Solution Design / Technical Excellence)

The candidate should provide a way to get contacts on the client, with sufficient metadata to support UI requirements, such as presence information and downloading images.

###### Q: What does your payload look like?

Do they fetch all the information in order to be able to render the UI? Do they consider showing the presence information, downloading the photo, and details view?

###### Q: When do you fetch the information for the details page?

If the information isn’t explicitly fetched with the original fetch, you can ask this to see whether the candidate would prefer to fetch it on demand, or refactor the original fetch.

###### Q: How do you get the data to show images to user?

If an explicit way of fetching the image isn’t offered (and it’s not implicitly clear though, say, image_url and thumbnail_url), this should force the candidate to think and explain whether they want to download the metadata with the contact or whether it’s separately fetched.

##### UI (Mobile Domain Expertise)

The candidate should have an idea of how to render the contacts view and the detail view, and navigating between them.

###### Q: How do you show the contacts on screen?

There should be some sort of a brief explanation on how to do this, usually UITableView or UICollectionView.

###### Q: How do you populate images in the contacts view?

Putting images to a table view cell from network can be complicated, and can lead to interesting conversations between different options.

###### Q: What happens if I scroll really fast?

This can lead to a large number of network requests.

#### Deep Dive Discussions

##### Contact Syncing in Detail (Technical Excellence / Problem Exploration / Solution Design)

###### Getting the contacts on the client

###### Pagination

Pagination is usually not ideal for this problem, but some people go here on autopilot. If they do, they should have a valid reason why. It’s hard to suggest an E5 performance in this segment if they go with paging without a good reason and weighing alternatives. If they reject fetching all contacts on reasonable grounds (making them unlikely to re-visit that decision), the question gets tricky, because handling all edge cases with paging is near-impossible in a 45 min discussion. However, they should be able to have a sophisticated conversation about the edge cases.

Key understanding here is that volatile data/ranking changes the next page, and as such, paging is actually difficult to do.

###### Probing:

###### Q: What’s the size of a contact? How much data would the whole contact list be?

If the candidate seems unsure whether pagination is the way to go, you can use these types of questions to nudge them. The FB friend limit of 5k is a good number to gives candidates who are unsure how many contacts a given person might have. If they seem decided on pagination, however, don’t force them to fetch all the contacts.

###### Q: How do you fetch more contacts?

You can use this question to understand whether the candidate has understood the details behind regular pagination.

###### Q: What happens when I fetch the next page 10 minutes later?

Key understanding here is that 10 minutes later activity will have changed, and the usual pagination approaches won’t work here any more. Candidate should be able to derive these problems from the question.

###### Q: What happens when you kill the app and re-open?

Most likely you cannot rely on real-time updates forever. The candidate should have an idea when they should “start over”.

###### Fetching all at once

This is a solid approach, but candidates should be able to explain why this is acceptable. Expect reasonable estimates for how much data to download per contact. Can they contrast the pros/cons against paging?

###### Q: How much data will this fetch? Are you worried about it?

Even though it’s a good strategy to fetch all the contacts at first, it’s sometimes a good idea to probe whether the candidate thought that through, or just happened to suggest loading all of them. Some candidates change their minds without strong reasons why. Good answers include analysis on the payload size which is then used as a defense of the approach.

###### Q: What if I get a new contact?

This should trigger a conversation around insertions, updates and deletions. There’s not always time to cover this fully, but the candidate should understand this is an important consideration if we fetch all contacts, and have an idea how they would approach this.

###### Volatile data

There should be a good way to sync the ranking changes. Options include:

###### Socket for activity data changes

###### Q: What data does back and forth over the socket?

Sending all the updates over the socket can be tricky (and even more so with push notifications). The candidate should be able to discuss how that gets handled. One way is to use the socket as a ping to call regular APIs.

###### Q: What happens when you background or kill the app and reopen?

The candidate should be able to describe how the socket gets opened and closed (backgrounding etc.), and how to get back to updated state when opening the application.

###### Push notifications

###### Q: What if a notification doesn’t get delivered?

###### Q: What if the user doesn’t give us notification permissions?

###### Q: Would we send notifications even when the user isn’t using the app?

###### Polling

###### Q: What would happen if a friend comes online?

If the candidate is doing polling with long polling interval, this should trigger a conversation of how long they might need to wait for the UI to update the presence status.

###### Q: Are you worried about the network use?

If polling is too heavy, on the other hand, here’s one way to get the candidate talking about it.

###### Data storage - how does the volatile data get stored, and how does it flow to the UI?

###### Q: Will contact data get updated every time user comes online?

This should trigger conversations whether volatile data needs to be stored separately from the rest of the contact metadata.

###### Q: What are the steps that need to happen for UI to update when a friend comes online?

Triggering conversations around data source abstractions, and announcements to UI.

##### Image Subsystem (Technical Excellence / Mobile Domain Expertise)

This is another way for candidate to show depth. This can be an interesting area to dive deeper into if the candidate is struggling to show strength in contact syncing.

Handling images properly has multiple interesting considerations, such as:

When and how to fetch images

When to cancel requests (relevant when scrolling fast)

Cell recycling and images

How to evict images stored on disk

###### Probing questions:

###### Q: Do you store images in memory or disk?

The answer is probably both, but this is one way to ask in an unassuming fashion.

###### Q: Do you have any storage constraints?

This should trigger some discussions about when to evict images from disk.

###### Q: What happens if you scroll very fast?

###### Q: What is the API like for the consumers of this system?

##### Persistence (Mobile Domain Expertise / Solution Design)

The candidate should realize that the application needs some sort of persistence. Here are some usual topics:

Persisting metadata (ties into contact syncing, since disk is needed to make a solution that fetches everything data efficient)

Persisting volatile data (if deemed necessary)

Persisting images

Populating persistence and populating data source from persistence on cold start

Easy to use APIs for the core components (contact data, volatile data, image data)

###### Probing:

###### Q: What pieces of information do you need to store on disk?

Key realization should be you still want to have your contacts accessible even when you don’t have internet connection.

###### Q: What happens if people change their profile pictures a lot?

This should trigger a conversation around image storage being probably limited, which would trigger thoughts on storing them in a way that purging them when needed isn’t unnecessarily complicated. For example, if they were stored as a raw data as a column in Core Data (bad idea for multiple reasons), it would be a very complicated pass through all the contacts to figure out which ones to purge.

#### Optional Discussions

##### Cell Updates (Mobile Domain Expertise)

Couple interesting things in this space:

Understanding that reloadData has issues (non-animated updates, bad user experience while scrolling)

Are they able to describe some more advanced strategies in detail? IGListKit, manual cell updates, etc.?

While scrolling, if you get a lot of volatile data updates, that can make your experience worse if you don’t freeze updates or handle offset changing in some other way.

###### Probing:

###### Q: What happens when we get new presence data when the user is scrolling?

##### Contact Updates (Technical Excellence)

As briefly mentioned in the data syncing deep dive, inserting/updating/removing contacts is an interesting topic and can be difficult to handle right. Key considerations:

Don’t fetch everything every time updates are needed.

Detecting when updates are needed (re-using real-time update channel?)

Specifying a payload for updates and a merging strategy with the existing data source and persistence.

###### Probing:

###### Q: When would you get updates?

###### Q: What kind of payload would you get for updates?

### Variants

A common variant of this question is to move the online section into its own H-Scroll (see: P59910929 - credit to Buping Wang). This changes the discussions in the following ways:

It simplifies the ordering and paging question by clearly separating out the transient data from the non-transient data in the UI.

It adds another UIKit element (a horizontal scrolling view - typically a CollectionView)

### Pitfalls

Be careful to avoid going too deep into the paging topic. Sometimes candidates about which approach they want to take, and it’s better to raise concerns but move on (and note in feedback) if the candidate does not see any issues.

For more details, see the discussion here.
```