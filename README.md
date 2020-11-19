# logface

This library is intended to be used as a lightweight logging facade. This is a
very early version that is only able to print log lines prefixed with the level
in brackets. In the future I hope to make this a pluggable system that allows
libraries to log using this library's interface, but allow end applications to
choose the logging backend that actually receives the log statements.

# Installing

logface can be installed using [luarocks](https://luarocks.org).

```bash
luarocks install logface
```

You may also simply download the file `log.lua` and place it in your working
directory.

# Use

```lua
local log = require "log"

log.info("Hello, world!")
```

Which will show:

```
[INFO] Hello, world!
```

The available levels are:

* `trace`
* `debug`
* `info`
* `warn`
* `error`
* `fatal`
* `print`

The default level is `INFO` (and higher).

The level can be set by setting the `LUALOG` environment to one of the above
levels (case insensitive) before logface is `require`d. (Adjusting the log level
later is not yet supported.)
