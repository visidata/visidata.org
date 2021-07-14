## Preview

[visidata.netlify.app](https://visidata.netlify.app)

## Building and Running 

**Install**

`pip install -r requirements.txt`

`npm install`

**Live dev environment:**

`npm run build:docs`

`npm run dev`

**Production:**

`npm run build`

## Writing content

For both blog posts and releases, all MarkDown files will be stored in `site/blog/<year>/`.

If you need to store assets such as image files, these go in `site/blog/assets/`.
300kb or less is recommended for image file sizes. 

**Important notes:**

* **All posts must include the appropriate frontmatter** or they will not show up on the site. Check previous posts for examples.
* **No H1 headings in posts.** There should only be one H1 element on each page, and that's the title, which is automatically added from the frontmatter. Use H2s instead. This helps search engines not get confused.

## Images

This site includes Eleventy Image. This makes it easy to serve responsive, optimized images in your templates.
Eleventy Image will automatically convert any jpeg, png, webp, gif, tiff, or avif to optimized webp and jpeg. Thanks to the HTML `<picture>` element, WebP is served first with a JPEG fallback for browsers that don't support WebP. [All the major browsers support WebP](https://caniuse.com/?search=webp). 

If you need to add an image to a template file (.njk), use the Eleventy Image shortcode instead of the `<img>` element:
`{% image "images/image.jpg", "alt text goes here" %}`

**Important note:** Be sure to include alt text or Eleventy will throw a warning (this is good!).

Store your template images in `/images`.

### Animated GIFs
These can be extremely heavy - I recommend converting them to MP4 instead and adding them using the HTML5 `<video>` element. Browsers will then defer loading the video until the play button is clicked. An example can be seen on the index page.

**Eleventy Image will not output these in an animated format.**

## Updatable site elements

You can always edit the HTML, but some elements are rendered from a JSON list.

**Current lists:**:

* Sponsors in footer - `site/globals/sponsors.json`
* Site navigation - `site/globals/navigation.json`
* Testimonials on homepage - `site/globals/testimonials.json`