JBMSidebar
=========

Example of how to make a sidebar navigation for iOS.
---------

Designated Audience
---------

I made the navigation prototype for a designer to easily tweak on their own and for me to work with them to add more features.

My development included using an open source sidebar, adding easily updatable content in json and constants, extensible nested controllers and views, and creating a few reusable classes.

The prototype should work on any device and orientation.

Updating Content
---------

You will find that images are named by what class uses them and what property it is associated with.

You can update the text and image content in the JBMSidebarModel.json file. I started to fill in more content to show that we could add more content to the main sections.

Styling positions can be edited in the JBMSidebarConstants. Properties are either app-wide or are named by the class and property that uses them.

Further Work
---------

If we were to continue this prototype, I would spend time on:
- Animating out the status bar when the sidebar is open
- Animating the hamburger button into a back arrow when the sidebar is open
- Seeing how the app looks in different orientations
- Playing with changing sections with a double finger up and down pan gesture
- Animating the sections changing with a circle radiating from the sidebar selection
- Try adding section to the sidebar menu
- Add more items to the sidebar to see what happens to the arrow indicator


Developers as Audience
---------

If the audience were fellow developers I would:
- Finalized the shippable app using Objective-C coding guidelines
- Added unit and KIF tests
- Created maintainable constants
- Added a controller for requesting data for the sections
- Added localizable strings files

Open Source Framework
---------

I used this open source framework to save time on making the sidebar animations.

https://github.com/John-Lluch/SWRevealViewController