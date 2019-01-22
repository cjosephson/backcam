from functools import reduce
decodeddt = []
extracteddt = []

# split hex string into groups of 2 characters
split = lambda hexstr: map(lambda i: hexstr[i:i+2], range(0, len(hexstr), 2))

# converts a line of hex dump to a string of 0 and 1
conv = lambda hexstr: reduce((lambda x, y: x + y), map(lambda h: (bin(int(h, 16))[2:].zfill(8))[::-1], split(hexstr.rstrip())))

# decode a 24-char str of 0 and 1 to an 8-char str using majority voting
voting = lambda binstr: reduce((lambda x, y: x + y), map(lambda idx: str(int(reduce((lambda x, y: x + y), map(lambda off: int(binstr[idx + off * 8]), range(3))) >= 2)), range(8)))

# decode a line of bin to a list of bytes (represented as int)
decode = lambda rawbin: map(lambda x: int(x, 2), map(voting, filter(lambda sli: len(sli) is 24, map(lambda st: rawbin[st:st+24], range(0, len(rawbin), 24)))))

# decode a hex line by match the leading 10010010
allign = lambda hexline: filter(lambda dt: next(dt) is 146, map(lambda skip: decode(conv(hexline)[skip:]), range(8-4, 8+5)))
