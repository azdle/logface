local log = require "log"

-- don't have a good way to make sure this is all working fully as expected, so
-- just call each log function and make sure we don't error out.

log.trace("trace")
log.debug("debug")
log.info("info")
log.warn("warn")
log.error("error")
log.fatal("fatal")
log.print("print")
