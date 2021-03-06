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
-- TODO: provide interfaces to dynamically set log level
local currentloglevel = startuploglevel

local function defaultlogger(from, level, ...)
  if not currentloglevel then return end
  if level >= currentloglevel then
    local components = {}
    for _, v in ipairs({...}) do table.insert(components,tostring(v)) end

    print(string.format(
      "[%s]%s %s",
      loglevels[level],
      from and "("..from..")" or "",
      table.concat(components, "\t")
    ))
  end
end
local currentlogger = defaultlogger -- TODO: allow overriding

function log.print(...)
  currentlogger(nil, revlevels.PRINT, ...)
end

function log.fatal(...)
  currentlogger(nil, revlevels.FATAL, ...)
end

function log.error(...)
  currentlogger(nil, revlevels.ERROR, ...)
end

function log.warn(...)
  currentlogger(nil, revlevels.WARN, ...)
end

function log.info(...)
  currentlogger(nil, revlevels.INFO, ...)
end

function log.debug(...)
  currentlogger(nil, revlevels.DEBUG, ...)
end

function log.trace(...)
  currentlogger(nil, revlevels.TRACE, ...)
end

return log
