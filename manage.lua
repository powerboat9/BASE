function discover(apps)
    local found = peripheral.getNames()
    local discovered = {}
    for _, pName in ipairs(found) do
        local isIn = {}
        for name, funct in pairs(apps) do
            if funct(pName) then
                local appElement = discovered.apps[name]
                discovered.apps[name] = appElement or {}
                discovered.apps[name][#appElement + 1] = pName
                isIn[#isIn + 1] = name
            end
        end
        discovered.index[pName] = isIn
    end
    return discovered
end
