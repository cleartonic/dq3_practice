memory.usememorydomain("WRAM")
filename = "output/"..os.clock()..".txt"


function writedata(data)
    file = io.open(filename,"a")
    io.output(file)
    io.write(data)
    io.close()
end

function clean_data(d)
    d = string.format("%x",d)
    if (string.len(d) == 1) then
        d = "0"..d
    end
    if (iter < limit - 1) then
        d = d..", $"
    end
    return d
end

writedata(";active party\ndb $")
iter = 0
limit = 96
base_addr = 0x0036E0
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n\n")


writedata(";party stats\ndb $")
iter = 0
limit = 512
base_addr = 0x003925
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n\n")


writedata(";event and chest flags\ndb $")
iter = 0
limit = 128
base_addr = 0x00353A
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n\n")

writedata(";bag items\ndb $")
iter = 0
limit = 32
base_addr = 0x003725
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n")


writedata(";bag item count\ndb $")
iter = 0
limit = 32
base_addr = 0x003825
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n\n")



writedata(";rura locations\ndb $")
iter = 0
limit = 3
base_addr = 0x003680
while iter < limit do
    d = memory.readbyte(base_addr + iter)
    d = clean_data(d)
    
    iter = iter + 1
    writedata(d)
end
writedata("\n\n")





while true do
    emu.frameadvance()
    gui.text(1,1,"Done")
end