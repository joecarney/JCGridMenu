
#JCGridMenu

by Joe Carney


##Intro...

This is a simple IOS control that works as a 44x44px menu using rows and columns to show and hide options.  It's not big but it is clever, here is the obligatory screen shot...

![](https://dl.dropbox.com/u/2797263/Github/jcgridmenu.jpg)

##Getting Started...

It is an ARC project so if you want to drop it into a non-ARC project, I hope you know what you are doing.  

Best way to get started is to just download it and see what happens.    Seriously, I don't have time to explain how to open an xCode project and what you need to do to get into your own project.

However, I have built a nice little 6 page demo inside the source code.  

[Watch the video if you cannot be bothered to download the source code] [3]


Load it and you can see different examples of it how it works.  You can also look at the code for each demo controller to see how crap my code is and how I'm basically winging it all the way.

##Known Issues…

    The control creates a transparent UIView and checks for -(id)hitTest to see if it should process the touch on a button or not.  It looks like this is fine unless the control is sitting on top of a MapView which requires a pinch/zoom.  Am looking into a fix today...

##Support...

This control **hasn't been tested with anything**.  

I shit you not, it runs on iOS5+ on my simulator and iPhone and it runs inside the project I'm working on (which still isn't finished and in testing yet).

Hence you won't be surprised when I tell you that it comes with absolutely **zero support**.  

However, if you are on Twitter, I suggest you...

* Follow [@joseph_carney] [1]

You can always ping me there and if I'm not too busy I may reply.

##Licence

What licence?  I built this code for me to solve a problem. It solved my problem.  I open sourced as I thought it might benefit the developer community at large.

Use it if you want to use it but don't come crying to me if it doesn't work.  

If you want to pretend you built it first and start selling it as your own, then grow up and stop being a prick.  Nobody wants to buy shit like this, you'll never be Steve Jobs so wake up and smell the roses.

If you do use it and your app has millions of downloads, all because of the fact that you implemented my menu, then some sort of recognition somewhere would be cool.

Other than that, do with it what you will... 

##One last thing…

I drew all of those icons myself.  By hand.  Not bad for a coder, eh? That's because I used [Sketch] [2].  It rocks. Try it sometime.


[1]: http://twitter.com/joseph_carney        "@joseph_carney"
[2]: http://www.bohemiancoding.com/sketch/        "Sketch"
[3]: https://dl.dropbox.com/u/2797263/Github/jcgridmenu.mov "Demo Video"