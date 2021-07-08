## Preview

[visidata.netlify.app](https://visidata.netlify.app)

## Building and Running 

**Install**

`pip install -r requirements.txt`

`npm install`

**Live dev environment:**

`npm run dev`

**Production:**

`npm run build`

## Writing content

For both blog posts and releases, all MarkDown files will be stored in `site/blog/<year>/`.

If you need to store assets such as image files, these go in `site/blog/assets/`.

**Important notes:**

* **All posts must include the appropriate frontmatter** or they will not show up on the site. Check previous posts for examples. Copy-paste is the easiest method to ensure your frontmatter is correct.
* **No H1 headings in posts.** There should only be one H1 element on each page, and that's the title, which is automatically added from the frontmatter. Use H2s instead. This helps search engines not get confused.

## Updatable site elements

You can always edit the HTML, but some elements are rendered from a JSON list.

**Current lists:**:

* Sponsors in footer - `site/globals/sponsors.json`
* Site navigation - `site/globals/navigation.json`
* Testimonials on homepage - `site/globals/testimonials.json`