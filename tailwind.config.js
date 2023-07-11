/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./resources/**/*.{vue,js,html}', './node_modules/flowbite/**/*.js'],
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [require('daisyui'), require('flowbite/plugin')],
}