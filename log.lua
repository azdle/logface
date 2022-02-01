local log = {}

local loglevels = {
  "TRACE",
  "DEBUG",
  "INFO",
  "WARN",
  "ERROR",
  "FATAL",
  "PRINT",
}

local revlevels = {}
for i, level in ipairs(loglevels) do revlevels[level] = i end

local startuploglevel = os and os.getenv
                           and revlevels[string.upper(os.getenv("LUALOG") or "")]

local currentloglevel = startuploglevel

local function defaultlogger(opts, ...)
  if not currentloglevel then return end
  if opts.level >= currentloglevel then
    local components = {}
    for _, v in ipairs({...}) do table.insert(components,tostring(v)) end

    print(string.format(
      "[%s]%s %s",
      loglevels[opts.level],
      opts.from and "("..opts.from..")" or "",
      table.concat(components, "\t")
    ))
  end
end
local currentlogger = defaultlogger -- TODO: allow overriding

function log.print(...)
  currentlogger({level = revlevels.PRINT}, ...)
end

function log.fatal(...)
  currentlogger({level = revlevels.FATAL}, ...)
end

function log.error(...)
  currentlogger({level = revlevels.ERROR}, ...)
end

function log.warn(...)
  currentlogger({level = revlevels.WARN}, ...)
end

function log.info(...)
  currentlogger({level = revlevels.INFO}, ...)
end

function log.debug(...)
  currentlogger({level = revlevels.DEBUG}, ...)
end

function log.trace(...)
  currentlogger({level = revlevels.TRACE}, ...)
end

function log.setLogLevel(level)
  currentloglevel = level
end

function log.setLogger(logger)
  currentlogger = logger
end

return log
