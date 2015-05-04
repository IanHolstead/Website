# Ian's personal website

This is the code behind the <a href="https://ianholstead.com">ianholstead.com</a>.

This project is built with grails 2.2.4 and the orginal sega of constructing it is <a href="https://ianholstead.com/blog/show/Creating-my-Website">here</a>. I did try upgrading to grails 2.4.2 earlier this year, but some of the plugins don't support that version and the plugin which is responsible for the site using bootstrap changed it look and I deemed it way too much work to fix so old verion of grails ahoy. 

Additionally when I moved computers earlier this year I discovered doing a fresh checkout and rebuild was problematic (some of the older version of the plugins didn't seem to exist on the grails repository any more) so if you try to build this and have problems send me a note and I'll send over the plugins.

The site has been work in progress for about 2 years now and when I started working on it I didn't totally understand git so the project isn't at the root folder. Additionally, initially I had intended to keep this repository private and as such was full of passwords, when I decided to push it to github, I had to scrape the passwords and might have gotten a little over-zelous, if you are trying to checkout and build old commits you will have to search for '** REMOVED **' (without the spaces) in the .less files and replace them with 'Family'.

All (non-plugin, non-generated) code was written by me with the exceptions mentioned <a href="https://ianholstead.com/site#collapseFour">here</a>.

I do have a Jira which I use for bug tracking and version planning but I'm too cheap to pay for hosting it in the cloud. So unfortunately you won't know what I need to fix/am working on...