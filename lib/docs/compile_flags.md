# [`inline_const_cache`](#inline_const_cache)

_(On by default)_


Adds the `opt_getinlinecache` instruction before calling `getconstant` on the constant this function is referencing.

```
CONSTANT = 123

def foo(bar)
  bar * CONSTANT
end
```

Without the flag Ruby generates:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
0000 putobject 123 ( 1)[Li]
0002 putspecialobject 3
0004 setconstant :CONSTANT
0006 definemethod :foo, foo ( 3)[Li]
0009 putobject :foo
0011 leave

== disasm: #<ISeq:foo@<compiled>:3 (3,0)-(5,3)> (catch: FALSE)
local table (size: 1, argc: 1 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] bar@0<Arg>
0000 getlocal bar@0, 0 ( 4)[LiCa]
0003 putnil
0004 putobject true
0006 getconstant :CONSTANT
0008 send <calldata!mid:*, argc:1, ARGS_SIMPLE>, nil
0011 leave ( 5)[Re]
```

With this flag Ruby generates:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
0000 putobject 123 ( 1)[Li]
0002 putspecialobject 3
0004 setconstant :CONSTANT
0006 definemethod :foo, foo ( 3)[Li]
0009 putobject :foo
0011 leave

== disasm: #<ISeq:foo@<compiled>:3 (3,0)-(5,3)> (catch: FALSE)
local table (size: 1, argc: 1 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] bar@0<Arg>
0000 getlocal bar@0, 0 ( 4)[LiCa]
0003 opt_getinlinecache 12, <is:0>
0006 putobject true
0008 getconstant :CONSTANT
0010 opt_setinlinecache <is:0>
0012 send <calldata!mid:*, argc:1, ARGS_SIMPLE>, nil
0015 leave ( 5)[Re]
```

[Try it!](http://localhost:3000/explores?code=CONSTANT+%3D+123%0A%0Adef+foo%28bar%29%0A++bar+%2A+CONSTANT%0Aend%0A&coverage_enabled=false&debug_frozen_string_literal=false&frozen_string_literal=false&inline_const_cache=true&instructions_unification=false&operands_unification=false&peephole_optimization=false&specialized_instruction=false&stack_caching=false&tailcall_optimization=false)

# [`peephole_optimization`](#peephole_optimization)

_(On by default)_

This flag causes ruby to eliminate `jump` instructions that jump to the same location that Ruby was going to go next anyways.

```
def foo(bar)
  if nil
  end
  bar
end
```

Without the flag Ruby generates:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
0000 definemethod :foo, foo ( 1)[Li]
0003 putobject :foo
0005 leave

== disasm: #<ISeq:foo@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
local table (size: 1, argc: 1 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] bar@0<Arg>
0000 jump 2 ( 2)[LiCa]
0002 getlocal bar@0, 0 ( 4)[Li]
0005 leave ( 5)[Re]
```

With the flag Ruby generates:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
0000 definemethod :foo, foo ( 1)[Li]
0003 putobject :foo
0005 leave

== disasm: #<ISeq:foo@<compiled>:1 (1,0)-(5,3)> (catch: FALSE)
local table (size: 1, argc: 1 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] bar@0<Arg>
0000 getlocal bar@0, 0 ( 4)[LiCa]
0003 leave ( 5)[Re]
```

[try it!](http://localhost:3000/explores?code=def+foo%28bar%29%0A++if+nil%0A++end%0A++bar%0Aend&coverage_enabled=false&debug_frozen_string_literal=false&frozen_string_literal=false&inline_const_cache=false&instructions_unification=false&operands_unification=false&peephole_optimization=true&specialized_instruction=false&stack_caching=false&tailcall_optimization=false)

# [`tailcall_optimization`](#tailcall_optimization)

_(Off by default)_

# [`specialized_instruction`](#specialized_instruction)

_(On by default)_

# [`tailcall_optimization`](#tailcall_optimization)

_(On by default)_

```
def foo(bar)
  if bar == 0
    0
  else
    foo(bar - 1)
  end
end
```

TODO: I need help understanding this one. It seems to only happen with peephole optimizations and adds `TAILCALL` to send to a method call to itself at the end of a function `0028 send <calldata!mid:puts, argc:1, FCALL|ARGS_SIMPLE|TAILCALL>, nil`

# [`operands_unification`](#operands_unification)

_(Off by default)_

# [`instructions_unification`](#instructions_unification)

_(Off by default)_

# [`stack_caching`](#stack_caching)

_(Off by default)_

# [`frozen_string_literal`](#frozen_string_literal)

_(Off by default)_

# [`debug_frozen_string_literal`](#debug_frozen_string_literal)

_(Off by default)_

# [`coverage_enabled`](#coverage_enabled)

_(On by default)_
