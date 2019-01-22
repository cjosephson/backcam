import output as o

with open("timestamps") as f:
    lines = f.readlines()    

lines = lines[3:-1]

times = []
for l in lines:              
    times.append((l.split()[7] ,l.split()[-1])) 

#print(times)
buckets = {}

for i,t  in enumerate(times):
    hour = t[0][0:2]
    if hour not in buckets:
        buckets[hour] = []
    buckets[hour].append((o.psnrs[i],o.diffs[i]*4))


order = ['22','23','00','01','02','03','04',
         '05','06','07','08','09','10','11']  
for h in order:
    h_diff = [i[1] for i in buckets[h] if i[1] != 0]
    h_psnr = [i[0] for i in buckets[h] if i[0] != 0]
    a_diff = (sum(h_diff)/len(h_diff))/(326*244.)
    a_psnr = sum(h_psnr)/len(h_psnr)
    # for a worst-case, assume new pixels are evenly spaced across the
    # image, which maximizes the number times we have to send (-1, pcount)
    compressed_size = (326*244.)/((sum(h_diff)/4.)/len(h_diff))
    uncompressed_size = (sum(h_diff)/len(h_diff))
    ratio = (326*244.)/(compressed_size+uncompressed_size)
    
    #print(h,a_diff,a_psnr, ratio)
    print(h, ratio)


