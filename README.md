## headless-google-translate

Call google translate service using headless browser.


```coffeescript
translator = require('headless-google-translate')

my_tr = (str, cb) ->
  translator.tr 'en', 'zh-CN', str, cb

p = console.log

my_tr 'hello world', p
```

```
$ xvfb-run coffee hello_world.coffee
你好，世界
```

Since JSON is quite popular, you may happen to have your resource file in that
format.

```coffeescript
translator = require('headless-google-translate')

p = console.log

my_tr = (str, cb) ->
  translator.tr 'en', 'zh-CN', str, cb

obj =
  common: 'hello'
  header:
    title: 'support'
    body: 'about'

tree_map = (f, tree) ->
  return if typeof tree isnt 'object'
  new_tree = {}
  for k,v of tree
    new_tree[k] =
      switch typeof v
        when 'string'
          f v
        when 'object'
          tree_map f, v
  new_tree

do ->
  acc = []
  f = (x) -> acc.push x
  tree_map f, obj
  my_tr acc.join('\n'), (ret) ->
    acc = ret.split '\n'
    f = (x) -> "#{x} ==> #{acc.shift()}"
    new_en = tree_map f, obj
    p JSON.stringify(new_en, null, 2)
```

```
$ xvfb-run coffee tree.coffee
{
  "common": "hello ==> 你好",
  "header": {
    "title": "support ==> 支持",
    "body": "about ==> 关于"
  }
}
```
