const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      boxShadow: {
        neu1: '-5px -5px 15px 2px rgb(0 0 0 / 0.1)',
        neu2: '-5px -5px 10px 2px rgb(0.9 0.9 0.9 / 0.1)',
        innerneu1: 'inset -5px -5px 10px 2px rgb(0.9 0.9 0.9 / 1)',
        innerneu2: 'inset -5px -5px 15px 2px rgb(0 0 0 / 0.1)'
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
