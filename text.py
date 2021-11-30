

if __name__ == "__main__":
    # for i in range(0, 256, 8):
    #     print("vacc%d, vacc%d, vacc%d, vacc%d, vacc%d, vacc%d, vacc%d, vacc%d" % (i, i+1, i+2, i+3, i+4, i+5, i+6, i+7))
    # for i in range(0, 256):
    #     print("vacc%d" % i)
    for i in range(0, 256):
        print("__dtu_l_tvsta_cvt2bf16(vacc%d, output_addr, output_offset);" % i)