package = "log"
version = "0.0.2-1"
source = {
   url = "git://github.com/azdle/log.lua.git",
   tag = "0.0.2"
}
description = {
   summary = "A generic logging interface for lua",
   homepage = "https://github.com/azdle/log.lua",
   license = "CC0"
}
dependencies = {
   "lua >= 5.1",
}
build = {
   type = "builtin",
   modules = {
      log = "log.lua",
   }
}
