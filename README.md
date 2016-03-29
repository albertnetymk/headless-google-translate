## headless-google-translate

Call google translate service using headless browser.


```coffeescript
translator = require('./headless-google-translate')

my_tr = (str, cb) ->
  translator.tr 'en', 'zh-CN', str, cb

my_tr str, console.log
```

```
$ xvfb-run coffee test.coffee
你好，世界
```
