file = open("ratings.dat.copy")
ToFile = open('ratings2.dat', 'w')

for line in file:
    line = line.replace("::", ":")
    ToFile.write(line)

ToFile.close()
file.close()
