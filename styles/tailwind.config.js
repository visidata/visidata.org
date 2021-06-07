module.exports = {
  mode: 'jit',
  purge: {
    content: [
      "site/**/*.html",
      "site/**/*.njk",
      "site/**/*.md"
    ],
    options: {
      whitelist: [],
    },
  },
  theme: {
    extend: {
        colors: {
          change: "transparent"
        },
          animation: {
            fadeInDown: "fadeInDown 1s ease-in-out forwards"
          },
          keyframes: {
            fadeInDown: {
              "0%": { opacity: 0, transform: 'translateY(-50%)'},
              "100%": { opacity: 1, transform: 'translateY(0)'}
            }
          }
    }
    },
    variants: {},
    plugins: [],
    darkMode: 'media',
  }