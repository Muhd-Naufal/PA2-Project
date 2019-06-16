# HELLO THERE!
This is a Read Me note inside every repository or a 'server'. This repository will assist in out CA2 project as it allows for real-time collaboration. And this is a just a note to inform anyone who comes by this page of what's this repository is about and contain.

## Files

- .gitignore
- PA2 R Markdown.Rmd
- PA2-Project.Rproj
- README.md
- Test File.R

As of 16/6/2019, there a a total of 5 files. I'll try to explain what each of these are.

> .gitignore

To be honest, I don't know what this file does but its name is a sequence of .git + ignore. This file was created while installing Git I believe and I guess you should ignore it since Git itself is telling you to ignore the file. 

> PA2 R Markdown.Rmd

This is a R Markdown file. This is different from a normal R file that we've been doing for the past couple of months. The formatting and output of the code is all different. Basically, think of this file as our 'report' that we will be submitting. So, most of the coding and work will be done in this file.

> PA2-Project.Rproj

This is the second file I can proudly say that I don't know what it does. *shrugs* 

> README.md

This file is the one you're reading now. Feel free to edit it and do whatever you want.

> Test File.R

Now this is a file you are familiar with. Its a normal R file but it's used to test out if the real-time collaboration of Git works after installation. You can ignore this or use this as a file to test whether your code works and whatnot.

## Git installation and GitHub synchronization
If there's ever an unfortunate incident that you simply lost your ability to Git or you had to hard reset your computer or whatever, this section will help in installing the whole thing again so we can all code together and be happily ever after!

### Links
- [Git](https://git-scm.com/downloads) - A Version Control System 
- [GitHub](https://github.com/) - Code hosting platform for collaboration 

### Install Git

First, download Git and install it. Click next and leave everything on default until you've reached this page:

![1](https://user-images.githubusercontent.com/51323038/59566775-4eeb0f80-9097-11e9-8ba0-912aed2250d4.PNG)

Click on the top box because you only need Git Bash and nothing else. Afterwards, click next until you've reached this page:

![1](https://user-images.githubusercontent.com/51323038/59566818-b739f100-9097-11e9-995a-0fdb34ab32eb.PNG)

Just ignore it and proceed to install Git. After you're done. Git Bash should be installed on your computer. Now don't touch it, we'll get back to it later. 

### Create GitHub account

Head to GitHub and create an account. Make sure to choose the free account option and you can bullshit your personal preferences. Now, its important to remember your account name and password because you're going to need it on Git Bash and R Studio to push an update to the server. Don't worry you only need to do this once. 

## Git Bash

Alright once you've created a GitHub account, open up Git Bash and it should look something like this:

![3](https://user-images.githubusercontent.com/51323038/59566941-4eec0f00-9099-11e9-97d6-899a4d2858c2.PNG)

Ooo scary colour codey stuff. Nah don't fret because it's not gonna hack into your computer or anything. All it's going to do is to communicate to GitHub servers and authenticate your account from Github with Git something like that.

For communication to happen you need to input your GitHub particulars. That's where your account name and password comes in. After the $ sign, type in this line of code: 

> git config --global user.name "Your Name"

Inside the quotation marks you put in your account name from GitHub and then press enter. Nothing should happen and another line of code identital to the first one appears. Now type in this line of code but instead of your account name, type in your email address you linked with GitHub and press enter.

> git config --global user.email "Your Email"

