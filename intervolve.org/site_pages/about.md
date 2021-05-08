---
layout: default
title: About
permalink: /about/
---
# intervolve.org (DRAFT)

Welcome to intervolve.org, a simple static website generated live from GitHub that serves as a platform for projects, how-to's, or your very own simple blog.

We the creators of Intervolve believe in a free, open, and decentralized internet.  Intervolve is our corner of the internet, and we invite you to make it yours too.  Intervolve.org is completely open-source, and is compiled straight from the LIVE branch into the site using the Jekyll static site generator, a powerful Wordpress alternative. 

Feel free to suggest any changes or improvements to the site. If you know how to do it and want to program it, we will take a look. To start your own blog, please see the "How to contribute" section based on your knowledge of Github.  The blogs ***must*** conform to the standard site structure in order to be accepted.  

## How to contribute - Beginner (section not complete)

We want everyone to contribute.  Github is fun, and not too difficult to learn, but understanding it is important for being able to submit your articles.

General Knowledge for Github:  [https://guides.github.com/](https://guides.github.com/)

Basically all you need to know is that github allows you to access the files used to creat the website itself. All this is right now is a good old fasioned static site that loads quickly (though we are still working on mobile support).

Anyway to get started, if you can learn to follow the browser instructions for github, you're half way there. 

1. [Github Hello World](https://guides.github.com/activities/hello-world/)

2. After this you can go to [/intervolve.org/blogs/](https://github.com/intervolve-org/intervolve.org/tree/main/intervolve.org/blogs) on your copy of files for the site.
	1.

3. Place a `.md` file in the blogs folder. ***.md*** stands for *markdown*. Blog pages can be anything from just typed text to a full html webpage. Either way it gets compiled to the look of the site. Markdown is a fairly easy formatting tool. From plain text and a few symbols you can have bold text.  drfreeman becomes *drfreeman* or ***drfreeman*** by adding three `*`'s  Markdown code: drfreeman becomes \*\*\* drfreeman\*\*\* by adding three \`s\`'s  \<\`  \`double space newline.  

4. Images and other elements are allowed. There will be rules for what can and can't be posted. Basically just use common sense. The admins will review all submissions.

5. However, there are a couple more steps to get something rendered on the website, including knowing the other site structure. If you have completed the steps above you can continue to the next section. Or you can play around with markdown in your github account continuing off "Hello World".  [Markdown Cheatsheet](https://www.markdownguide.org/cheat-sheet)
<!---
Test comment but also speaking of images, a few small images could be added here for the tutorial
-->

## How to contribute - Knowledgeable 

For those more knowledgeable in Github, follow these instructions below:

1. Fork the site into your own repo, clone it locally, blah blah blah.  Just get it to a point where you can work on your own copy of the repo.

2. **All blogs originate in `/intervolve.org/blogs/<username>/` - so **create a directory** using your username in this directory. 
  
   1. *From now on, **you are the example**, and your example username is `drfreeman`.*

3. Next, in `blogs/drfreeman/`, create another directory named `_posts`.
  
   1. This directory is recognized by Jekyll as a 'posts' location.  Jekyll will read and pull any `.md` files from this location and compile them into the site as a "post".  This will allow your posts to be viewed from the front page and in other listings around the site.

4. To create a post:
  
   1. Name the file using the following naming pattern:  `yyyy-mm-dd-your-title-here.md`.  The date should typically be the day on which you're writing the post.  It would look like this on May 1st, 2021:  `2021-05-01-how-to-slay-nihilanth.md`.
  
   2. Files in `_posts` must contain Jekyll front matter.  Read about front matter here:  https://jekyllrb.com/docs/front-matter/
  
   3. The front matter for posts should at least include the layout `post` and your authored name like so:
    ```
    ---
    layout: post
    author: drfreeman
    ---

    your article goes here
    ```
  
   4. You should write your articles in Markdown unless you really know what you're doing.  Here's a markdown cheat sheet:  https://www.markdownguide.org/cheat-sheet .  However you *can* write your own custom HTML & CSS if you desire.  See "How to contribute - Advanced" section.

   5. Other layouts can be found in `/intervolve.org/_layouts/`

4. (optional)  If you feel so inclined, you can also make a landingpage for your blog.  To do this, just create an index.html or an index.md file in blogs/drfreeman/, and this page will be permalinked to `https://intervolve.org/blogs/drfreeman`

  1. Make sure it has front matter to tell Jekyll to process it, whether it's an html or md file.
   
## How to contribute - Advanced

This section should be used by those who are very interested in customizing their own landing pages, or those who are trying to get pages to work where markdown just doesn't cut it.

1. Custom HTML:

   1. Custom HTML can be written for posts or custom landing pages.  Jekyll will still process a post if it has HTML in it so long as the HTML file contains front matter.  The front matter looks exactly the same as it would in a markdown file:
    ```
    ---
    layout: post
    author: drfreeman
    ---
    
    <your html article here> Contents! </your html article here>
    ```
 
   2. It should be noted that when you use the `layout` function in front matter, Jekyll takes your HTML and places it inside of the layout """container""".  This means that you don't need the `<html>`, `<head>`, or `<body>` tags, nor do you need any of the typical functions that you need with these, since that is all handled in the layouts.  You can view the layouts in `/intervolve.org/_layouts/` to get an idea of what they do.  After you have the front matter, just start writing plain 'ole HTML with the regular tags (like p, h1-6, divs, etc).

2. Custom Styling:

   1. Custom styling can be achieved by using your own assets.  Make sure to keep these in an assets folder inside your own `blogs/drfreeman` folder.  **Do not modify the asset files in `/intervolve.org/assets/`** since these control the sitewide styling.  (unless of course you have a suggestion to improve the whole site).

   2. ***Submissions with custom page styling inside of the root level assets folder will be denied***.  Again - suggestions for site-wide changes will be reviewed, but do not put CSS for just your own pages in these files.

   3. In your own custom HTML, link to your custom stylesheet at the top of your custom html file.  `<link rel="stylesheet" href="/blogs/drfreeman/assets/custom.css"`.  This will ensure that it can override the site CSS on your page.

    
