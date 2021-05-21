---
layout: post
title: Open Letter to Devs - Site Suggestions
author: mrghorm
image: /blogs/mrghorm/assets/images/Git-Logo-1788C.png
excerpt_separator: <!--more-->
---

Good afternoon developers of Intervolve,

The purpose of this letter/post is to suggest some best practice guidelines for continued development of the site.  My hope is to make suggestions to make continued growth of the site easy and structured, and to help us take advantage of our tools to the greatest extent possible.

<!--more-->

## These are just suggestions

First things first:  These are merely my suggestions for the site and how we can go about growing it.  I hope - and want - you make your own suggestions as well so we can come to a consensus about best making the site work.  If you have an idea, I hope to hear it.

## Branching

Branching is a tool in Git and GitHub that we could gain a lot from.  Currently, our workflow has in general been to make a large number of small changes in parallel in the main branch, and pull to LIVE when necessary.  However, this can cause conflicts in the code sometimes and can cause some changes to be mistakenly overwritten.

My suggestion is to - at least at first - start using other branches for specific kinds of changes we need to make.  Git can merge or rebase any branch into any other branch, and so it makes sense for us to create many more branches for specific changes, merge them into each other or into LIVE.

[This fantastic tutorial](https://www.atlassian.com/git/tutorials/merging-vs-rebasing) outlines the difference between a merge and a rebase, what exactly they do, and why they are helpful in certain situations.  It helped me understand what they did conceptually to a much greater degree.

Here are my suggestions for a branching naming convention:

* **LIVE** - reserved for what's currently displayed on the live site at intervolve.org
* **refactor-[location]-[specifics]** - Branches reserved for coding improvements to a specific file or files ([location]) for a specific purpose ([specifics], optional).  These blogs could be temporary and may be deleted once the code has been successfully implemented.
	* For example, I wanted to rewrite the code for the landing page as it's become too complicated to understand.  I would make a branch called `refactor-landing-cleanup` which would be a branch specifically for cleaning up the code of the landing page.
* **blog-[blogger]** - These branches could be used for bloggers to write their blogs.  Mine might be `blog-mrghorm`.  These branches could be permanent for bloggers to blog as long as they would like.
* **page-[new/update]-[page name]** - These branches could be used to create a new site-level or permalinked page, or update and existing site-level or permalinked page.  These branches could also be temporary and be deleted once the changes or pages have been successfully implemented.  If I wanted to add a new cooking page, I could make a branch `page-new-cooking`.
* **bugfix-[location]** - These temporary branches could be used to fix bugs at the specified locations (or files) in the code.  If there was a problem with my cooking page, I would make a branch `bugfix-page-cooking`.

These are just a couple of examples of the types of branches we could use and their naming conventions to keep code changes clean and well documented.  Just a note: you never want your branch names to be too long, but the branch name being an abbreviated description of what's being changed might be very helpful.

## LIVE protection

While the LIVE branch already has a few basic protections, my suggestion would be to implement a new one: **Require pull request reviews before merging**.

Requiring pull request reviews before merging would mean that all commits would first have to be pushed (or pull-requested) into a non-protected branch first.  Upon a pull-requesting into LIVE, the code would have to be reviewed by any of the specified people, which I think should be the "code owners".  This would just further protect the LIVE branch and prevent unintentional changes from being made, while also making sure that the site admins have to sign off on each request.

This feature may be one that we can live without, but may be helpful particularly if/when we start to have more contributors.

## Github Discussions and Issues

Github is starting to become more forum-like as time goes on, as they add more features intended to facilitate communication between contributors and users.   

Github issues in particular might be helpful for suggesting code changes to each other at the very least, and allowing other people to suggest changes for us.  For example, if I have been working on a section of code which doesn't work or doesn't make sense to you - you could raise an issue in the Github Issues section, point out the commit, file, and lines of code which are the issue, and assign the issue to me.  Then that issue could be tracked and updated as I fixed it.

Github Discussions is kinda similar, and in beta.  It's a similar idea to Github Issues but expands on the idea to allow tracked discussions of ideas, announcements, and etc.  It could be helpful to allow us to track ideas in one consolidated place.

Our "operation" so far (if you can even call it that) is not nearly expansive enough to fully take advantage of these features, but I certainly think they would be at least a little bit helpful for us.

## Closing

Thank you, Devs, for your support and contributions to this project.  I hope to see it continue to expand and become a real hub for discussion, and a good place for us to carve out our own little portion of the Internet.

Please don't hesitate to disagree with anything I've suggested here, or make your own suggestions.  This goes for everyone who is or wants to contribute.  Maybe Github discussions is the place for that?  Who knows - either way, let me know.

Thanks,

--mrghorm
