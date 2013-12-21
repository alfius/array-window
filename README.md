Array window for Ruby
=====================

<a href="http://www.omniref.com/ruby/gems/array-window"><img src="http://assets2.omniref.com/assets/logo-1e25ba89780a42da4556dd96c03ac954.png" height="18" width="75"></a>

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
