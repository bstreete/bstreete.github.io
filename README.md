## Dependencies 
- [Hugo 0.61 Extended](https://gohugo.io/getting-started/installing/)

## Adding a New Recipe
Checkout/clone a copy of the repo. Inside the root of the project, enter the following command: 
<pre>hugo new recipes/<recipe_name>.md </pre>

This will create a new markdown file with some template information. Populate the recipe as needed. Here is an example file from the repo. 

### Metadata for Tagging
This portion (called [Front Matter](https://gohugo.io/content-management/front-matter/) in Hugo jargon) drives the automatic tagging system in Hugo. Tags and author entries can have multiple listings separated by commas. The title entry is the displayed name when viewing the final output. 

<pre>
---
title: "Baked French Toast"
date: 2019-12-19T09:56:29-07:00
draft: false
tags: ["entree", "favorites"]
author: ["Lis Handley", "Handleys"]
---
</pre>

### Page Content
After the front matter, the visible portion of the page should be listed. The template will pre-define the location of the source, ingredients, and directions block, but this can be overwritten. 

#### Notes on Sources
Typically, source annotations should include a link to the original author when possible. Link will be generated from markdown syntax like so: `[Display Name](https://link.path)`. 

<pre>
Source: Lis Handley
</pre> 

#### Ingredients
Use an unordered list (bullets) to format all of the ingredients. This can be done in markdown with a `- ` preceding the line. The whitespace is required. 

In more complex recipes, it makes sense to split the ingredients into multiple chunks based on the final product. For example, a salad and dressing page could have the ingredients section split into the salad and dressing portions. Use another heading value (`####`) to properly format the title of the section. 
<pre>
### Ingredients
- Loaf of French bread
- 3 eggs
- 3 tablespoons sugar
- 1 teaspoon vanilla
- 2 1/4 cup milk
- 1/2 cup flour
- 6 tablespoons brown sugar
- 1/2 teaspoon cinnamon
- 1/4 cup butter
- 1 cup berries
</pre>

#### Directions
Use an ordered list to format the ingredients. This can be done using `1. ` in markdown syntax. The parser will correctly renumber the values. You can use `1.` for all of the lines, and the final output will be in ascending order like you would expect. 
<pre>
### Directions
1.	Cut bread diagonally. Place in baking dish.
2.	Beat eggs, sugard, and vanilla together. Stir in milk and pour over bread. Turn slices to coat well. Cover and refrigerate at least two hours. 
3.	Preheat oven to 375°. Combine flour, brown sugar, and cinnamon. Sprinkle berries and flour evenly over bread. Bake about 40 minutes or until golden brown. 
4.	Top with fresh syrup or berries. 
</pre>

### Generating the Website
At this point, you should have a new recipe that needs to be analyzed by Hugo. Run the following command to test locally. If you are developing on another server, the --baseURL option is necessary for links to work. If you are developing locally, that option can be omitted. The default server uses port 1313, but you can change this to whatever works for your workflow.
<pre> hugo server --bind=0.0.0.0 --baseURL=http://hostname.or.ip.address:1313</pre>

This will start a webserver at the specified address/port. Hugo will be monitoring for file changes, so if you identify an issue in the generated output, merely saving the original file will regenerate the website (barring exceptions). The webpage should automatically refresh once Hugo finishes. This server runs out of RAM, and does not update the HTML on disk. 

### Committing Changes
Once your satisfied with the output in the dev environment, you need to generate all of the files. Issue the following command: 
<pre>hugo</pre>

This will rerender all of the files in the project. The output files will end up in the <project root>/public directory. You need to commit all of the updated files (`git add public/*`) as well as the new or modified source files. Once these files are pushed to GitHub, the new files should appear at the [main URL](https://bstreete.github.io/public/index.html) within a few minutes. 

When viewing the repo in GitHub, you can check the deployment status in the [Environment](https://github.com/bstreete/bstreete.github.io/deployments) screen. It will report which commit has been pushed into the GitHub Pages server. 
