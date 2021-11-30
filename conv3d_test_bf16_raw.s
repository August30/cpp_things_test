"############################################################################\n"
"######                                                                      \n"
"###### conv3d_bf16_kernelho1wo1                                             \n"
"######                                                                      \n"
"############################################################################\n"
%{
    l.sraia r13, lhs_addr, 6                # in thread 0 address >> 6
%}
%{
    l.sllia r14, r13, 16                    # in thread 1 address << 16
%}
%{
    l.ora r13, r13, r14                     # in thread 0/1 address
%}
%{
    l.ldi_lo r15, 1                         # r15 = ((32 * BPE) >> 6) = 0x1
    c.movsr2tar [ta_g0, 0], r13             # in tar group 0, tar0, input_addr
%}
%{
    l.ldi_hi r15, 1                         # r15  = 0x10001
%}
%{
    l.addia.u r16, window_dilation_w, -1    # r16 = window_dilation_w - 1
    c.movsr2tar [ta_g0, 1], r15             # in tar group 0, tar1, input_offset1
%}
%{
    l.mula.s r16, Ci, r16                   # r16 = Ci * (window_dilation_w - 1)
%}
%{
    l.sraia r17, r16, 5                     # r17 = (Ci * (window_dilation_w - 1) * BPE >> 6)
%}
%{
    l.sllia r18, r17, 16                    # in thread 1 address << 16
%}
%{
    l.ora r18, r17, r18                     # in thread 0/1 address
%}
%{
    l.addia.u r19, window_dilation_h, -1    # r19 = window_dilation_h - 1
    c.movsr2tar [ta_g0, 2], r18             # in tar group 0, tar2, input_offset2
%}
%{
    l.mula.s r19, Ci, r19                   # r19 = Ci * (window_dilation_h - 1)
%}
%{
    l.mula.s r19, Wi, r19                   # r19 = Ci * Wi * (window_dilation_h - 1)
%}
%{
    l.suba.s r19, r19, r16                  # r19 = (Ci * Wi * (window_dilation_h - 1) - Ci * (window_dilation_w - 1))
%}
%{
    l.sraia r19, r19, 5                     # r19 = ((Ci * Wi * (window_dilation_h - 1) - Ci * (window_dilation_w - 1)) * BPE >> 6)
%}
%{
    l.sllia r20, r19, 16                    # in thread 1 address << 16
%}
%{
    l.ora r20, r19, r20                     # in thread 0/1 address
%}
%{
    l.sraia r21, rhs_addr, 6                # in thread 0 address >> 6
    c.movsr2tar [ta_g0, 3], r20             # in tar group 0, tar3, input_offset3
%}
%{
    l.addia.u r22, r21, 1                   # r21 = addr + 1
%}
%{
    l.sllia r22, r22, 16                    # in thread 1 address << 16
%}
%{
    l.ora r22, r21, r22                     # in thread 0/1 address
%}
%{
    l.ldi_lo r21, 2                         # r21 = ((64 * BPE) >> 6) = 0x2
    c.movsr2tar [ta_g1, 0], r22             # in tar group 1, tar0, weight_addr
%}
%{
    l.ldi_hi r21, 2                         # r21 = 0x20002
%}
%{
    c.movsr2tar [ta_g1, 1], r21             # in tar group 1, tar1, weight_offset
%}
%{
    l.sraia r13, out_addr, 6                # in thread 0 address >> 6
%}
%{
    l.addia.u r14, r13, 1                   # r21 = addr + 1
%}
%{
    l.sllia r14, r14, 16                    # in thread 1 address << 16
%}
%{
    l.ora r14, r13, r14                     # in thread 0/1 address
%}
%{
    c.movsr2tar [ta_g2, 0], r14             # in tar group 2, tar0
%}
%{
    c.movsr2tar [ta_g2, 1], r21             # in tar group 2, tar1 (output_offset)
%}
%{
    l.ldi16.s r13, 0
%}
%{
    c.movsr2spr VAB_LV_S, r13
%}
%{
    c.movsr2spr VAB_M_S1, r13
%}
%{
    c.movsr2spr VAB_M_D, r13
%}
%{
    l.beq r13, ld_flag, .LBB1_2
%}
# %bb.1:
%{
    l.ldi16.s r14, 1                        # r14 = 0x1
%}
%{
    c.movsr2spr NACCOVR, r14
%}
%{
    l.jal ld_flag, .LBB1_3
%}
.LBB1_2:
%{
    l.ldi_lo r14 1
%}
%{
    l.ldi_hi r14 1                          # r14 = 0x10001
%}
%{
    c.movsr2spr NACCOVR, r14
%}
%{
    l.ldi16.s r13, 0                        # r = 0
%}
%{
    l.ldi16.s r15, 0                        # s = 0
%}
%{
    l.ldi16.s r16, 0                        # ci = 0
}%
.LBB1_3:
%{
    l.blt.s r13, R, .LBB1_4                 # if r < R, jump .LBB1_4
%}
%{
    l.ldi16.s r14, 1                        # r14 = 1
%}
%{
    l.beq r14, st_flag, .LBB1_7             # end r, if st_flag == 1
%}
.LBB1_4:
%{
    l.blt.s r15, S, .LBB1_5                 # if s < S, jump .LBB1_5
%}
%{
    s.tivld.itar iv0, [tg_g0, 3]            # end s
}%
%{
    l.addia.u r13, r13, 1                   # r++
}%
%{
    l.jal r13, .LBB1_3                      # jump .LBB1_3
}%
.LBB1_5:
%{
    l.blt.s r16, Ci, .LBB1_6                # if ci < Ci, jump .LBB1_6
%}
%{
    l.tvsta.cvt2bf16 dacc0, [ta_g0, 2]      # end ci
}%
%{
    l.addia.u r15, r15, 1                   # s++
}%
%{
    l.jal r15, .LBB1_4                      # jump .LBB1_4
}%
.LBB1_6:
%{
    s.tivld.itar iv0, [tg_g0, 1]            # load input
}%
%{
    s.tvld.itar vr0, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr1, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr2, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr3, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr4, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr5, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr6, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr7, [tg_g1, 1]            # load weight
}%
%{
    s.tvld.itar vr8, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr0, 0      # read after write, 8 cycle
    s.tvld.itar vr9, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr1, 1      # read after write, 8 cycle
    s.tvld.itar vr10, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr2, 2      # read after write, 8 cycle
    s.tvld.itar vr11, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr3, 3      # read after write, 8 cycle
    s.tvld.itar vr12, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr4, 4      # read after write, 8 cycle
    s.tvld.itar vr13, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr5, 5      # read after write, 8 cycle
    s.tvld.itar vr14, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr6, 6      # read after write, 8 cycle
    s.tvld.itar vr15, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr7, 7      # read after write, 8 cycle
    s.tvld.itar vr16, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr8, 8      # read after write, 8 cycle
    s.tvld.itar vr17, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr9, 9      # read after write, 8 cycle
    s.tvld.itar vr18, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr10, 10      # read after write, 8 cycle
    s.tvld.itar vr19, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr11, 11      # read after write, 8 cycle
    s.tvld.itar vr20, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr12, 12      # read after write, 8 cycle
    s.tvld.itar vr21, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr13, 13      # read after write, 8 cycle
    s.tvld.itar vr22, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr14, 14      # read after write, 8 cycle
    s.tvld.itar vr23, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr15, 15      # read after write, 8 cycle
    s.tvld.itar vr24, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr16, 16      # read after write, 8 cycle
    s.tvld.itar vr25, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr17, 17      # read after write, 8 cycle
    s.tvld.itar vr26, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr18, 18      # read after write, 8 cycle
    s.tvld.itar vr27, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr19, 19     # read after write, 8 cycle
    s.tvld.itar vr28, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr20, 20      # read after write, 8 cycle
    s.tvld.itar vr29, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr21, 21      # read after write, 8 cycle
    s.tvld.itar vr30, [tg_g1, 1]            # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr22, 22      # read after write, 8 cycle
    s.tvld.itar vr31, [tg_g1, 1]             # load weight
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr23, 23      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr24, 24      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr25, 25      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr26, 26      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr27, 27      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr28, 28      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr29, 29      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr30, 30      # read after write, 8 cycle
}%
%{
    m.ldsmr.mode0.bf.row smr0, vr31, 31      # read after write, 8 cycle
}%
%{
    m.vmm.mode0.bf.vsel0 dacc0, iv0, smr0    # vmm
    l.ldi16.s r17, 1                        # r17 = 0x1
%}
%{
    l.addia.u r16, r16, 32                  # ci loop
    c.movsr2spr NACCOVR, r17
}%
%{
    l.jal r16, .LBB1_5                      # jump .LBB1_5
}%
.LBB1_7:
%{
    l.tvsta.cvt2bf16 dacc0, [ta_g2, 1]      
%}