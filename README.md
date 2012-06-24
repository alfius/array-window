Array window for Ruby
=====================

Overview
--------

This gem adds the "window" method to the Array class. This method can retrieve a subset of consecutive elements in the array, centered around a specified element when possible.

Installation
------------

```bash
  $ gem install array-window
```

Usage
-----

Definition:

```ruby
  Array.window(size, center, even_size_resolution)
```

- size: the desired size of the window
- center: the index of the element where the window should be centered
- even_size_resolution: the mechanism to use when deciding which elements should belong to the window when the size of the window is even:
  - :prioritize_greater (default)
  - :prioritize_lower

Sample session:

```ruby
  > require 'array/window'
  #=> true
  > %W(a b c d e f).window(3, 2) # window size: 3, centered in element: 2
  #=> ["b", "c", "d"]
  > (0..530).to_a.window(8, 528) # window size: 8, centered in element: 528
  #=> [523, 524, 525, 526, 527, 528, 529, 530]
  > (0..13).to_a.window(2, 9, :prioritize_lower) # window size: 2, centered in element: 9, retrieve more lower elements if possible
  #=> [8, 9]
```

License
-------

(The MIT License)

Copyright (c) 2012 Alfonso Cora

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

