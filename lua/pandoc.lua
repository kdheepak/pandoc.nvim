vim = vim
local api = vim.api
local fn = vim.fn
path = require 'pandoc.path'

local function pandoc(ofiletype)
    if ofiletype == nil then
        ofiletype = 'html'
    end
    local ifilename = vim.fn.expand('%:p')
    local outputfolder = path.join(vim.fn.getcwd(0, 0), "build")
    if vim.fn.isdirectory(outputfolder) == 0 then
        vim.fn.mkdir(outputfolder)
    end
    local ofilename = path.join(outputfolder, vim.fn.expand('%:p:t:r'))
    local cmd = string.format("pandoc %s -o %s", ifilename, ofilename .. '.' .. ofiletype)
    vim.fn.jobstart(cmd)
end

return {
    pandoc = pandoc,
}
