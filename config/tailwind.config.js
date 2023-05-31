module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
    "./node_modules/flowbite/**/*.js",
    "./src/**/*.{html,js}",
    "./node_modules/tw-elements/dist/js/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        'rubik-bubbles': ['"Rubik Bubbles"', 'cursive'],
        'kenia': ['"Kenia"', 'cursive'],
        'puff': ['"DynaPuff"', 'cursive'],
        'suez': ['"Suez One"', 'serif'],
        'tomorrow': ['"Tomorrow"', 'sans serif'],
    },
  },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
    require("flowbite/plugin"),
    require("tw-elements/dist/plugin.cjs"),
    require("daisyui"),
  ],

  daisyui: {
    styled: false,
    themes: false,
    base: false,
    utils: true,
    logs: true,
  },
};
