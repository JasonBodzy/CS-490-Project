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

- [x] users can log in/sign up
- [ ] users can log out
- [ ] users stay logged in/logged out across restarts
- [ ] users can post events
- [ ] users can view a feed of events
- [ ] purdue verification (purdue.edu email)

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
   * <img src='http://g.recordit.co/zLiBCvxeA4.gif'>
   * This isn't done yet, just the front end so far
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

Create new user:
```
@IBAction func signup(_ sender: Any) {
        let user = PFUser()
        user.username = self.txtUsernameSignup.text
        user.password = self.txtPasswordSignup.text
        
        self.indicatorSignup.startAnimating()
        user.signUpInBackground {(succeeded: Bool, error: Error?) -> Void in
            self.indicatorSignup.stopAnimating()
            if let error = error {
                self.displayAlert(withTitle: "Error", message: error.localizedDescription)
            } else {
                self.displayAlert(withTitle: "Success", message: "Account has been successfully created")
            }
        }
    }

```

Delete user:
```
if PFUser.currentUser() != nil {
        PFUser.currentUser()?.deleteInBackgroundWithBlock({ (deleteSuccessful, error) -> Void in
            print("success = \(deleteSuccessful)")
            PFUser.logOut()
        })         
}
```

Get all posts:
```
let query = PFQuery(className:"Post")
query.order(byDescending: "id")
query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
   if let error = error { 
      print(error.localizedDescription)
   } else if let posts = posts {
      print("Successfully retrieved \(posts.count) posts.")
  // TODO: Do something with posts...
   }
}
```

Create a post:
```
PFObject *newPost = [PFObject objectWithClassName:@"Post"];
newPost[@"id"] = @id;
newPost[@"image"] = URL;
newPost[@"author"] = currentUser.name; … etc
[gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
  if (succeeded) {
    // The object has been saved.
  } else {
    // There was a problem, check error.description
  }
}]; 
```

- [OPTIONAL: List endpoints if using existing API such as Yelp]
