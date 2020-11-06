# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 16:09:37 2020

@author: PMAC
"""

texts = ["ALTAR KS",
         ]
for text in texts:
    
    
    output = ''
    chars = []
    for t in text:
        asm = ord(t) - 65
        if t == " ":
            char = "01"
            pass_flag = False
        else:
            try:
                temp = int(t)
                char = str(hex(135 + temp).replace("0x",""))
                pass_flag = False
            except:
                pass_flag = True
        if pass_flag:
            char = hex(int("91",base=16) + asm).replace("0x","")
        
        output+=char
        chars.append(char)
    # print("\n\n")
    # print(output)
    print("")
    output2 = 'db $' + ', $'.join(chars)
    print(output2)