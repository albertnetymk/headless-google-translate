exports = this

Nightmare = require('nightmare')
nightmare = Nightmare(show: false)

p = console.log

pretty_result = (str) ->
  str
    .replace(/<\/?span>/g, '')
    .replace(/<span title="[^"]*">/g, '')
    .replace(/<span [^>]*?>/g, '')
    .replace(/<br>/g, '\n')
    .replace(/ \&gt;/g, '>')
    .replace(/ \&lt;/g, '<')

exports.tr = (from, to, str, cb) ->
  url = "https://translate.google.com/##{from}/#{to}/" + encodeURIComponent(str)
  nightmare
    .goto(url)
    .wait(300)
    .evaluate(-> document.querySelector('#result_box').innerHTML)
    .end()
    .then (text) -> cb pretty_result text
