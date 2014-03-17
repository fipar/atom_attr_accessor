atom_attr_accessor
==================

Ruby gem to provide accessor methods using clojure atoms.
This lets you create Ruby classes with thread safe instance
variables. 

usage
-

```ruby
require 'atom_attr_accessor'

class ThreadSafeEmployee
	atom_attr_accessor :id, :name, :salary

end

t = ThreadSafeEmployee.new
t.id = 1 # this will create a new Atom
t.id += 1 # this will invoke .reset on it
t.id # this will invoke deref on it
```

