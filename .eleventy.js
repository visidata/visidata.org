const Image = require("@11ty/eleventy-img");
const eleventyGoogleFonts = require("eleventy-google-fonts");
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const markdownIt = require("markdown-it");
const markdownItAnchor = require("markdown-it-anchor");
const eleventyNavigationPlugin = require("@11ty/eleventy-navigation");

let markdownLibrary = markdownIt({
    html: true,
}).use(markdownItAnchor, {
    permalink: true,
    permalinkClass: "heading-anchor",
    permalinkSymbol: "#",
    permalinkSpace: true,
    permalinkBefore: true,
    level: [1, 2],
    slugify: (s) =>
        s
        .trim()
        .toLowerCase()
        .replace(/[\s+~\/]/g, "-")
        .replace(/[().`,%·'"!?¿:@*]/g, ""),
});


const markdownItOptions = {
    html: true,
    breaks: true,
    linkify: true
}

module.exports = function(eleventyConfig) {
    // // Set Browsersync options
    //   eleventyConfig.setWatchThrottleWaitTime(0); // in milliseconds
    //   // BrowserSync options
    // eleventyConfig.setBrowserSyncConfig({
    //   notify: false,
    //   reloadDelay: 0
    // });

    // Use .eleventyignore as single source of truth for files to process.
    eleventyConfig.setUseGitIgnore(false);

    eleventyConfig.addWatchTarget("./styles/tailwind.css");
    eleventyConfig.addWatchTarget("./_site/style.css");

    eleventyConfig.addShortcode("version", function() {
        return String(Date.now());
    });
    // Filters
    // Add a readable date formatter filter to Nunjucks
    eleventyConfig.addFilter("dateDisplay", require("./filters/dates.js"))

    // Add a HTML timestamp formatter filter to Nunjucks
    eleventyConfig.addFilter("htmlDateDisplay", require("./filters/timestamp.js"))

    // Add a limit function to limit the amount of items output by an array. https://11ty.rocks/eleventyjs/data-arrays/#limit-filter
    eleventyConfig.addFilter("limit", function(arr, limit) {
        return arr.slice(0, limit);
    });
    // Random item filter
    eleventyConfig.addFilter("randomItem", (arr) => {
        arr.sort(() => {
            return 0.5 - Math.random();
        });
        return arr.slice(0, 1);
    });
    // Year filter
    eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);

    // Sort by page order - used for ordering docs
    function sortByPageOrder(values) {
        return values.slice().sort((a, b) => a.data.order - b.data.order);
    }
    eleventyConfig.addFilter("sortByPageOrder", sortByPageOrder);

    // Collections
    eleventyConfig.addCollection('blog', collection => {

            const blogs = collection.getFilteredByTag('blog')

            for (let i = 0; i < blogs.length; i++) {

                const prevPost = blogs[i - 1]
                const nextPost = blogs[i + 1]

                blogs[i].data["prevPost"] = prevPost
                blogs[i].data["nextPost"] = nextPost

            }

            return blogs.reverse()

        }),
        eleventyConfig.addCollection('releases', collection => {

            const releases = collection.getFilteredByTag('releases')

            for (let i = 0; i < releases.length; i++) {

                const prevPost = releases[i - 1]
                const nextPost = releases[i + 1]

                releases[i].data["prevPost"] = prevPost
                releases[i].data["nextPost"] = nextPost

            }

            return releases.reverse()

        })

    // Layout aliases
    eleventyConfig.addLayoutAlias('default', 'layouts/default.njk')
    eleventyConfig.addLayoutAlias('post', 'layouts/post.njk')
    eleventyConfig.addLayoutAlias('page', 'layouts/page.njk')
    eleventyConfig.addLayoutAlias('docs', 'layouts/docs.njk')

    // Include our static assets
    eleventyConfig.addPassthroughCopy("js")
    eleventyConfig.addPassthroughCopy("robots.txt")
    eleventyConfig.addPassthroughCopy("images/svg")
    eleventyConfig.addPassthroughCopy("images/icons")
    eleventyConfig.addPassthroughCopy("videos")
    eleventyConfig.addPassthroughCopy({ "./site/blog/assets": "./blog/assets" });
    eleventyConfig.addPassthroughCopy({ "./visidata/docs/assets": "./docs/assets" });
    eleventyConfig.addPassthroughCopy({ "./visidata/docs/casts": "./docs/casts" });
    eleventyConfig.addPassthroughCopy({ "./node_modules/asciinema-player/resources/public/js/asciinema-player.js": "./asciinema-player.js" });
    eleventyConfig.addPassthroughCopy({ "./node_modules/asciinema-player/resources/public/css/asciinema-player.css": "./asciinema-player.css" });
    // Plugins

    eleventyConfig.addPlugin(eleventyGoogleFonts);
    eleventyConfig.addPlugin(syntaxHighlight);
    eleventyConfig.addPlugin(eleventyNavigationPlugin);

    // Eleventy-img config

    async function imageShortcode(src, alt, sizes = "40vw, 60vw, 100vw") {
        let metadata = await Image(src, {
            widths: [1000],
            formats: ["svg", "webp", "jpeg"],
            svgShortCircuit: true,
            svgAllowUpscale: true,
            outputDir: "_site/img/"
        });

        let imageAttributes = {
            alt,
            sizes,
            loading: "lazy",
            decoding: "async",
        };

        // You bet we throw an error on missing alt in `imageAttributes` (alt="" works okay)
        return Image.generateHTML(metadata, imageAttributes);
    }


    eleventyConfig.addNunjucksAsyncShortcode("image", imageShortcode);
    eleventyConfig.addLiquidShortcode("image", imageShortcode);
    eleventyConfig.addJavaScriptFunction("image", imageShortcode);

    // Use library for Markdown for anchored headings
    eleventyConfig.setLibrary("md", markdownLibrary);

    // Template formats
    return {
        templateFormats: ["md", "njk", "html"],
        markdownTemplateEngine: 'njk',
        htmlTemplateEngine: 'njk',
        passthroughFileCopy: true,
        dir: {
            input: 'site',
            output: '_site',
            includes: 'includes',
            data: 'globals'
        }
    }

    // Transforms

};