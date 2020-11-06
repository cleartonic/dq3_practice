import pandas as pd
import math


df = pd.read_csv('../data/char_stats.csv')
for col in ['strength','agility','stamina','wisdom','luck']:
    df[col] = df[col].apply(lambda x: round(x))

# data comes from party_data.asm. the idea
# is to take the existing data from a savestate
# identify the party (manually below in text), reference the spreadsheets (data/char_stats.csv)
# on normalized averages, and find the matching character/level
# then apply the averages and return the asm 
# steps are
# 1 - copy and paste data from party_data.asm
# 2 - modify "chosen" list below for [hero mage thief warrior sage mage_warrior]
# 3 - run and copy/paste output back into party_data

# original data files from savestates are in the bizhawk folder for lua dq3 output
# in the event you want to restore the originals 

########################
######## TO DO  ########
########################

# HP/MP averages. Add them to the lists of ['strength','agility',...]
# and add them to data/char_stats.csv


########################
######## MODIFY ########
########################

t = '''
db $2d, $9a, $f8, $00, $c4, $00, $c4, $00, $1e, $00, $1e, $00, $5d, $1c, $58, $14, $29, $90, $4c, $26, $a0, $9c, $7f, $ac, $00, $00, $00, $00, $00, $00, $00, $44, $18, $08, $00, $02, $01, $83, $00, $60, $40, $20, $30, $e1, $01, $00, $05, $07, $1e, $45, $6e, $75, $93, $85, $bc, $00, $00, $00, $00, $00, $03, $00, $00, $00, $13, $00, $13, $00, $00, $00, $00, $00, $0b, $03, $0a, $0a, $07, $00, $00, $00, $00, $00, $46, $6b, $6d, $44, $ac, $00, $00, $00, $00, $00, $29, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $3d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $0a, $00, $0a, $00, $0d, $00, $0d, $00, $05, $10, $05, $07, $05, $00, $00, $00, $00, $00, $61, $e2, $76, $56, $ac, $00, $00, $00, $00, $e0, $24, $03, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $3d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $0b, $00, $0b, $00, $0e, $00, $0e, $00, $05, $09, $08, $0c, $05, $00, $00, $00, $00, $00, $6d, $7d, $e3, $ac, $00, $00, $00, $00, $00, $60, $2b, $02, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $3d, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $0c, $00, $0c, $00, $10, $00, $10, $00, $0e, $04, $06, $08, $04, $00, $00, $00, $00, $00, $0c, $0c, $ac, $00, $00, $00, $00, $00, $00, $a0, $22, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $2b, $a3, $bf, $00, $0b, $01, $0b, $01, $32, $00, $32, $00, $5c, $23, $96, $26, $26, $fe, $4c, $95, $97, $78, $11, $ac, $00, $00, $00, $00, $00, $00, $00, $e0, $26, $00, $0b, $25, $00, $e7, $01, $80, $32, $10, $f0, $00, $00, $00, $04, $08, $1c, $53, $6e, $7d, $30, $a3, $bc, $85, $00, $00, $00, $00, $27, $35, $12, $01, $cd, $00, $cd, $00, $4a, $00, $4a, $00, $41, $4a, $68, $2a, $2c, $68, $f3, $25, $14, $17, $0d, $ac, $00, $00, $00, $00, $00, $00, $00, $20, $22, $07, $15, $07, $07, $ef, $01, $f0, $fe, $03, $f1, $00, $1e, $00, $05, $09, $1f, $4b, $6d, $7d, $87, $2f, $30, $c5, $85, $00, $00, $00, $2b, $a3, $bf, $00, $1d, $01, $1d, $01, $00, $00, $00, $00, $5f, $11, $8c, $10, $10, $20, $b7, $9e, $dd, $ba, $0c, $0c, $0c, $0c, $ac, $00, $00, $00, $00, $c0, $26, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $05, $10, $53, $6e, $73, $38, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

'''
chosen = ['hero','mage_warrior','sage','warrior']













t_modified = t[:]
t = t[4:]
t = t.replace("\n","")


'''
Hero - 0:83
Mage - 1500:1583
Thief - 1800:1883
Warrior - 2100:2183
'''

hero_asm = t[0:83]
mage_asm = t[1500:1583]
thief_asm = t[1800:1883]
warrior_asm = t[2100:2183]


chars = {chosen[0]:hero_asm,
         chosen[1]:mage_asm,
         chosen[2]:thief_asm,
         chosen[3]:warrior_asm}


def stat_map(d, char_name):
    values = d[1:].split(", $")
    values = [int(i,base=16) for i in values]
    # print(values)
    stats = {'name':char_name,
             'level_asm':values[0],
             'exp':values[1] + values[2] * 255 + values[3] * (255*255),
             'max_hp':values[4] + values[5] * 255,
             'cur_hp':values[6] + values[7] * 255,
             'max_mp':values[8] + values[9] * 255,
             'cur_mp':values[10] + values[11] * 255,
             'strength':values[12],
             'agility':values[13],
             'stamina':values[14],
             'wisdom':values[15],
             'luck':values[16],
             'original_asm':d}
    return stats

stat_dict = {}    
for char in chars:
    stats = stat_map(chars[char],char)
    stat_dict[char] = stats
    print(stats)
    print("--------------------")

print("--------------------")
print("--------------------")
print("--------------------")


def normalize_char(char):
    lvl = math.trunc(stat_dict[char['name']]['level_asm']/2)
    
    row = df[(df['level']==lvl) & (df['char_en']==char['name'])].iloc[0]
    # print(row)
    for z in ['strength','agility','stamina','wisdom','luck','max_hp','max_mp']:
        stat_dict[char['name']][z] = row[z]
    stat_dict[char['name']]['cur_hp'] = row['max_hp']
    stat_dict[char['name']]['cur_mp'] = row['max_mp']
        

def rebuild_asm(stats):
    
    output_str = stats['original_asm'][0:20]
    
    hp = stats['max_hp']
    if hp > 255:
        hp1 = hex(hp-256).replace("0x","")
        if len(hp1) == 1:
            hp1 = "0" + hp1
        hp2 = "01"
    else:
        hp1 = hex(hp).replace("0x","")
        if len(hp1) == 1:
            hp1 = "0" + hp1
        hp2 = "00"
    
    new_hp = "$%s, $%s, $%s, $%s, " % (hp1,hp2,hp1,hp2)
    output_str += new_hp
    
    mp = stats['max_mp']
    if mp > 255:
        mp1 = hex(mp-256).replace("0x","")
        if len(mp1) == 1:
            mp1 = "0" + mp1
        mp2 = "01"
    else:
        mp1 = hex(mp).replace("0x","")
        if len(mp1) == 1:
            mp1 = "0" + mp1
        mp2 = "00"
    
    new_mp = "$%s, $%s, $%s, $%s, " % (mp1,mp2,mp1,mp2)
    output_str += new_mp
    
    for z in ['strength','agility','stamina','wisdom','luck']:
        new_stat = "$%s, " % hex(stats[z]).replace("0x","")
        if len(new_stat) == 4:
            new_stat = new_stat[0] + "0" + new_stat[1:]
        output_str += new_stat
    output_str = output_str[:-2]
    
    # print(stats['original_asm'])
    # print(output_str)
    stat_dict[char]['new_asm'] = output_str


for char, stats in stat_dict.items():
    normalize_char(stat_dict[char])
    rebuild_asm(stats)
    print(stat_dict[char])
    # print("--------------------")
    
    t_modified = t_modified.replace(stats['original_asm'],stats['new_asm'])
    
# print(t)
print(t_modified)






# t = t.replace("\n","")

# t2 = t.replace("$", "")

# output = ''
# d = {}
# num = 0
# while num < len(t2)*4:
#     try:
#         x = t2[num:num+2]
#         y = '%s, ' % int(x,base=16)
#         output += y
#         d[num] = y
#     except:
#         pass
#     num+=4
    
# print(output)