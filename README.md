Original App Design Project - README Template
===

# Philanthrofeed

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Crowdsourced platform to network and promote local philanthropy and organizational events. Platform to promote and find events.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category: Community**
- **Mobile: iOS**
- **Story: Find promote and events**
- **Market: Students and Organizations**
- **Habit:**
- **Scope: University Communities**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* users can log in/sign up
* users can log out
* users stay logged in/logged out across restarts
* users can post events
* users can view a feed of events
* purdue verification (purdue.edu email)

**Optional Nice-to-have Stories**

* users can view a map of events
* users can comment on events
* users can 'follow' organizations/institutions
* users can rvsp to events (?)
* view a feed 'priority' organizations
* calendar
* organization profiles
* organization verification

### 2. Screen Archetypes

* log in screen
   * users can log in/sign up
* feed screen
   * users can view a feed of events
   * users can log out
* upload screen
   * users can post events
* manage events screen (optional)
   * users can manage their posted events
* map/calendar screen (optional)
   * users can view a map/calendar of available events 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Feed tab
* Upload tab (if organization)
* Manage events tab (if organization)

**Flow Navigation** (Screen to Screen)

* Log in screen
   * leads to feed screen
* Feed screen
   * leads to log in screen upon log out

## Wireframes
<img width="922" alt="Screen Shot 2022-03-21 at 4 35 13 PM" src="https://user-images.githubusercontent.com/13425391/159359390-75d19897-8e7c-40fb-9d62-22aa3f6bc6a5.png">

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models

User Data Model (PFuser)
|Property|Type|Description|
|--------|----|-----------|
|username|String|Username of the user|
|password|String|Password of the user|
|RSVPs|int[]|Array of post ID’s for RSVPd posts|



Post Data Model
|Property      | Type  | Description             |
|--------------|-------|-------------------------|
|Image         | URL   |Picture for the post     |
|caption       |String | Details/caption of event|
|author/poster |PFUser |Person /org who posted   |
|RSVPs         |Array of PFUsers|List of people who’ve RSVPed|
|Time          |DateTime|Time of event           |
|ID            |String  |Unique id for post      |
|Location ?    |String  |Location of event (maybe just part of caption)|




### Networking

 * Log in screen
	* (POST) create new user
	* (GET) get user info

 * Feed Screen
	* (GET) get posts
	* (PUT) RSVP to an event 
	* (DELETE) delete a post

 * Upload screen
	* (POST) create a new post

 * Settings screen ?
	* (PUT) update user
	* (DELETE) delete user

- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
