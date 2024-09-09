// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

import jquery from "jquery"
window.$ = jquery

document.addEventListener('DOMContentLoaded', () => {
  $('.article_title').on('click', () => {
    window.alert('CLICKED')
  })
})