const Image = require("@11ty/eleventy-img");
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");
const markdownIt = require("markdown-it");
const markdownItAnchor = require("markdown-it-anchor");
const eleventyNavigationPlugin = require("@11ty/eleventy-navigation");
const pluginRss = require("@11ty/eleventy-plugin-rss");
const { DateTime } = require("luxon");

module.exports = function (eleventyConfig) {

    // Use .eleventyignore as single source of truth for files to process.
    eleventyConfig.setUseGitIgnore(false);

    // dev: Watch style changes
    eleventyConfig.addWatchTarget("./styles/tailwind.css");
    eleventyConfig.addWatchTarget("./_site/style.css");

    // Filters

    // Date filter to fix UTC issues
    eleventyConfig.addFilter("dateDisplay", (dateObj) => {
        return DateTime.fromJSDate(dateObj).toUTC().toLocaleString(DateTime.DATE_MED);
    });

    // Add a limit function to limit the amount of items output by an array. https://11ty.rocks/eleventyjs/data-arrays/#limit-filter
    eleventyConfig.addFilter("limit", function (arr, limit) {
        return arr.slice(0, limit);
    });

    // Random item filter
    eleventyConfig.addFilter("randomItem", (arr) => {
        arr.sort(() => {
            return 0.5 - Math.random();
        });
        return arr.slice(0, 1);
    });

    // Sort by page order - used for ordering docs
    function sortByPageOrder (values) {
        return values.slice().sort((a, b) => a.data.order - b.data.order);
    }
    eleventyConfig.addFilter("sortByPageOrder", sortByPageOrder);

    // {{ variable | jsonify }}
    eleventyConfig.addFilter('jsonify', function (variable) {
        return JSON.stringify(variable);
    });

    eleventyConfig.addFilter("squash", require("./filters/squash.js"));

    // Collections
    eleventyConfig.addCollection("blog", collectionApi => {
        return collectionApi.getFilteredByTag("blog").sort((a, b) => {
            return b.date - a.date;
        }).filter((item) => {
            return item.data.tags.indexOf("releases") -1;
        });
    });

    // Layouts
    const layoutAliases = {
        "default": "default.njk",
        "post": "post.njk",
        "page": "page.njk",
        "docs": "docs.njk"
    };
    for (const [alias, layout] of Object.entries(layoutAliases)) {
        eleventyConfig.addLayoutAlias(alias, `layouts/${layout}`);
    }

    // Include our static assets
    eleventyConfig.addPassthroughCopy({
        "robots.txt": "",
        "images": "",
        "videos": "",
        "site/blog/assets": "blog/assets",
        "visidata/docs/assets": "docs/assets",
        "visidata/docs/casts": "docs/casts",
        "node_modules/asciinema-player/dist/bundle/*.css": "css",
        "node_modules/asciinema-player/dist/bundle/*.js": "/",
        "node_modules/@fontsource/inconsolata": "css/inconsolata",
        "styles/inconsolata.css": "css/inconsolata.css",
        "redirects.tsv": "_redirects"
    });

    // Plugins
    eleventyConfig.addPlugin(syntaxHighlight);
    eleventyConfig.addPlugin(eleventyNavigationPlugin);
    eleventyConfig.addPlugin(pluginRss);

    // Eleventy-img config
    async function imageShortcode (src, alt, sizes = "40vw, 60vw, 100vw") {
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

    // Shortcodes
    eleventyConfig.addNunjucksAsyncShortcode("image", imageShortcode);
    eleventyConfig.addLiquidShortcode("image", imageShortcode);
    eleventyConfig.addJavaScriptFunction("image", imageShortcode);
    eleventyConfig.addShortcode("version", function () {
        return String(Date.now());
    });
    eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);

    // Configure markdown-it and add plugin for heading anchors
    let markdownItOptions = {
        html: true,
        breaks: true,
        linkify: true
    };
    let markdownLibrary = markdownIt(markdownItOptions).use(markdownItAnchor, {
        permalink: markdownItAnchor.permalink.ariaHidden({
            class: "heading-anchor",
            symbol: "",
            space: false,
            placement: "before",
            slugify: (s) =>
                s
                    .trim()
                    .toLowerCase()
                    .replace(/[\s+~\/]/g, "-")
                    .replace(/[().`,%·'"!?¿:@*]/g, ""),
        })
    });
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
    };

    // Transforms

};