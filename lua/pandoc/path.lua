vim = vim
M = {}

if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
    M.is_windows = true
else
    M.is_windows = false
end

if M.is_windows then
    M.sep = '\\'
    M.dirsep = ';'
else
    M.sep = '/'
    M.dirsep = ':'
end

function M.isabs(P)
    if M.is_windows then
        return string.sub(P,1,1) == '/' or string.sub(P,1,1)=='\\' or string.sub(P,2,2)==':'
    else
        return string.sub(P,1,1) == '/'
    end
end

function M.join(p1,p2,...)
    if select('#',...) > 0 then
        local p = M.join(p1,p2)
        local args = {...}
        for i = 1,#args do
            p = M.join(p,args[i])
        end
        return p
    end
    if M.isabs(p2) then return p2 end
    local endc = string.sub(p1,#p1,#p1)
    if endc ~= M.sep and endc ~= "" then
        p1 = p1..M.sep
    end
    return p1..p2
end

return M
