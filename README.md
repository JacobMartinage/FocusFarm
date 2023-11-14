# FocusFarm

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

FocusFarm is a minimalistic pomodoro timer app that allows users to build a farm of animals over time through good study/work habits. Each time you complete a focus session, an egg will hatch and give you a new animal.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:**
- This app goes into the category of productivity
- **Mobile:**
- This is a mobile app and most effect as a mobile app as it forces people to stay off their phone and focus on their work
- **Story:**
- Having trouble focusing and keep getting caught doomscrolling? Look no further! FocusFarm is an app that will build good study and work habits, and all the while you get to build a farm of cute animals!
- **Market:**
- People who either have phone addictions they're looking to break or people who need increased focus for their work/studying
- **Habit:**
- Builds a habit of using this app whenever user needs to be productive.
- **Scope:**
- Only 2 screens, need to implement a timer, and connect that timer to a function that runs when it is finished

## Product Spec

### 1. Features (Required and Optional)

**Required Must-have Features**

- [x] Tiner
- [x] Egg image that gets more cracked as time gets lower
- [x] Timer is able to be changed using a slider
- [x] Timer is able to be started and reset (there is purposefully no pause)
- [x] Timer resets after going off
- [x] Timer going off adds an animal to the "farm"
- [x] Multiple animals available to be added
- [x] Farm screen that has a table of the obtained animals

  

**Optional Nice-to-have Features**


- [x] Data persists locally
- [x] Timer going off plays a sound
- [x] Timer going off produced an alert/popup
- [x] When user clicks ok on alert sound stops
- [ ] 3D model for each animal
- [ ] Detail view for each animal
- [ ] Track if user leaves app and if so animal doesnt hatch
- [ ] Payment system (user agrees to if they dont complete the study session __ dollars will be donated to ___)
- [ ] 3D Interactive farm with users animals
- [ ] Add different color eggs

##Current Progress
- Successfully designed the "front end" of both the timer screen and the farm screen, but none of the back end is working yet (slider not connected to timer, timer not timering, etc..)
- Obtained and edited images of each stage of egg cracking (which will change as timer goes down)
- Slider properly adjusts timer label as well as the back end seconds, and the timer properly counts down
- Timer is able to be started and stopped, and when timer is running the slider gets locked so that you cant change its time
- Egg images now correctly progress as the timer gets lower (full at the start, then 1 crack, then 2 cracks, etc..)
- Succesfully connected the TimerViewController to the FarmViewController and made it so that when the timer hits zero, a random animal is generated (currently just 1/4 possible choices), and then added to the table in the FarmViewController
- The animals array is now stored in userdefaults, allowing users to build their farm over many study sessions
- When the timer hits zero, the timer now gets properly resets, a sound plays, and an alert pops up notifing the user that their study session is over and they have a new animals in their farm
  
  

  


### 2. Screen Archetypes

- [x] Timer page
* Timer
* Ability to change amount of time for timer
* timer is able to be started and stopped

- [x] Farm page
* Table of all of the animals


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Timer
* Farm



## Wireframes

![wireframe](https://github.com/JacobMartinage/FocusFarm/assets/62039158/b27ef4e1-1d5e-4027-8b5a-e2bab8dd6457)




### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
