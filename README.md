## Dependencies

Follow the [Nikola Getting Started Guide](https://getnikola.com/getting-started.html) to install standard dependencies. 

Install the Asciidoctor tools (assumes *nix environment)
```bash
# Install the Asciidoc Plugin
bin/nikola
bin/nikola plugin -i asciidoc
```

## Adding a New Post with AsciiDoctor Format

```bash
~/nikola-env/bin/nikola new_post -f asciidoc
```

A prompt will ask for required information. 
File will generated with placeholder metadata/front matter at `posts/<slug>.adoc` where slug is the sanitized title using the `[a-zA-Z_]` character set. 
Files can be moved around by simple copy/paste operations. 

### Metadata

```
///
.. title: Required
.. slug: Required - Typically auto-generated
.. date: Required - auto-generated
.. tags: Optional, comma seperated for multiple entries, no quotes required 
.. category: Required - only a single entry, currently have tech, recipes, masters
.. link: Optional, link to original source 
.. description: Optional, if you want a brief description to show up on feeds 
.. type: Required, choose from text (default) or micro (not used yet)
///
```
Please organize files under the `posts/<category name>` directory. 

### Page Content

Look at existing source for other files for inspiration on formatting. 
Markdown, REst, and a few other formats are supported by Nikola by default. 
A mix of files can be used for the project, as the `conf.py` identifies unique compilers for each file extension type. 
`.adoc` files were added for AsciiDoctor. 


## Local Testing 

```bash
# Build the site
~/nikola-env/bin/nikola build

# Complete rebuild of the site 
~/nikola-env/bin/nikola build -a --conf=local_conf.py

# Run a local webserver for testing
~/nikola-env/bin/nikola serve
```

## Publishing Updates

Following command will commit changes to the `src` branch and publish output to the `master` branch. 
Within minutes, you should see an update to [the published page](https://bstreete.github.io/).

```bash
~/nikola-env/bin/nikola github_deploy -m "Commit Message"
```

## Reference Material

Nikola installation and documentation at https://getnikola.com/. 
Configuration file for the site is `conf.py`.

To check all available commands:
```
~/nikola-env/bin nikola help
```

The `convert.sh` script was created to convert from Hugo style posts in Markdown to Nikola style Asciidoctor output. 
It is far from perfect, but it converted ~90% of the previous posts relatively accurately. 
