;; 助记符索引: mnemonic -> ((encoding-id template constraints) ...)
;; 生成命令: racket tool/extract/cache-rebuilder.rkt

(stp
  ("STP_32_ldstpair_post" "WZR, WZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_S_ldstpair_post" "SUInteger, SUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_D_ldstpair_post" "DUInteger, DUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_32_ldstpair_off" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_S_ldstpair_off" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_D_ldstpair_off" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_32_ldstpair_pre" "WZR, WZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_S_ldstpair_pre" "SUInteger, SUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_D_ldstpair_pre" "DUInteger, DUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sunpklo
  ("sunpklo_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldp
  ("LDP_32_ldstpair_post" "WZR, WZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_S_ldstpair_post" "SUInteger, SUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_D_ldstpair_post" "DUInteger, DUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_32_ldstpair_off" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_S_ldstpair_off" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_D_ldstpair_off" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_32_ldstpair_pre" "WZR, WZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_S_ldstpair_pre" "SUInteger, SUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_D_ldstpair_pre" "DUInteger, DUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(blraaz
  ("BLRAAZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(sqcvtu
  ("sqcvtu_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqcvtu_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(sabdl
  ("SABDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmrt
  ("CPYFMRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpymt
  ("CPYMT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfpwn
  ("CPYFPWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(zipq2
  ("zipq2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld1sw
  ("ld1sw_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sw_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cbz
  ("CBZ_32_compbranch" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("CBZ_64_compbranch" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
)

(casalt
  ("CASALT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(usubwb
  ("usubwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sttxr
  ("STTXR_SR32_ldstexclr_unpriv" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTXR_SR64_ldstexclr_unpriv" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgoptn
  ("SETGOPTN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsswppl
  ("RCWSSWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sha1p
  ("SHA1P_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(addhn
  ("ADDHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtrsw
  ("LDTRSW_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fminv
  ("fminv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("FMINV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uxth
  ("uxth_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uxth_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldnf1b
  ("ldnf1b_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1b_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1b_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1b_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(autibsppcr
  ("AUTIBSPPCR_64LRR_dp_1src" "XZR" (("Rn" (reg-range 0 31))))
)

(str
  ("str_p_bi_" "PUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Pt" (reg-range 0 15))))
  ("str_z_bi_" "ZUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("str_za_ri_" "ZA[WUInteger, UInteger, [SP]" (("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
  ("str_zt_br_" "ZT0, [SP]" (("Rn" (reg-range 0 31))))
  ("STR_B_ldst_immpost" "BUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_Q_ldst_immpost" "QUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_H_ldst_immpost" "HUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_S_ldst_immpost" "SUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_D_ldst_immpost" "DUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_B_ldst_immpre" "BUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_Q_ldst_immpre" "QUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_H_ldst_immpre" "HUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_S_ldst_immpre" "SUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_D_ldst_immpre" "DUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_B_ldst_regoff" "BUInteger, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_BL_ldst_regoff" "BUInteger, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_Q_ldst_regoff" "QUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_H_ldst_regoff" "HUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_S_ldst_regoff" "SUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_D_ldst_regoff" "DUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_B_ldst_pos" "BUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_Q_ldst_pos" "QUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_H_ldst_pos" "HUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_S_ldst_pos" "SUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STR_D_ldst_pos" "DUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(blr
  ("BLR_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(ctermeq
  ("ctermeq_rr_" "WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(ldumaxl
  ("LDUMAXL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMAXL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfmin
  ("LDBFMIN_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(usmmla
  ("usmmla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("USMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(orrs
  ("orrs_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(ld1rsw
  ("ld1rsw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(bfm
  ("BFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(f1cvtl
  ("f1cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("F1CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmrtn
  ("CPYFMRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cblt
  ("CBLT_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBLT_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(shadd
  ("shadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(crc32w
  ("CRC32W_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfmop4s
  ("bfmop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4s_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(stur
  ("STUR_B_ldst_unscaled" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_Q_ldst_unscaled" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_H_ldst_unscaled" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_S_ldst_unscaled" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STUR_D_ldst_unscaled" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqrshr
  ("uqrshr_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("uqrshr_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(sqxtn
  ("SQXTN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQXTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(adr
  ("adr_z_az_d_s32_scaled" "ZUInteger.D, [Z UInteger .D Z UInteger .D SXTW]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("adr_z_az_d_u32_scaled" "ZUInteger.D, [Z UInteger .D Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("adr_z_az_sd_same_scaled" "ZUInteger.S, [Z UInteger . S Z UInteger . S]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ADR_only_pcreladdr" "XZR, SInteger" (("immlo" (imm-range 0 3 1)) ("immhi" (imm-range 0 524287 1)) ("Rd" (reg-range 0 31))))
)

(cpyert
  ("CPYERT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cntp
  ("cntp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
  ("cntp_r_pn_" "XUInteger, PNUInteger.B, VLx2" (("size" (element-size B H S D)) ("PNn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
)

(decb
  ("decb_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(cpymtrn
  ("CPYMTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(gcsb
  ("GCSB_HD_hints" "DSYNC" ())
)

(setgmtn
  ("SETGMTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsseta
  ("RCWSSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sel
  ("sel_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sel_p_p_pp_" "PUInteger.B, PUInteger, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("sel_mz_p_zz_2" "{Z UInteger . B - Z UInteger . B}, PNUInteger, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("sel_mz_p_zz_4" "{Z UInteger . B - Z UInteger . B}, PNUInteger, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
)

(nbsl
  ("nbsl_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(compact
  ("compact_z_p_z_s" "ZUInteger.B, PUInteger, ZUInteger.B" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("compact_z_p_z_" "ZUInteger.S, PUInteger, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(smlal
  ("smlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("smlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("smlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("smlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("smlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("smlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("SMLAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(strb
  ("STRB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sm3partw2
  ("SM3PARTW2_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sysp
  ("SYSP_CR_syspairinstrs" "UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
)

(ldfmaxnmal
  ("LDFMAXNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNMAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNMAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(autibsppc
  ("AUTIBSPPC_only_dp_1src_imm" "SInteger" (("imm16" (imm-range 0 65535 1))))
)

(fscale
  ("fscale_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fscale_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fscale_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("fscale_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fscale_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FSCALE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSCALE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stlurb
  ("STLURB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sbcs
  ("SBCS_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SBCS_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st1
  ("ST1_asisdlse_R4_4v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlse_R3_3v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlse_R1_1v" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlse_R2_2v" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_R4_r4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_R3_r3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_R1_r1" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_R2_r2" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_I4_i4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_I3_i3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_I1_i1" "{V UInteger . 8B}, [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsep_I2_i2" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlso_B1_1b" "{V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlso_H1_1h" "{V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlso_S1_1s" "{V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlso_D1_1d" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_BX1_r1b" "{V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_HX1_r1h" "{V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_SX1_r1s" "{V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_DX1_r1d" "{V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_B1_i1b" "{V UInteger . B}, [UInteger], [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_H1_i1h" "{V UInteger . H}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_S1_i1s" "{V UInteger . S}, [UInteger], [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST1_asisdlsop_D1_i1d" "{V UInteger . D}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rprfm
  ("RPRFM_R_ldst_regoff" "PLDKEEP, XZR, [SP]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtn
  ("fcvtn_z8_mz2_h2b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("fcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("fcvtn_z8_mz4_" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("FCVTN_asimdsame2_H" "VUInteger.8B, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTN_asimdsame2_D" "VUInteger.8B, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTN_asimdmisc_N" "VUInteger.4H, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwscaspl
  ("RCWSCASPL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mad
  ("mad_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(umullb
  ("umullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("umullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("umullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rcwswppal
  ("RCWSWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stbfminl
  ("STBFMINL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(setget
  ("SETGET_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sm3tt1a
  ("SM3TT1A_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cbhgt
  ("CBHGT_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(sqdecp
  ("sqdecp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("sqdecp_r_p_r_sx" "XUInteger, PUInteger.B, WUInteger" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
  ("sqdecp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(umlalt
  ("umlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cpyfewtrn
  ("CPYFEWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(nmatch
  ("nmatch_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(sxtw
  ("sxtw_z_p_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sxtw_z_p_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fcvtl
  ("fcvtl_mz2_z_" "{Z UInteger .S- Z UInteger .S}, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("FCVTL_asimdmisc_L" "VUInteger.4S, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldclr
  ("LDCLR_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(addsvl
  ("addsvl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(ld3q
  ("ld3q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld3q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldsetb
  ("LDSETB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(st2h
  ("st2h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st2h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(udf
  ("UDF_only_perm_undef" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(rcwssetpal
  ("RCWSSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(orns
  ("orns_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(ld1roh
  ("ld1roh_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1roh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(st3
  ("ST3_asisdlse_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsep_R3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsep_I3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlso_B3_3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlso_H3_3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlso_S3_3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlso_D3_3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_BX3_r3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_HX3_r3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_SX3_r3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_DX3_r3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_B3_i3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_H3_i3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 6" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_S3_i3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 12" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST3_asisdlsop_D3_i3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 24" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stxrb
  ("STXRB_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsswpal
  ("RCWSSWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(srhadd
  ("srhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SRHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcmeq
  ("fcmeq_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("fcmeq_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FCMEQ_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMEQ_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtzun
  ("fcvtzun_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
)

(bif
  ("BIF_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpymn
  ("CPYMN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frecps
  ("frecps_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRECPS_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPS_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cmla
  ("cmla_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("cmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("cmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(tchangeb
  ("TCHANGEB_tc_reg" "UInteger, XUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TCHANGEB_tc_imm" "UInteger, UInteger" (("imm7" (imm-range 0 127 1)) ("Rd" (reg-range 0 31))))
)

(cpyfpwt
  ("CPYFPWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwswpp
  ("RCWSWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uvdot
  ("uvdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("uvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("uvdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(psb
  ("PSB_HC_hints" "CSYNC" ())
)

(cmle
  ("CMLE_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMLE_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmwtwn
  ("CPYFMWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtpu
  ("FCVTPU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lastp
  ("lastp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
)

(ldsetlb
  ("LDSETLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fnmad
  ("fnmad_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(smull
  ("SMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(udivr
  ("udivr_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(eortb
  ("eortb_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fsub
  ("fsub_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fsub_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fsub_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fsub_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fsub_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fsub_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fsub_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("FSUB_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSUB_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSUB_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSUB_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSUB_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwswpal
  ("RCWSWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldfmaxnm
  ("LDFMAXNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNM_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNM_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfpt
  ("CPYFPT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtps
  ("FCVTPS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTPS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfminnml
  ("LDFMINNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNML_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNML_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqsub
  ("uqsub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uqsub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("uqsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UQSUB_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uaddw
  ("UADDW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(texit
  ("TEXIT_te_branch_reg" "" ())
)

(fcvtzu
  ("fcvtzu_z_p_z_s2wz" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_d2wz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_s2xz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_d2xz" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162hz" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162wz" "ZUInteger.S, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162xz" "ZUInteger.D, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_s2w" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_d2w" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_s2x" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_d2x" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162h" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162w" "ZUInteger.S, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_z_p_z_fp162x" "ZUInteger.D, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzu_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("fcvtzu_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FCVTZU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32S_float2fix" "WZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32D_float2fix" "WZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32H_float2fix" "WZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64S_float2fix" "XZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64D_float2fix" "XZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64H_float2fix" "XZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uabal
  ("uabal_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("UABAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyewn
  ("CPYEWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rshrn
  ("RSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldnf1h
  ("ldnf1h_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1h_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1h_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(casal
  ("CASAL_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASAL_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyertn
  ("CPYERTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(movt
  ("movt_r_zt_" "XUInteger, ZT0[UInteger" (("off3" (imm-range 0 7 1)) ("Rt" (reg-range 0 31))))
  ("movt_zt_r_" "ZT0[UInteger, XUInteger" (("off3" (imm-range 0 7 1)) ("Rt" (reg-range 0 31))))
  ("movt_zt_z_" "ZT0, ZUInteger" (("off2" (imm-range 0 3 1)) ("Zt" (reg-range 0 31))))
)

(uxtb
  ("uxtb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uxtb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fmsb
  ("fmsb_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(sha1h
  ("SHA1H_SS_cryptosha2" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldraa
  ("LDRAA_64_ldst_pac" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRAA_64W_ldst_pac" "XZR, [SP], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(st3b
  ("st3b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st3b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(uhadd
  ("uhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldlarb
  ("LDLARB_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqshlr
  ("uqshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(fnmla
  ("fnmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(st1w
  ("st1w_z_p_br_u128" "{Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_br_" "{Z UInteger . S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bi_u128" "{Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_z_p_bi_" "{Z UInteger . S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1w_za_p_rrr_" "{ZA UInteger H .S [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
)

(aesdimc
  ("aesdimc_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
  ("aesdimc_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
)

(uqrshl
  ("uqrshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UQRSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumaxh
  ("LDUMAXH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fminp
  ("fminp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FMINP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyprtn
  ("CPYPRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ftmad
  ("ftmad_z_zzi_" "ZUInteger.H, ZUInteger.H, ZUInteger.H, UInteger" (("size" (element-size B H S D)) ("imm3" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(fcmne
  ("fcmne_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("fcmne_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(ldlarh
  ("LDLARH_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(f1cvt
  ("f1cvt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("f1cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
)

(scvtflt
  ("scvtflt_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(smulh
  ("smulh_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("smulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SMULH_64_dp_3src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smmla
  ("smmla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(urecpe
  ("urecpe_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("urecpe_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("URECPE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st3d
  ("st3d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st3d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(csdb
  ("CSDB_HI_hints" "" ())
)

(swppl
  ("SWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(f2cvtlt
  ("f2cvtlt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(bfadd
  ("bfadd_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfadd_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfadd_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(fvdotb
  ("fvdotb_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger, VGx4], {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
)

(ldset
  ("LDSET_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsclra
  ("RCWSCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgen
  ("SETGEN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ftssel
  ("ftssel_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldfadd
  ("LDFADD_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADD_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADD_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcmgt
  ("fcmgt_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("fcmgt_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FCMGT_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGT_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stfmaxnml
  ("STFMAXNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXNML_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXNML_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(csinv
  ("CSINV_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CSINV_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(shsubr
  ("shsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(addspl
  ("addspl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(autdza
  ("AUTDZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(uaba
  ("uaba_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("UABA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stlurh
  ("STLURH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmpne
  ("cmpne_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpne_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpne_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(fmlal
  ("fmlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlal_za_z8z8i_1" "ZA.H[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8i_2xi" "ZA.H[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8i_4xi" "ZA.H[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8v_2x1" "ZA.H[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8v_4x1" "ZA.H[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8v_1" "ZA.H[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8w_2x2" "ZA.H[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("fmlal_za_z8z8w_4x4" "ZA.H[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("FMLAL_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLAL_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cbbgt
  ("CBBGT_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(cas
  ("CAS_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CAS_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(casah
  ("CASAH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(irg
  ("IRG_64I_dp_2src" "SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(eretaa
  ("ERETAA_64E_branch_reg" "" ())
)

(msubpt
  ("MSUBPT_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumaxlb
  ("LDUMAXLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldnf1d
  ("ldnf1d_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ld2r
  ("LD2R_asisdlso_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2R_asisdlsop_RX2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2R_asisdlsop_R2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsetlh
  ("LDSETLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqdmlslbt
  ("sqdmlslbt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(braa
  ("BRAA_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
)

(rcwclrpal
  ("RCWCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(suqadd
  ("suqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SUQADD_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUQADD_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldclralh
  ("LDCLRALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rev
  ("rev_z_z_" "ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("rev_p_p_" "PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("REV_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("REV_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmull
  ("SQDMULL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st1q
  ("st1q_z_p_ar_d_64_unscaled" "{Z UInteger .Q}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1q_za_p_rrr_" "{ZA UInteger H .Q [W UInteger 0]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(addg
  ("ADDG_64_addsub_immtags" "SP, SP, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cmeq
  ("CMEQ_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMEQ_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMEQ_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMEQ_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setp
  ("SETP_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(usqadd
  ("usqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("USQADD_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("USQADD_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cnt
  ("cnt_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("cnt_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("CNT_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CNT_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CNT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqincp
  ("sqincp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("sqincp_r_p_r_sx" "XUInteger, PUInteger.B, WUInteger" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
  ("sqincp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(umull
  ("UMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldapurb
  ("LDAPURB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ssubwb
  ("ssubwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cpyewtn
  ("CPYEWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rsubhnb
  ("rsubhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldar
  ("LDAR_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAR_LR64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sabd
  ("sabd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SABD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umlalb
  ("umlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(rcwsswpa
  ("RCWSSWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldfadda
  ("LDFADDA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cntb
  ("cntb_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
)

(fdiv
  ("fdiv_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FDIV_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDIV_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDIV_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDIV_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDIV_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdecb
  ("sqdecb_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqdecb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(cmphs
  ("cmphs_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmphs_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmphs_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(autizb
  ("AUTIZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(fminqv
  ("fminqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(bit
  ("BIT_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmlslt
  ("sqdmlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cbhi
  ("CBHI_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBHI_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBHI_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBHI_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(sbc
  ("SBC_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SBC_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfetrn
  ("CPYFETRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyetrn
  ("CPYETRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmwtrn
  ("CPYFMWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtzs
  ("fcvtzs_z_p_z_s2wz" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_d2wz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_s2xz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_d2xz" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162hz" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162wz" "ZUInteger.S, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162xz" "ZUInteger.D, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_s2w" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_d2w" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_s2x" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_d2x" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162h" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162w" "ZUInteger.S, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_z_p_z_fp162x" "ZUInteger.D, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtzs_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("fcvtzs_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FCVTZS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32S_float2fix" "WZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32D_float2fix" "WZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32H_float2fix" "WZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64S_float2fix" "XZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64D_float2fix" "XZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64H_float2fix" "XZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTZS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqincd
  ("uqincd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqincd_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqincd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(addhnb
  ("addhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld1rqb
  ("ld1rqb_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rqb_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldbfminnma
  ("LDBFMINNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smlalb
  ("smlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(tchangef
  ("TCHANGEF_tc_reg" "UInteger, XUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TCHANGEF_tc_imm" "UInteger, UInteger" (("imm7" (imm-range 0 127 1)) ("Rd" (reg-range 0 31))))
)

(ldarb
  ("LDARB_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwswpl
  ("RCWSWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(decp
  ("decp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("decp_r_p_r_" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(stbfminnml
  ("STBFMINNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(ldap
  ("LDAP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsminlh
  ("LDSMINLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsminal
  ("LDSMINAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMINAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmop4a
  ("bfmop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("bfmop4a_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(setgopt
  ("SETGOPT_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpypt
  ("CPYPT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(whilele
  ("whilele_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilele_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilele_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(brk
  ("BRK_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(ldnt1sb
  ("ldnt1sb_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1sb_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(stnt1b
  ("stnt1b_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1b_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1b_z_p_br_contiguous" "{Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1b_z_p_bi_contiguous" "{Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("stnt1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(rcwscas
  ("RCWSCAS_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stnt1d
  ("stnt1d_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1d_z_p_br_contiguous" "{Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1d_z_p_bi_contiguous" "{Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("stnt1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(umlslt
  ("umlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldapursw
  ("LDAPURSW_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmaxnmv
  ("fmaxnmv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("FMAXNMV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNMV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(index
  ("index_z_ii_" "ZUInteger.B, SInteger, SInteger" (("size" (element-size B H S D)) ("imm5b" (imm-range 0 31 1)) ("imm5" (imm-range 0 31 1)) ("Zd" (reg-range 0 31))))
  ("index_z_ri_" "ZUInteger.B, WZR, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("index_z_ir_" "ZUInteger.B, SInteger, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("imm5" (imm-range 0 31 1)) ("Zd" (reg-range 0 31))))
  ("index_z_rr_" "ZUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sqneg
  ("sqneg_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqneg_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SQNEG_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQNEG_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtp
  ("LDTP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(caspa
  ("CASPA_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASPA_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1rqd
  ("ld1rqd_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rqd_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sqdmulh
  ("sqdmulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmulh_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmulh_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmulh_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmulh_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("sqdmulh_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("sqdmulh_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("sqdmulh_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("SQDMULH_asisdsame_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULH_asimdsame_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMULH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autia
  ("AUTIA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umax
  ("umax_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("umax_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("umax_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("umax_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("umax_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("umax_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("UMAX_32U_minmax_imm" "WZR, WZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMAX_64U_minmax_imm" "XZR, XZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMAX_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMAX_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMAX_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldarh
  ("LDARH_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclra
  ("LDCLRA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgopn
  ("SETGOPN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(prfm
  ("PRFM_P_loadlit" "PLDL1KEEP, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("PRFM_P_ldst_regoff" "PLDL1KEEP, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("PRFM_P_ldst_pos" "PLDL1KEEP, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(whilewr
  ("whilewr_p_rr_" "PUInteger.B, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(ldaddab
  ("LDADDAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldtr
  ("LDTR_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTR_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sev
  ("SEV_HI_hints" "" ())
)

(umop4s
  ("umop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(uqinch
  ("uqinch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqinch_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqinch_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ssubl
  ("SSUBL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(asrd
  ("asrd_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
)

(frecpe
  ("frecpe_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRECPE_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPE_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPE_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqxtnb
  ("sqxtnb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sqshlu
  ("sqshlu_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("SQSHLU_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHLU_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sminp
  ("sminp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SMINP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyewt
  ("CPYEWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsminah
  ("LDSMINAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgoet
  ("SETGOET_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(clastb
  ("clastb_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("clastb_v_p_z_" "BUInteger, PUInteger, BUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
  ("clastb_r_p_z_" "WZR, PUInteger, WZR, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Rdn" (reg-range 0 31))))
)

(st3h
  ("st3h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st3h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(casab
  ("CASAB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfminnmal
  ("LDBFMINNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uzpq1
  ("uzpq1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldsminh
  ("LDSMINH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyertrn
  ("CPYERTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sm3ss1
  ("SM3SS1_VVV4_crypto4" "VUInteger.4S, VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgp
  ("SETGP_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umlall
  ("umlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlall_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlall_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("umlall_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("umlall_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("umlall_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlall_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("umlall_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlall_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(sttr
  ("STTR_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTR_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sm3tt2a
  ("SM3TT2A_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtclr
  ("LDTCLR_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTCLR_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldgm
  ("LDGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(trn1
  ("trn1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("trn1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("trn1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("TRN1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtns
  ("FCVTNS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pmullb
  ("pmullb_z_zz_q" "ZUInteger.Q, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("pmullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld4q
  ("ld4q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld4q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cmplt
  ("cmplt_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmplt_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(whilerw
  ("whilerw_p_rr_" "PUInteger.B, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(ftsmul
  ("ftsmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cbhs
  ("CBHS_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBHS_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(fjcvtzs
  ("FJCVTZS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(punpklo
  ("punpklo_p_p_" "PUInteger.H, PUInteger.B" (("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(cmphi
  ("cmphi_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmphi_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmphi_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(cnth
  ("cnth_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
)

(dech
  ("dech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("dech_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(sqdech
  ("sqdech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqdech_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqdech_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(sqinch
  ("sqinch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqinch_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqinch_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(setgoen
  ("SETGOEN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(brabz
  ("BRABZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(fnmsub
  ("FNMSUB_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMSUB_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMSUB_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(whilehs
  ("whilehs_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilehs_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilehs_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(fcvtnu
  ("FCVTNU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTNU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqrshrn
  ("sqrshrn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshrn_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshrn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("SQRSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(mvni
  ("MVNI_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
  ("MVNI_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
  ("MVNI_asimdimm_M_sm" "VUInteger.2S, UInteger, MSL, 8" (("Rd" (reg-range 0 31))))
)

(usublb
  ("usublb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cbgt
  ("CBGT_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBGT_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBGT_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBGT_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(ldbfminal
  ("LDBFMINAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uhsub
  ("uhsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UHSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bcax
  ("bcax_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("BCAX_VVV16_crypto4" "VUInteger.16B, VUInteger.16B, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsminlb
  ("LDSMINLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smops
  ("smops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("smops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("smops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(fcvtxn
  ("FCVTXN_asisdmisc_N" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTXN_asimdmisc_N" "VUInteger.2S, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swpalb
  ("SWPALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stnt1h
  ("stnt1h_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1h_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1h_z_p_br_contiguous" "{Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1h_z_p_bi_contiguous" "{Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("stnt1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(incw
  ("incw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("incw_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(saddv
  ("saddv_r_p_z_" "DUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(cntd
  ("cntd_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
)

(clrex
  ("CLREX_BN_barriers" "" ())
)

(sqdecd
  ("sqdecd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqdecd_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqdecd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(swpta
  ("SWPTA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPTA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmlal2
  ("FMLAL2_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLAL2_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subps
  ("SUBPS_64S_dp_2src" "XZR, SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldnt1w
  ("ldnt1w_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1w_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1w_z_p_bi_contiguous" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1w_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ldnt1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(lduminab
  ("LDUMINAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uaddwb
  ("uaddwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldxrh
  ("LDXRH_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtzsn
  ("fcvtzsn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
)

(uadalp
  ("uadalp_z_p_z_" "ZUInteger.H, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("UADALP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqincp
  ("uqincp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("uqincp_r_p_r_uw" "WUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
  ("uqincp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(blrabz
  ("BLRABZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(decd
  ("decd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("decd_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldapurh
  ("LDAPURH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(lastb
  ("lastb_v_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("lastb_r_p_z_" "WZR, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(extr
  ("EXTR_32_extract" "WZR, WZR, WZR, UInteger" (("Rm" (reg-range 0 31)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EXTR_64_extract" "XZR, XZR, XZR, UInteger" (("Rm" (reg-range 0 31)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(prfw
  ("prfw_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfw_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfw_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfw_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfw_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfw_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfw_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(autiasp
  ("AUTIASP_HI_hints" "" ())
)

(b
  ("B_only_condbranch" "SInteger" (("imm19" (imm-range 0 524287 1))))
  ("B_only_branch_imm" "SInteger" (("imm26" (imm-range 0 67108863 1))))
)

(sqincb
  ("sqincb_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqincb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(movz
  ("MOVZ_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
  ("MOVZ_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
)

(uabalt
  ("uabalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ssra
  ("ssra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sminv
  ("sminv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("SMINV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpypn
  ("CPYPN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwssetpl
  ("RCWSSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmax
  ("bfmax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfmax_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmax_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("bfmax_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmax_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
)

(umlsll
  ("umlsll_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlsll_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlsll_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlsll_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlsll_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("umlsll_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("umlsll_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("umlsll_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlsll_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("umlsll_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("umlsll_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(adds
  ("ADDS_32S_addsub_imm" "WZR, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDS_64S_addsub_imm" "XZR, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDS_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDS_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDS_32S_addsub_ext" "WZR, WSP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDS_64S_addsub_ext" "XZR, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st64b
  ("ST64B_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsminab
  ("LDSMINAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldeora
  ("LDEORA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDEORA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uhsubr
  ("uhsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(zip
  ("zip_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("zip_mz_zz_2q" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("zip_mz_z_4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("zip_mz_z_4q" "{Z UInteger .Q- Z UInteger .Q}, {Z UInteger .Q- Z UInteger .Q}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
)

(usubl
  ("USUBL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfmaxnma
  ("LDFMAXNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNMA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNMA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpymwtwn
  ("CPYMWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqincd
  ("sqincd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqincd_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqincd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(pacib
  ("PACIB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfmaxnm
  ("LDBFMAXNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmaxnmp
  ("fmaxnmp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FMAXNMP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNMP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNMP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNMP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwclrl
  ("RCWCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsminb
  ("LDSMINB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sttp
  ("STTP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ctermne
  ("ctermne_rr_" "WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(ldnt1sh
  ("ldnt1sh_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1sh_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ld3w
  ("ld3w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld3w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sevl
  ("SEVL_HI_hints" "" ())
)

(sha1su1
  ("SHA1SU1_VV_cryptosha2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swpa
  ("SWPA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmlallbb
  ("fmlallbb_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlallbb_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALLBB_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALLBB_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlslt
  ("fmlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlslt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldbfadda
  ("LDBFADDA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(facgt
  ("facgt_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FACGT_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGT_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGT_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGT_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqrdmlsh
  ("sqrdmlsh_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlsh_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlsh_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlsh_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SQRDMLSH_asisdsame2_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLSH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLSH_asimdsame2_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLSH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlallbt
  ("fmlallbt_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlallbt_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALLBT_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALLBT_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(gcssttr
  ("GCSSTTR_64_ldst_gcs" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1b
  ("ld1b_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_br_u8" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1b_za_p_rrr_" "{ZA0 H .B [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
)

(sudot
  ("sudot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sudot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sudot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sudot_za_zzv_s2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sudot_za_zzv_s4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("SUDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldur
  ("LDUR_B_ldst_unscaled" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_Q_ldst_unscaled" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_H_ldst_unscaled" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_S_ldst_unscaled" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUR_D_ldst_unscaled" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sm4ekey
  ("sm4ekey_z_zz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SM4EKEY_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpymwn
  ("CPYMWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uabdlt
  ("uabdlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldaxr
  ("LDAXR_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAXR_LR64_ldstexclr" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsetl
  ("RCWSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cbbne
  ("CBBNE_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(stfminnml
  ("STFMINNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINNML_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINNML_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(umlal
  ("umlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("umlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("umlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("umlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("umlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("umlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("UMLAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(srshl
  ("srshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("srshl_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("srshl_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("srshl_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("srshl_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("SRSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddlt
  ("saddlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fdup
  ("fdup_z_i_" "ZUInteger.H, Real" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
)

(cpyprt
  ("CPYPRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sumlall
  ("sumlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("sumlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("sumlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("sumlall_za_zzv_s2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("sumlall_za_zzv_s4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
)

(ushll
  ("USHLL_asimdshf_L" "VUInteger.8H, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sli
  ("sli_z_zzi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SLI_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SLI_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfertwn
  ("CPYFERTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfcvt
  ("bfcvt_z_p_z_s2bfz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfcvt_z_p_z_s2bf" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("bfcvt_z8_mz2_" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("BFCVT_BS_floatdp1" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld1d
  ("ld1d_z_p_bi_u128" "{Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_br_u128" "{Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1d_za_p_rrr_" "{ZA UInteger H .D [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(pacibsp
  ("PACIBSP_HI_hints" "" ())
)

(cpyptn
  ("CPYPTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stllr
  ("STLLR_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLLR_SL64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mla
  ("mla_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mla_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("MLA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("MLA_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(braaz
  ("BRAAZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(cpymtn
  ("CPYMTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwclr
  ("RCWCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmple
  ("cmple_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmple_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(cpyet
  ("CPYET_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqxtnb
  ("uqxtnb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldff1b
  ("ldff1b_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_br_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1b_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(udot
  ("udot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z16_zzz_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z32_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z32_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_z16_zzzi_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("udot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("udot_za32_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("udot_za32_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("udot_za32_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("udot_za32_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("udot_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("udot_za32_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("UDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umulh
  ("umulh_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("umulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("UMULH_64_dp_3src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smlall
  ("smlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlall_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlall_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("smlall_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("smlall_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("smlall_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlall_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("smlall_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlall_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(sqshrnt
  ("sqshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(autibz
  ("AUTIBZ_HI_hints" "" ())
)

(ldurh
  ("LDURH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcmla
  ("fcmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fcmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fcmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FCMLA_asimdsame2_C" "VUInteger.4H, VUInteger.4H, VUInteger.4H, 0" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLA_advsimd_elt" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger], 0" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ssubltb
  ("ssubltb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(mrrs
  ("MRRS_RS_systemmovepr" "XZR, XUInteger, ACTLR_EL3" (("Rt" (reg-range 0 31))))
)

(ldumaxalh
  ("LDUMAXALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ands
  ("ands_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("ANDS_32S_log_imm" "WZR, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ANDS_64S_log_imm" "XZR, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ANDS_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ANDS_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddl
  ("SADDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fminnmv
  ("fminnmv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("FMINNMV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNMV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(urhadd
  ("urhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("URHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frint32x
  ("frint32x_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frint32x_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINT32X_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT32X_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT32X_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddlp
  ("SADDLP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(adclt
  ("adclt_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(uqsubr
  ("uqsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldfminnma
  ("LDFMINNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNMA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNMA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldtadd
  ("LDTADD_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTADD_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldtxr
  ("LDTXR_LR32_ldstexclr_unpriv" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTXR_LR64_ldstexclr_unpriv" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(caspalt
  ("CASPALT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(raddhnb
  ("raddhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(uabalb
  ("uabalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(eret
  ("ERET_64E_branch_reg" "" ())
)

(lsrv
  ("LSRV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("LSRV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sumops
  ("sumops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("sumops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(uqadd
  ("uqadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uqadd_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("uqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UQADD_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcadd
  ("fcadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H, 90" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FCADD_asimdsame2_C" "VUInteger.4H, VUInteger.4H, VUInteger.4H, 90" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sub
  ("sub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("sub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("sub_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sub_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sub_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sub_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sub_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sub_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("SUB_32_addsub_imm" "WSP, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_64_addsub_imm" "SP, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_32_addsub_ext" "WSP, WSP, WZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_64_addsub_ext" "SP, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(nands
  ("nands_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(uqincb
  ("uqincb_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqincb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldaxp
  ("LDAXP_LP32_ldstexclp" "WZR, WZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAXP_LP64_ldstexclp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmul
  ("bfmul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfmul_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfmul_mz_zzw_2x2" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("bfmul_mz_zzw_4x4" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("bfmul_mz_zzv_2x1" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("bfmul_mz_zzv_4x1" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
)

(bfmlsl
  ("bfmlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("bfmlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("bfmlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("bfmlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("bfmlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("bfmlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
)

(ldclral
  ("LDCLRAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(msub
  ("MSUB_32A_dp_3src" "WZR, WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("MSUB_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyprn
  ("CPYPRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpymrtn
  ("CPYMRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwswppl
  ("RCWSWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldumin
  ("LDUMIN_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMIN_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uaddwt
  ("uaddwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cbbhi
  ("CBBHI_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(stbfmaxnml
  ("STBFMAXNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(pmullt
  ("pmullt_z_zz_q" "ZUInteger.Q, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("pmullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(frint32z
  ("frint32z_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frint32z_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINT32Z_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT32Z_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT32Z_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqincw
  ("sqincw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqincw_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqincw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(hvc
  ("HVC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(swppal
  ("SWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclrpa
  ("LDCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cnot
  ("cnot_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("cnot_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld1h
  ("ld1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1h_za_p_rrr_" "{ZA UInteger H .H [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
)

(ld1rqh
  ("ld1rqh_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rqh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldsetpa
  ("LDSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pacia1716
  ("PACIA1716_HI_hints" "" ())
)

(rax1
  ("rax1_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("RAX1_VVV2_cryptosha512_3" "VUInteger.2D, VUInteger.2D, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmaxqv
  ("fmaxqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(smullb
  ("smullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("smullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("smullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(yield
  ("YIELD_HI_hints" "" ())
)

(rcwcasp
  ("RCWCASP_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(crc32b
  ("CRC32B_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwcasl
  ("RCWCASL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stgm
  ("STGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cbhne
  ("CBHNE_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(umaxp
  ("umaxp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UMAXP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ucvtf
  ("ucvtf_z_p_z_w2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_w2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_h2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_w2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_w2s" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_w2d" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2d" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_h2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_w2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_p_z_x2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ucvtf_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("ucvtf_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("UCVTF_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_S32_float2fix" "SUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_D32_float2fix" "DUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_H32_float2fix" "HUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_S64_float2fix" "SUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_D64_float2fix" "DUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_H64_float2fix" "HUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_D32_float2int" "DUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_S64_float2int" "SUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_sisd_32D" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_sisd_32H" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_sisd_64H" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UCVTF_sisd_64S" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(xar
  ("xar_z_zzi_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("XAR_VVV2_crypto3_imm6" "VUInteger.2D, VUInteger.2D, VUInteger.2D, UInteger" (("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bc
  ("BC_only_condbranch" "SInteger" (("imm19" (imm-range 0 524287 1))))
)

(pacdza
  ("PACDZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(sqrdcmlah
  ("sqrdcmlah_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdcmlah_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdcmlah_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(st3w
  ("st3w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st3w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(setmt
  ("SETMT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smsubl
  ("SMSUBL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldff1sw
  ("ldff1sw_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sw_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sw_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sw_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sw_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sw_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(luti6
  ("luti6_z_zzz_8" "ZUInteger.B, {Z UInteger .B Z UInteger .B}, ZUInteger" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti6_z_zzz_16" "ZUInteger.H, {Z UInteger .H Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti6_z_ztz_" "ZUInteger.B, ZT0, ZUInteger" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti6_mz4_ztmz3_1" "{Z UInteger .B - Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("luti6_mz4_ztmz3_4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 3))))
  ("luti6_mz4_zmz2_1" "{Z UInteger .H - Z UInteger .H}, {Z UInteger .H Z UInteger .H}, {Z UInteger - Z UInteger}, [UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
  ("luti6_mz4_zmz2_4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, {Z UInteger .H Z UInteger .H}, {Z UInteger - Z UInteger}, [UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
)

(revw
  ("revw_z_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("revw_z_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stfminl
  ("STFMINL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(stbfaddl
  ("STBFADDL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(smlalt
  ("smlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cfinv
  ("CFINV_M_pstate" "" ())
)

(sumop4a
  ("sumop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(rdvl
  ("rdvl_r_i_" "XUInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(rcwsetpl
  ("RCWSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclrah
  ("LDCLRAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(brkns
  ("brkns_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pdm" (reg-range 0 15))))
)

(st1b
  ("st1b_z_p_br_" "{Z UInteger . B}, PUInteger, [SP X UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_z_p_bi_" "{Z UInteger . B}, PUInteger, [SP]" (("size" (element-size B H S D)) ("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1b_za_p_rrr_" "{ZA0 H .B [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
)

(ldtaddl
  ("LDTADDL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTADDL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pacnbiasppc
  ("PACNBIASPPC_64LR_dp_1src" "" ())
)

(hint
  ("HINT_HM_hints" "UInteger" ())
)

(cpyen
  ("CPYEN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subp
  ("subp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SUBP_64S_dp_2src" "XZR, SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bf1cvtlt
  ("bf1cvtlt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cmgt
  ("CMGT_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGT_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGT_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGT_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldaddalh
  ("LDADDALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmad
  ("fmad_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(setf8
  ("SETF8_only_setf" "WZR" (("Rn" (reg-range 0 31))))
)

(ldeorl
  ("LDEORL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDEORL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmin
  ("bfmin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfmin_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmin_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("bfmin_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmin_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
)

(cpyfmtrn
  ("CPYFMTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lsrr
  ("lsrr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldumaxalb
  ("LDUMAXALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pacib171615
  ("PACIB171615_64LR_dp_1src" "" ())
)

(sha256su1
  ("SHA256SU1_VVV_cryptosha3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fabs
  ("fabs_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fabs_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FABS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABS_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABS_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABS_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumax
  ("LDUMAX_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMAX_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(addvl
  ("addvl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(tbx
  ("tbx_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("TBX_asimdtbl_L1_1" "VUInteger.8B, {V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBX_asimdtbl_L2_2" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBX_asimdtbl_L3_3" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBX_asimdtbl_L4_4" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqcvt
  ("sqcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqcvt_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(luti2
  ("luti2_z_zz_8" "ZUInteger.B, {Z UInteger .B}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti2_z_zz_16" "ZUInteger.H, {Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti2_mz2_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("luti2_mz4_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
  ("luti2_z_ztz_" "ZUInteger.B, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti2_mz2_ztz_8" "{Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
  ("luti2_mz4_ztz_4" "{Z UInteger . B Z UInteger . B Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
  ("LUTI2_asimdtbl_L5" "VUInteger.16B, {V UInteger . 16B}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("LUTI2_asimdtbl_L6" "VUInteger.8H, {V UInteger . 8H}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sshllb
  ("sshllb_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ssubw
  ("SSUBW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcmle
  ("fcmle_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FCMLE_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLE_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLE_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLE_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(whilelt
  ("whilelt_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilelt_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilelt_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(tbz
  ("TBZ_only_testbranch" "WZR, UInteger, SInteger" (("imm14" (imm-range 0 16383 1)) ("Rt" (reg-range 0 31))))
)

(rcwclrp
  ("RCWCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(casb
  ("CASB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ssubwt
  ("ssubwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rev16
  ("REV16_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("REV16_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("REV16_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fnmul
  ("FNMUL_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMUL_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMUL_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld1rw
  ("ld1rw_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rw_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sabalb
  ("sabalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(usvdot
  ("usvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(cbhhi
  ("CBHHI_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(ldtnp
  ("LDTNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwscasa
  ("RCWSCASA_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mova
  ("mova_za_p_rz_b" "ZA0H.B[WUInteger, UInteger, PUInteger/M, ZUInteger.B" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
  ("mova_za_p_rz_h" "ZAUIntegerH.H[WUInteger, UInteger, PUInteger/M, ZUInteger.H" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("mova_za_p_rz_w" "ZAUIntegerH.S[WUInteger, UInteger, PUInteger/M, ZUInteger.S" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("mova_za_p_rz_d" "ZAUIntegerH.D[WUInteger, UInteger, PUInteger/M, ZUInteger.D" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("mova_za_p_rz_q" "ZAUIntegerH.Q[WUInteger, 0, PUInteger/M, ZUInteger.Q" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("mova_za2_z_b1" "ZA0H.B[WUInteger, UInteger:UInteger, {Z UInteger .B- Z UInteger .B}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("mova_za2_z_h1" "ZAUIntegerH.H[WUInteger, UInteger:UInteger, {Z UInteger .H- Z UInteger .H}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("mova_za2_z_w1" "ZAUIntegerH.S[WUInteger, UInteger:UInteger, {Z UInteger .S- Z UInteger .S}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 15))))
  ("mova_za2_z_d1" "ZAUIntegerH.D[WUInteger, 0:1, {Z UInteger .D- Z UInteger .D}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 15))))
  ("mova_za4_z_b1" "ZA0H.B[WUInteger, UInteger:UInteger, {Z UInteger .B- Z UInteger .B}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("mova_za4_z_h1" "ZAUIntegerH.H[WUInteger, UInteger:UInteger, {Z UInteger .H- Z UInteger .H}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 7))))
  ("mova_za4_z_w1" "ZAUIntegerH.S[WUInteger, 0:3, {Z UInteger .S- Z UInteger .S}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 7))))
  ("mova_za4_z_d1" "ZAUIntegerH.D[WUInteger, 0:3, {Z UInteger .D- Z UInteger .D}" (("Rs" (reg-range 0 3)) ("Zn" (reg-range 0 7))))
  ("mova_za_mz2_1" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .D- Z UInteger .D}" (("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("mova_za_mz4_1" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .D- Z UInteger .D}" (("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("mova_z_p_rza_b" "ZUInteger.B, PUInteger/M, ZA0H.B[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off4" (imm-range 0 15 1)) ("Zd" (reg-range 0 31))))
  ("mova_z_p_rza_h" "ZUInteger.H, PUInteger/M, ZAUIntegerH.H[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 31))))
  ("mova_z_p_rza_w" "ZUInteger.S, PUInteger/M, ZAUIntegerH.S[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 31))))
  ("mova_z_p_rza_d" "ZUInteger.D, PUInteger/M, ZAUIntegerH.D[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("mova_z_p_rza_q" "ZUInteger.Q, PUInteger/M, ZAUIntegerH.Q[WUInteger, 0" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("mova_mz2_za_b1" "{Z UInteger .B- Z UInteger .B}, ZA0H.B[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 15))))
  ("mova_mz2_za_h1" "{Z UInteger .H- Z UInteger .H}, ZAUIntegerH.H[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 15))))
  ("mova_mz2_za_w1" "{Z UInteger .S- Z UInteger .S}, ZAUIntegerH.S[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 15))))
  ("mova_mz2_za_d1" "{Z UInteger .D- Z UInteger .D}, ZAUIntegerH.D[WUInteger, 0:1" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 15))))
  ("mova_mz4_za_b1" "{Z UInteger .B- Z UInteger .B}, ZA0H.B[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 7))))
  ("mova_mz4_za_h1" "{Z UInteger .H- Z UInteger .H}, ZAUIntegerH.H[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("mova_mz4_za_w1" "{Z UInteger .S- Z UInteger .S}, ZAUIntegerH.S[WUInteger, 0:3" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("mova_mz4_za_d1" "{Z UInteger .D- Z UInteger .D}, ZAUIntegerH.D[WUInteger, 0:3" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("mova_mz_za2_1" "{Z UInteger .D- Z UInteger .D}, ZA.D[WUInteger, UInteger, VGx2" (("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 15))))
  ("mova_mz_za4_1" "{Z UInteger .D- Z UInteger .D}, ZA.D[WUInteger, UInteger, VGx4" (("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 7))))
)

(caspat
  ("CASPAT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsset
  ("RCWSSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cls
  ("cls_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("cls_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("CLS_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CLS_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CLS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setmn
  ("SETMN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsclr
  ("RCWSCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldeorh
  ("LDEORH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fminnmp
  ("fminnmp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FMINNMP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNMP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNMP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNMP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(gmi
  ("GMI_64G_dp_2src" "XZR, SP, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(movaz
  ("movaz_z_rza_b" "ZUInteger.B, ZA0H.B[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off4" (imm-range 0 15 1)) ("Zd" (reg-range 0 31))))
  ("movaz_z_rza_h" "ZUInteger.H, ZAUIntegerH.H[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 31))))
  ("movaz_z_rza_w" "ZUInteger.S, ZAUIntegerH.S[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 31))))
  ("movaz_z_rza_d" "ZUInteger.D, ZAUIntegerH.D[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 31))))
  ("movaz_z_rza_q" "ZUInteger.Q, ZAUIntegerH.Q[WUInteger, 0" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 31))))
  ("movaz_mz2_za_b1" "{Z UInteger .B- Z UInteger .B}, ZA0H.B[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 15))))
  ("movaz_mz2_za_h1" "{Z UInteger .H- Z UInteger .H}, ZAUIntegerH.H[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 15))))
  ("movaz_mz2_za_w1" "{Z UInteger .S- Z UInteger .S}, ZAUIntegerH.S[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 15))))
  ("movaz_mz2_za_d1" "{Z UInteger .D- Z UInteger .D}, ZAUIntegerH.D[WUInteger, 0:1" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 15))))
  ("movaz_mz4_za_b1" "{Z UInteger .B- Z UInteger .B}, ZA0H.B[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 7))))
  ("movaz_mz4_za_h1" "{Z UInteger .H- Z UInteger .H}, ZAUIntegerH.H[WUInteger, UInteger:UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("movaz_mz4_za_w1" "{Z UInteger .S- Z UInteger .S}, ZAUIntegerH.S[WUInteger, 0:3" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("movaz_mz4_za_d1" "{Z UInteger .D- Z UInteger .D}, ZAUIntegerH.D[WUInteger, 0:3" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 7))))
  ("movaz_mz_za2_1" "{Z UInteger .D- Z UInteger .D}, ZA.D[WUInteger, UInteger, VGx2" (("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 15))))
  ("movaz_mz_za4_1" "{Z UInteger .D- Z UInteger .D}, ZA.D[WUInteger, UInteger, VGx4" (("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 7))))
)

(luti4
  ("luti4_z_zz_8" "ZUInteger.B, {Z UInteger .B}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti4_z_zz_2x16" "ZUInteger.H, {Z UInteger .H Z UInteger . H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti4_z_zz_1x16" "ZUInteger.H, {Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti4_mz2_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("luti4_mz4_ztz_1" "{Z UInteger . H - Z UInteger . H}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
  ("luti4_z_ztz_" "ZUInteger.B, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("luti4_mz4_ztmz2_1" "{Z UInteger .B- Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
  ("luti4_mz2_ztz_8" "{Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
  ("luti4_mz4_ztz_4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
  ("luti4_mz4_ztmz2_4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 3))))
  ("LUTI4_asimdtbl_L7" "VUInteger.8H, {V UInteger . 8H V UInteger . 8H}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("LUTI4_asimdtbl_L5" "VUInteger.16B, {V UInteger . 16B}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmlsl
  ("SQDMLSL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLSL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLSL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setmtn
  ("SETMTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(xpacd
  ("XPACD_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(msb
  ("msb_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(swpalh
  ("SWPALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cbhhs
  ("CBHHS_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(crc32cx
  ("CRC32CX_64C_dp_2src" "WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subhnt
  ("subhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fmop4s
  ("fmop4s_za_zz_s1x1" "ZAUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_s1x2" "ZAUInteger.S, ZUInteger.S, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_s2x2" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_d1x1" "ZAUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_d1x2" "ZAUInteger.D, ZUInteger.D, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_d2x1" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4s_za_zz_d2x2" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(autda
  ("AUTDA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpym
  ("CPYM_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(blrab
  ("BLRAB_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
)

(aesd
  ("aesd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("aesd_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
  ("aesd_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
  ("AESD_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsmaxa
  ("LDSMAXA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMAXA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cash
  ("CASH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld2b
  ("ld2b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld2b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(rcwclrpl
  ("RCWCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(shll
  ("SHLL_asimdmisc_S" "VUInteger.8H, VUInteger.8B, 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fdot
  ("fdot_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_z_zz8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_z32_zz8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_z_zz8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_z32_zz8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fdot_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8i_2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8i_4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fdot_za32_z8z8i_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8v_2x1" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za32_z8z8v_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8v_4x1" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za32_z8z8v_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8w_2x2" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za32_z8z8w_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fdot_za_z8z8w_4x4" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fdot_za32_z8z8w_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("FDOT_asimdsame2_DD" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDOT_asimdsame2_D" "VUInteger.4H, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDOT_asimdsame2_FP16FP32" "VUInteger.2S, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDOT_asimdelem_G" "VUInteger.4H, VUInteger.8B, VUInteger.2B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FDOT_asimdelem_FP16FP32" "VUInteger.2S, VUInteger.4H, VUInteger.2H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmopa
  ("fmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmopa_za32_pp_z8z8_8" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmopa_za16_pp_z8z8_8" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmopa_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(cpyewtwn
  ("CPYEWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(flogb
  ("flogb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("flogb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(autia1716
  ("AUTIA1716_HI_hints" "" ())
)

(famin
  ("famin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("famin_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("famin_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FAMIN_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FAMIN_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(dcps1
  ("DCPS1_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
)

(bfmaxnm
  ("bfmaxnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfmaxnm_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmaxnm_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("bfmaxnm_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfmaxnm_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
)

(cbne
  ("CBNE_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBNE_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBNE_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBNE_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(rcwsswppal
  ("RCWSSWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(dup
  ("dup_z_zi_" "ZUInteger.Q, ZUInteger.Q[UInteger]" (("imm2" (imm-range 0 3 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("dup_z_r_" "ZUInteger.B, WSP" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("dup_z_i_" "ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
  ("DUP_asisdone_only" "BUInteger, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("DUP_asimdins_DV_v" "VUInteger.8B, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("DUP_asimdins_DR_r" "VUInteger.8B, WZR" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stbfadd
  ("STBFADD_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(hlt
  ("HLT_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(ldumina
  ("LDUMINA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMINA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldr
  ("ldr_p_bi_" "PUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Pt" (reg-range 0 15))))
  ("ldr_z_bi_" "ZUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldr_za_ri_" "ZA[WUInteger, UInteger, [SP]" (("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
  ("ldr_zt_br_" "ZT0, [SP]" (("Rn" (reg-range 0 31))))
  ("LDR_32_loadlit" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDR_S_loadlit" "SUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDR_64_loadlit" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDR_D_loadlit" "DUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDR_Q_loadlit" "QUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDR_B_ldst_immpost" "BUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_Q_ldst_immpost" "QUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_H_ldst_immpost" "HUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_S_ldst_immpost" "SUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_D_ldst_immpost" "DUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_B_ldst_immpre" "BUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_Q_ldst_immpre" "QUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_H_ldst_immpre" "HUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_S_ldst_immpre" "SUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_D_ldst_immpre" "DUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_B_ldst_regoff" "BUInteger, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_BL_ldst_regoff" "BUInteger, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_Q_ldst_regoff" "QUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_H_ldst_regoff" "HUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_S_ldst_regoff" "SUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_D_ldst_regoff" "DUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_B_ldst_pos" "BUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_Q_ldst_pos" "QUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_H_ldst_pos" "HUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_S_ldst_pos" "SUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDR_D_ldst_pos" "DUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfp
  ("CPYFP_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(movi
  ("MOVI_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
  ("MOVI_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
  ("MOVI_asimdimm_M_sm" "VUInteger.2S, UInteger, MSL, 8" (("Rd" (reg-range 0 31))))
  ("MOVI_asimdimm_N_b" "VUInteger.8B, UInteger, LSL, 0" (("Rd" (reg-range 0 31))))
  ("MOVI_asimdimm_D_ds" "DUInteger, UInteger" (("Rd" (reg-range 0 31))))
  ("MOVI_asimdimm_D2_d" "VUInteger.2D, UInteger" (("Rd" (reg-range 0 31))))
)

(adcs
  ("ADCS_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADCS_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(match
  ("match_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(whilegt
  ("whilegt_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilegt_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilegt_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(fvdott
  ("fvdott_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger, VGx4], {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
)

(cpyfetwn
  ("CPYFETWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(tblq
  ("tblq_z_zz_" "ZUInteger.B, {Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld2d
  ("ld2d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld2d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(stmopa
  ("stmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("stmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(rbit
  ("rbit_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("rbit_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("RBIT_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("RBIT_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("RBIT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frintn
  ("frintn_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintn_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintn_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("frintn_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FRINTN_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTN_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTN_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTN_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTN_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsetpal
  ("LDSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1sh
  ("ld1sh_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sh_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sqxtnt
  ("sqxtnt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sttnp
  ("STTNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STTNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtlt
  ("fcvtlt_z_p_z_h2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtlt_z_p_z_s2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtlt_z_p_z_h2s" "ZUInteger.S, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtlt_z_p_z_s2d" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fccmpe
  ("FCCMPE_S_floatccmp" "SUInteger, SUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCCMPE_D_floatccmp" "DUInteger, DUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCCMPE_H_floatccmp" "HUInteger, HUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(caspal
  ("CASPAL_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASPAL_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bftmopa
  ("bftmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("bftmopa_za_zzzi_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(cpyfprtrn
  ("CPYFPRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(raddhnt
  ("raddhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(st2b
  ("st2b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st2b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(eors
  ("eors_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(brkpa
  ("brkpa_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(bext
  ("bext_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stbfminnm
  ("STBFMINNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(fmmla
  ("fmmla_z32_zz8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmmla_z16_zz8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmmla_z_zzz_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmmla_z32_zzz_h" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmmla_z_zzz_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmmla_z_zzz_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMMLA_asimd_FP16FP16" "VUInteger.8H, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMMLA_asimd_FP8FP16" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMMLA_asimd_FP16FP32" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMMLA_asimd_FP8FP32" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subr
  ("subr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("subr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
)

(ldapp
  ("LDAPP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(strh
  ("STRH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STRH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldfmaxl
  ("LDFMAXL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldtclral
  ("LDTCLRAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTCLRAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sunpk
  ("sunpk_mz_z_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("sunpk_mz_z_4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
)

(fmsub
  ("FMSUB_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMSUB_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMSUB_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(paciza
  ("PACIZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(fmin
  ("fmin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fmin_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fmin_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmin_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("fmin_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmin_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FMIN_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMIN_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMIN_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMIN_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMIN_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfprtn
  ("CPYFPRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldaddalb
  ("LDADDALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldapr
  ("LDAPR_32L_ldapstl_writeback" "WZR, [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPR_64L_ldapstl_writeback" "XZR, [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPR_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPR_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqrshlr
  ("sqrshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(st2d
  ("st2d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st2d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(shsub
  ("shsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SHSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld2h
  ("ld2h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld2h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(frintp
  ("frintp_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintp_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintp_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("frintp_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FRINTP_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTP_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTP_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTP_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTP_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pacia171615
  ("PACIA171615_64LR_dp_1src" "" ())
)

(setgpt
  ("SETGPT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld1r
  ("LD1R_asisdlso_R1" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1R_asisdlsop_RX1_r" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1R_asisdlsop_R1_i" "{V UInteger . 8B}, [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfmaxa
  ("LDBFMAXA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldrsh
  ("LDRSH_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sha256h
  ("SHA256H_QQV_cryptosha3" "QUInteger, QUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(f2cvtl
  ("f2cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("F2CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld3
  ("LD3_asisdlse_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsep_R3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsep_I3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlso_B3_3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlso_H3_3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlso_S3_3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlso_D3_3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_BX3_r3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_HX3_r3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_SX3_r3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_DX3_r3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_B3_i3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_H3_i3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 6" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_S3_i3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 12" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3_asisdlsop_D3_i3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 24" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sttrh
  ("STTRH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(tsb
  ("TSB_HC_hints" "CSYNC" ())
)

(sysl
  ("SYSL_RC_systeminstrs" "XZR, UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
)

(stbfmaxnm
  ("STBFMAXNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(cpymrtrn
  ("CPYMRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sttrb
  ("STTRB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setge
  ("SETGE_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtclrl
  ("LDTCLRL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTCLRL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stcph
  ("STCPH_HI_hints" "" ())
)

(ldclrab
  ("LDCLRAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(dcps3
  ("DCPS3_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
)

(rcwcaspl
  ("RCWCASPL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfcvtnt
  ("bfcvtnt_z_p_z_s2bfz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfcvtnt_z_p_z_s2bf" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld1
  ("LD1_asisdlse_R4_4v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlse_R3_3v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlse_R1_1v" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlse_R2_2v" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_R4_r4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_R3_r3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_R1_r1" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_R2_r2" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_I4_i4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_I3_i3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_I1_i1" "{V UInteger . 8B}, [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsep_I2_i2" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlso_B1_1b" "{V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlso_H1_1h" "{V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlso_S1_1s" "{V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlso_D1_1d" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_BX1_r1b" "{V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_HX1_r1h" "{V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_SX1_r1s" "{V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_DX1_r1d" "{V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_B1_i1b" "{V UInteger . B}, [UInteger], [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_H1_i1h" "{V UInteger . H}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_S1_i1s" "{V UInteger . S}, [UInteger], [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD1_asisdlsop_D1_i1d" "{V UInteger . D}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fnmadd
  ("FNMADD_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMADD_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNMADD_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfmax
  ("LDBFMAX_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(st64bv
  ("ST64BV_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fadd
  ("fadd_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fadd_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fadd_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fadd_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fadd_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fadd_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("FADD_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADD_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADD_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADD_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADD_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgetn
  ("SETGETN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(splice
  ("splice_z_p_zz_des" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("splice_z_p_zz_con" "ZUInteger.B, PUInteger, {Z UInteger . B Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ptrues
  ("ptrues_p_s_" "PUInteger.B" (("size" (element-size B H S D)) ("Pd" (reg-range 0 15))))
)

(shrnt
  ("shrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cpyfmrn
  ("CPYFMRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sha512su0
  ("SHA512SU0_VV2_cryptosha512_2" "VUInteger.2D, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwswp
  ("RCWSWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(asrr
  ("asrr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldap1
  ("LDAP1_asisdlso_D1" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(caslb
  ("CASLB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqabs
  ("sqabs_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqabs_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SQABS_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQABS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumaxb
  ("LDUMAXB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(brka
  ("brka_p_p_p_" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(saddlv
  ("SADDLV_asimdall_only" "HUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sabdlb
  ("sabdlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(shl
  ("SHL_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgomt
  ("SETGOMT_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldursh
  ("LDURSH_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDURSH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(asrv
  ("ASRV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ASRV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfminnm
  ("bfminnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfminnm_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfminnm_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("bfminnm_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfminnm_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
)

(sminqv
  ("sminqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(fcvtas
  ("FCVTAS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfvdot
  ("bfvdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
)

(suvdot
  ("suvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(cpyfptwn
  ("CPYFPTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ext
  ("ext_z_zi_des" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm8h" (imm-range 0 31 1)) ("imm8l" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("ext_z_zi_con" "ZUInteger.B, {Z UInteger .B Z UInteger .B}, UInteger" (("imm8h" (imm-range 0 31 1)) ("imm8l" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("EXT_asimdext_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B, UInteger" (("Rm" (reg-range 0 31)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgpn
  ("SETGPN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqxtnt
  ("uqxtnt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(tbl
  ("tbl_z_zz_2" "ZUInteger.B, {Z UInteger . B Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("tbl_z_zz_1" "ZUInteger.B, {Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("TBL_asimdtbl_L1_1" "VUInteger.8B, {V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBL_asimdtbl_L2_2" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBL_asimdtbl_L3_3" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("TBL_asimdtbl_L4_4" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(casp
  ("CASP_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASP_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(msr
  ("MSR_SI_pstate" "UAO, UInteger" ())
  ("MSR_SR_systemmove" "ACTLR_EL3, XZR" (("Rt" (reg-range 0 31))))
)

(rcwssetp
  ("RCWSSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsclrpal
  ("RCWSCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smaxqv
  ("smaxqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(punpkhi
  ("punpkhi_p_p_" "PUInteger.H, PUInteger.B" (("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(retab
  ("RETAB_64E_branch_reg" "" ())
)

(rcwsetp
  ("RCWSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldurb
  ("LDURB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtau
  ("FCVTAU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTAU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfewt
  ("CPYFEWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgomn
  ("SETGOMN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stlur
  ("STLUR_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_B_ldapstl_simd" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_Q_ldapstl_simd" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_H_ldapstl_simd" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_S_ldapstl_simd" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLUR_D_ldapstl_simd" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(paciasppc
  ("PACIASPPC_64LR_dp_1src" "" ())
)

(uqdecw
  ("uqdecw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqdecw_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqdecw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(crc32ch
  ("CRC32CH_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwset
  ("RCWSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(faddqv
  ("faddqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(rmif
  ("RMIF_only_rmif" "XZR, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31))))
)

(adrp
  ("ADRP_only_pcreladdr" "XZR, SInteger" (("immlo" (imm-range 0 3 1)) ("immhi" (imm-range 0 524287 1)) ("Rd" (reg-range 0 31))))
)

(sqdmullb
  ("sqdmullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cpyfertrn
  ("CPYFERTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldff1d
  ("ldff1d_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1d_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1d_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(umaddl
  ("UMADDL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sdivr
  ("sdivr_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(pfirst
  ("pfirst_p_p_p_" "PUInteger.B, PUInteger, PUInteger.B" (("Pg" (reg-range 0 15))))
)

(ld1sb
  ("ld1sb_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_br_s16" "{Z UInteger .H}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_bi_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1sb_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(isb
  ("ISB_BI_barriers" "" ())
)

(setgm
  ("SETGM_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uxtw
  ("uxtw_z_p_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uxtw_z_p_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stbfmin
  ("STBFMIN_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(csel
  ("CSEL_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CSEL_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frintx
  ("frintx_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintx_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINTX_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTX_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTX_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTX_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTX_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sclamp
  ("sclamp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sclamp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("sclamp_mz_zz_4" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
)

(srsra
  ("srsra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SRSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SRSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmop4a
  ("fmop4a_za_zz_s1x1" "ZAUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_s1x2" "ZAUInteger.S, ZUInteger.S, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_s2x2" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_z8z8_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_z8z8_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_z8z8_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_z8z8_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za16_z8z8_b1x1" "ZAUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za16_z8z8_b1x2" "ZAUInteger.H, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za16_z8z8_b2x1" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za16_z8z8_b2x2" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_d1x1" "ZAUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_d1x2" "ZAUInteger.D, ZUInteger.D, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_d2x1" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("fmop4a_za_zz_d2x2" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(crc32cb
  ("CRC32CB_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldrsb
  ("LDRSB_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_64B_ldst_regoff" "XZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_64BL_ldst_regoff" "XZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqsubr
  ("sqsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldtseta
  ("LDTSETA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTSETA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(orqv
  ("orqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(cpyfewn
  ("CPYFEWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgop
  ("SETGOP_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfmina
  ("LDBFMINA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(zip2
  ("zip2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("zip2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("zip2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ZIP2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sumopa
  ("sumopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("sumopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(adc
  ("ADC_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADC_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfmina
  ("LDFMINA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(neg
  ("neg_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("neg_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("NEG_asisdmisc_R" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("NEG_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ins
  ("INS_asimdins_IR_r" "VUInteger.B[UInteger], WZR" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("INS_asimdins_IV_v" "VUInteger.B[UInteger], VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frintz
  ("frintz_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintz_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINTZ_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTZ_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTZ_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTZ_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTZ_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfpn
  ("CPYFPN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldff1h
  ("ldff1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(fmadd
  ("FMADD_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMADD_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMADD_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autia171615
  ("AUTIA171615_64LR_dp_1src" "" ())
)

(fmlslb
  ("fmlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlslb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(fcvtx
  ("fcvtx_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtx_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ssublbt
  ("ssublbt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(srshr
  ("srshr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("SRSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SRSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pmul
  ("pmul_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("PMUL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfmaxnml
  ("LDBFMAXNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(casl
  ("CASL_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASL_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldursb
  ("LDURSB_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDURSB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sri
  ("sri_z_zzi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SRI_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SRI_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(addha
  ("addha_za_pp_z_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("addha_za_pp_z_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(casat
  ("CASAT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uzp2
  ("uzp2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uzp2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("uzp2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("UZP2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldadda
  ("LDADDA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDADDA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(movk
  ("MOVK_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
  ("MOVK_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
)

(pacda
  ("PACDA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwssetl
  ("RCWSSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(swph
  ("SWPH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqshrnb
  ("sqshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldiapp
  ("LDIAPP_32LE_ldiappstilp" "WZR, WZR, [SP], 8" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDIAPP_32L_ldiappstilp" "WZR, WZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDIAPP_64LS_ldiappstilp" "XZR, XZR, [SP], 16" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDIAPP_64L_ldiappstilp" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclrlh
  ("LDCLRLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rev32
  ("REV32_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("REV32_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st4q
  ("st4q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st4q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldeoralh
  ("LDEORALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stnt1w
  ("stnt1w_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1w_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1w_z_p_br_contiguous" "{Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1w_z_p_bi_contiguous" "{Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("stnt1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("stnt1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("stnt1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("stnt1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(ld4d
  ("ld4d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld4d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(frint64x
  ("frint64x_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frint64x_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINT64X_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT64X_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT64X_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pmull
  ("pmull_mz_zzw_1x2" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("PMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(addqp
  ("addqp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldeoral
  ("LDEORAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDEORAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(tbxq
  ("tbxq_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sdot
  ("sdot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z16_zzz_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z32_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z32_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_z16_zzzi_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sdot_za32_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sdot_za32_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sdot_za32_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sdot_za32_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("sdot_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("sdot_za32_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("SDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frecpx
  ("frecpx_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frecpx_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRECPX_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRECPX_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setf16
  ("SETF16_only_setf" "WZR" (("Rn" (reg-range 0 31))))
)

(cpyfen
  ("CPYFEN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldeorlh
  ("LDEORLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sha1m
  ("SHA1M_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqrshrn
  ("uqrshrn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("uqrshrn_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("uqrshrn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("UQRSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQRSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stzg
  ("STZG_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STZG_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STZG_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldatxr
  ("LDATXR_LR32_ldstexclr_unpriv" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDATXR_LR64_ldstexclr_unpriv" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld4b
  ("ld4b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld4b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cpyfprt
  ("CPYFPRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autib171615
  ("AUTIB171615_64LR_dp_1src" "" ())
)

(bsl
  ("bsl_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("BSL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stfaddl
  ("STFADDL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFADDL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFADDL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(usra
  ("usra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("USRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("USRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(csneg
  ("CSNEG_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CSNEG_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfminnml
  ("LDBFMINNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsetal
  ("LDSETAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stlp
  ("STLP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bsl1n
  ("bsl1n_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(cpyfpwtrn
  ("CPYFPWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsclrl
  ("RCWSCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfpwtwn
  ("CPYFPWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sm3partw1
  ("SM3PARTW1_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stlr
  ("STLR_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLR_SL64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLR_32S_ldapstl_writeback" "WZR, [SP -4], !" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLR_64S_ldapstl_writeback" "XZR, [SP -8], !" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyetwn
  ("CPYETWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(orn
  ("orn_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("ORN_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORN_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(wfet
  ("WFET_only_systeminstrswithreg" "XZR" (("Rd" (reg-range 0 31))))
)

(cblo
  ("CBLO_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBLO_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(fmlsl
  ("fmlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("fmlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("fmlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("FMLSL_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLSL_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldursw
  ("LDURSW_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpypwtwn
  ("CPYPWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldff1w
  ("ldff1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sm3tt1b
  ("SM3TT1B_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfprn
  ("CPYFPRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cbbeq
  ("CBBEQ_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(uqxtn
  ("UQXTN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQXTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swpl
  ("SWPL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mls
  ("mls_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mls_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("mls_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("MLS_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("MLS_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfewtwn
  ("CPYFEWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsswpp
  ("RCWSSWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmaxnm
  ("fmaxnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fmaxnm_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fmaxnm_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmaxnm_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("fmaxnm_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmaxnm_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FMAXNM_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNM_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNM_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNM_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXNM_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqrshrnb
  ("uqrshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sqdmlalb
  ("sqdmlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldapursh
  ("LDAPURSH_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPURSH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(crc32x
  ("CRC32X_64C_dp_2src" "WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqincw
  ("uqincw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqincw_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqincw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldnt1sw
  ("ldnt1sw_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(pacga
  ("PACGA_64P_dp_2src" "XZR, XZR, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfet
  ("CPYFET_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(caslh
  ("CASLH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(f1cvtlt
  ("f1cvtlt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(st2g
  ("ST2G_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2G_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2G_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(st2
  ("ST2_asisdlse_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsep_R2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsep_I2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlso_B2_2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlso_H2_2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlso_S2_2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlso_D2_2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_BX2_r2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_HX2_r2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_SX2_r2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_DX2_r2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_B2_i2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_H2_i2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_S2_i2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST2_asisdlsop_D2_i2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(frint64z
  ("frint64z_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frint64z_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINT64Z_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT64Z_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINT64Z_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(tenter
  ("TENTER_te_exception" "UInteger" (("imm7" (imm-range 0 127 1))))
)

(addv
  ("ADDV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqcvtun
  ("sqcvtun_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqcvtun_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(bf2cvtl
  ("bf2cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("BF2CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldclrpal
  ("LDCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfmaxal
  ("LDBFMAXAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldeoralb
  ("LDEORALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(addqv
  ("addqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(sha1su0
  ("SHA1SU0_VVV_cryptosha3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlalb
  ("fmlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalb_z_z8z8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalb_z_z8z8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALB_asimdsame2_J" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALB_asimdelem_H" "VUInteger.8H, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(tbnz
  ("TBNZ_only_testbranch" "WZR, UInteger, SInteger" (("imm14" (imm-range 0 16383 1)) ("Rt" (reg-range 0 31))))
)

(ld3r
  ("LD3R_asisdlso_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3R_asisdlsop_RX3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD3R_asisdlsop_R3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(brkas
  ("brkas_p_p_p_z" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(ldseta
  ("LDSETA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpymrtwn
  ("CPYMRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpye
  ("CPYE_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(xpaclri
  ("XPACLRI_HI_hints" "" ())
)

(setffr
  ("setffr_f_" "" ())
)

(cast
  ("CAST_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(autibsp
  ("AUTIBSP_HI_hints" "" ())
)

(st4w
  ("st4w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st4w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(rcwscaspal
  ("RCWSCASPAL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclrlb
  ("LDCLRLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld2w
  ("ld2w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld2w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(and
  ("and_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("and_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("and_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
  ("and_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("AND_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("AND_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("AND_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("AND_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("AND_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subhn
  ("SUBHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uaddlv
  ("UADDLV_asimdall_only" "HUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldrab
  ("LDRAB_64_ldst_pac" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRAB_64W_ldst_pac" "XZR, [SP], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uminqv
  ("uminqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(frsqrte
  ("frsqrte_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRSQRTE_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTE_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTE_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stl1
  ("STL1_asisdlso_D1" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(revb
  ("revb_z_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("revb_z_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(caslt
  ("CASLT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(swplb
  ("SWPLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmops
  ("fmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmops_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("fmops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(lslr
  ("lslr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldrsw
  ("LDRSW_64_loadlit" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("LDRSW_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSW_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSW_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRSW_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwcas
  ("RCWCAS_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqrshr
  ("sqrshr_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshr_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(cpymtwn
  ("CPYMTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmaxv
  ("fmaxv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("FMAXV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfaddal
  ("LDFADDAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsetab
  ("LDSETAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwsswpl
  ("RCWSSWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldaddlb
  ("LDADDLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfaddal
  ("LDBFADDAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(utmopa
  ("utmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("utmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(sqcvtn
  ("sqcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqcvtn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(sabdlt
  ("sabdlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fsqrt
  ("fsqrt_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fsqrt_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FSQRT_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSQRT_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSQRT_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSQRT_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FSQRT_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(eorqv
  ("eorqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(uqcvtn
  ("uqcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("uqcvtn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(prfb
  ("prfb_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfb_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfb_i_p_br_s" "PLDL1KEEP, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfb_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfb_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfb_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfb_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(ldg
  ("LDG_64Loffset_ldsttags" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(incd
  ("incd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("incd_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(cpyewtrn
  ("CPYEWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autiaz
  ("AUTIAZ_HI_hints" "" ())
)

(setm
  ("SETM_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(shrnb
  ("shrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cbeq
  ("CBEQ_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBEQ_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBEQ_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBEQ_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(smin
  ("smin_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("smin_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("smin_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("smin_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("smin_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("smin_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("SMIN_32_minmax_imm" "WZR, WZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMIN_64_minmax_imm" "XZR, XZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMIN_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMIN_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMIN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uaddv
  ("uaddv_r_p_z_" "DUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(rev64
  ("REV64_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtnb
  ("fcvtnb_z8_mz2_s2b" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
)

(cpymrt
  ("CPYMRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st4
  ("ST4_asisdlse_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsep_R4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsep_I4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlso_B4_4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlso_H4_4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlso_S4_4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlso_D4_4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_BX4_r4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_HX4_r4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_SX4_r4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_DX4_r4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_B4_i4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_H4_i4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_S4_i4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("ST4_asisdlsop_D4_i4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 32" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stfmaxnm
  ("STFMAXNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXNM_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXNM_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(nors
  ("nors_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(ld3h
  ("ld3h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld3h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ccmn
  ("CCMN_32_condcmp_reg" "WZR, WZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("CCMN_64_condcmp_reg" "XZR, XZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("CCMN_32_condcmp_imm" "WZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
  ("CCMN_64_condcmp_imm" "XZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
)

(ldsetah
  ("LDSETAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(dmb
  ("DMB_BO_barriers" "SY" ())
)

(setetn
  ("SETETN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cbge
  ("CBGE_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
  ("CBGE_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(bfmops
  ("bfmops_za32_pp_zz_" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("bfmops_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(cmtst
  ("CMTST_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMTST_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlall
  ("fmlall_za32_z8z8i_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlall_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("fmlall_za32_z8z8i_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("fmlall_za32_z8z8v_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("fmlall_za32_z8z8v_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("fmlall_za32_z8z8v_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("fmlall_za32_z8z8w_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("fmlall_za32_z8z8w_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(ccmp
  ("CCMP_32_condcmp_reg" "WZR, WZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("CCMP_64_condcmp_reg" "XZR, XZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("CCMP_32_condcmp_imm" "WZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
  ("CCMP_64_condcmp_imm" "XZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
)

(cpymrn
  ("CPYMRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldapursb
  ("LDAPURSB_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPURSB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmax
  ("fmax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fmax_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fmax_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmax_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("fmax_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fmax_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FMAX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAX_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAX_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAX_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bgrp
  ("bgrp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(lslv
  ("LSLV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("LSLV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddwb
  ("saddwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rcwcasal
  ("RCWCASAL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(prfd
  ("prfd_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfd_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfd_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfd_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfd_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfd_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfd_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(smax
  ("smax_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("smax_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("smax_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("smax_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("smax_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("smax_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("SMAX_32_minmax_imm" "WZR, WZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMAX_64_minmax_imm" "XZR, XZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMAX_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMAX_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMAX_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stzgm
  ("STZGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqdecw
  ("sqdecw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("sqdecw_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("sqdecw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(swptl
  ("SWPTL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPTL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(incb
  ("incb_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(fccmp
  ("FCCMP_S_floatccmp" "SUInteger, SUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCCMP_D_floatccmp" "DUInteger, DUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCCMP_H_floatccmp" "HUInteger, HUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(uabd
  ("uabd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UABD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swplh
  ("SWPLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(zipq1
  ("zipq1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(usmop4a
  ("usmop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(cmpgt
  ("cmpgt_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpgt_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpgt_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(eretab
  ("ERETAB_64E_branch_reg" "" ())
)

(brab
  ("BRAB_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
)

(ummla
  ("ummla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("UMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(revd
  ("revd_z_p_z_m" "ZUInteger.Q, PUInteger/M, ZUInteger.Q" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("revd_z_p_z_z" "ZUInteger.Q, PUInteger/Z, ZUInteger.Q" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(smlsl
  ("smlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("smlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("smlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("smlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("smlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("smlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("SMLSL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld2q
  ("ld2q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld2q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldaxrb
  ("LDAXRB_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcsel
  ("FCSEL_S_floatsel" "SUInteger, SUInteger, SUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCSEL_D_floatsel" "DUInteger, DUInteger, DUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCSEL_H_floatsel" "HUInteger, HUInteger, HUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(clrbhb
  ("CLRBHB_HI_hints" "" ())
)

(cdot
  ("cdot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("cdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("cdot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(sha1c
  ("SHA1C_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldeorlb
  ("LDEORLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sbclb
  ("sbclb_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(sete
  ("SETE_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uaddlt
  ("uaddlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(st2q
  ("st2q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st2q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldeorah
  ("LDEORAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(usubw
  ("USUBW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cntw
  ("cntw_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
)

(rcwcaspa
  ("RCWCASPA_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqrshl
  ("sqrshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SQRSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwclra
  ("RCWCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(inch
  ("inch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("inch_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldsmaxlh
  ("LDSMAXLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpymwt
  ("CPYMWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqxtunb
  ("sqxtunb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(not
  ("not_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("not_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("NOT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqsub
  ("sqsub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqsub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("sqsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SQSUB_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(retaasppcr
  ("RETAASPPCR_64M_branch_reg" "XZR" (("Rm" (reg-range 0 31))))
)

(crc32h
  ("CRC32H_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(dsb
  ("DSB_BO_barriers" "SY" ())
  ("DSB_BOn_barriers" "SYnXS" (("imm2" (imm-range 0 3 1))))
)

(rcwsclrpa
  ("RCWSCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mul
  ("mul_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("mul_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("mul_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("mul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("mul_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("mul_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("MUL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("MUL_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(retabsppcr
  ("RETABSPPCR_64M_branch_reg" "XZR" (("Rm" (reg-range 0 31))))
)

(setptn
  ("SETPTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pacibz
  ("PACIBZ_HI_hints" "" ())
)

(rcwscasp
  ("RCWSCASP_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqrshrun
  ("sqrshrun_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshrun_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshrun_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("SQRSHRUN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRSHRUN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bsl2n
  ("bsl2n_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(asr
  ("asr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("asr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("asr_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("asr_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("asr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rcwsetpa
  ("RCWSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stfmaxl
  ("STFMAXL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAXL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(sshl
  ("SSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fneg
  ("fneg_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fneg_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FNEG_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNEG_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNEG_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNEG_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FNEG_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umopa
  ("umopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("umopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("umopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(umsubl
  ("UMSUBL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgmn
  ("SETGMN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pnext
  ("pnext_p_p_p_" "PUInteger.B, PUInteger, PUInteger.B" (("size" (element-size B H S D))))
)

(sqrshru
  ("sqrshru_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("sqrshru_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(sqcadd
  ("sqcadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 90" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(cbbhs
  ("CBBHS_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(sqdmlalt
  ("sqdmlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cpyfmtn
  ("CPYFMTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfmlalt
  ("bfmlalt_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmlalt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(sqshlr
  ("sqshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(cbhge
  ("CBHGE_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(ldtrb
  ("LDTRB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(scvtf
  ("scvtf_z_p_z_w2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_w2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_h2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_w2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2fp16z" "ZUInteger.H, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_w2s" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_w2d" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2d" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_h2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_w2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_p_z_x2fp16" "ZUInteger.H, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("scvtf_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("scvtf_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("SCVTF_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_S32_float2fix" "SUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_D32_float2fix" "DUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_H32_float2fix" "HUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_S64_float2fix" "SUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_D64_float2fix" "DUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_H64_float2fix" "HUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_D32_float2int" "DUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_S64_float2int" "SUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_sisd_32D" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_sisd_32H" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_sisd_64H" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SCVTF_sisd_64S" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(msrr
  ("MSRR_SR_systemmovepr" "ACTLR_EL3, XZR, XUInteger" (("Rt" (reg-range 0 31))))
)

(stshh
  ("STSHH_HI_hints" "KEEP" ())
)

(ldaxrh
  ("LDAXRH_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmlalt
  ("fmlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalt_z_z8z8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalt_z_z8z8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALT_asimdsame2_J" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALT_asimdelem_H" "VUInteger.8H, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld1rsb
  ("ld1rsb_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rsb_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rsb_z_p_bi_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ld1row
  ("ld1row_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1row_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(sshllt
  ("sshllt_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sadalp
  ("sadalp_z_p_z_" "ZUInteger.H, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SADALP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st2w
  ("st2w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st2w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldlar
  ("LDLAR_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDLAR_LR64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldeorab
  ("LDEORAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmlal
  ("bfmlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("bfmlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("bfmlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("bfmlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("bfmlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("bfmlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("BFMLAL_asimdsame2_F_" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BFMLAL_asimdelem_F" "VUInteger.4S, VUInteger.8H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsmina
  ("LDSMINA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMINA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldtadda
  ("LDTADDA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTADDA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(wfe
  ("WFE_HI_hints" "" ())
)

(adclb
  ("adclb_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cpymwtn
  ("CPYMWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldxr
  ("LDXR_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDXR_LR64_ldstexclr" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmpeq
  ("cmpeq_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpeq_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpeq_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(faddv
  ("faddv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(cpyertwn
  ("CPYERTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uaddlp
  ("UADDLP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saba
  ("saba_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SABA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(dgh
  ("DGH_HI_hints" "" ())
)

(ldaddlh
  ("LDADDLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmaxp
  ("fmaxp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FMAXP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMAXP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfmin
  ("LDFMIN_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMIN_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMIN_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sabalt
  ("sabalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldtrh
  ("LDTRH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bdep
  ("bdep_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldbfadd
  ("LDBFADD_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmhi
  ("CMHI_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMHI_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uunpklo
  ("uunpklo_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldtrsh
  ("LDTRSH_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTRSH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqshrun
  ("sqshrun_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("SQSHRUN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHRUN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pext
  ("pext_pn_rr_" "PUInteger.B, PNUInteger[UInteger]" (("size" (element-size B H S D)) ("imm2" (imm-range 0 3 1)) ("PNn" (reg-range 0 7)) ("Pd" (reg-range 0 15))))
  ("pext_pp_rr_" "{P UInteger . B P UInteger . B}, PNUInteger[UInteger]" (("size" (element-size B H S D)) ("PNn" (reg-range 0 7)) ("Pd" (reg-range 0 15))))
)

(wfi
  ("WFI_HI_hints" "" ())
)

(ldclrb
  ("LDCLRB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpymwtrn
  ("CPYMWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(srshlr
  ("srshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(pacib1716
  ("PACIB1716_HI_hints" "" ())
)

(dupq
  ("dupq_z_zi_" "ZUInteger.D, ZUInteger.D[UInteger]" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rorv
  ("RORV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("RORV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(prfh
  ("prfh_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfh_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfh_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfh_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfh_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
  ("prfh_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("prfh_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(cpypwtrn
  ("CPYPWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(clasta
  ("clasta_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("clasta_v_p_z_" "BUInteger, PUInteger, BUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
  ("clasta_r_p_z_" "WZR, PUInteger, WZR, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Rdn" (reg-range 0 31))))
)

(lduminlb
  ("LDUMINLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uzpq2
  ("uzpq2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sshr
  ("SSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(urshl
  ("urshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("urshl_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("urshl_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("urshl_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("urshl_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("URSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("URSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldxp
  ("LDXP_LP32_ldstexclp" "WZR, WZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDXP_LP64_ldstexclp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmplo
  ("cmplo_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmplo_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(ldfmaxnml
  ("LDFMAXNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNML_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXNML_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(swptal
  ("SWPTAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPTAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldaprh
  ("LDAPRH_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(autib
  ("AUTIB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(retaasppc
  ("RETAASPPC_only_miscbranch" "SInteger" (("imm16" (imm-range 0 65535 1))))
)

(ldtset
  ("LDTSET_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTSET_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldff1sh
  ("ldff1sh_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sh_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ld1rsh
  ("ld1rsh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rsh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cpyfertn
  ("CPYFERTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ustmopa
  ("ustmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(autiza
  ("AUTIZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(sabal
  ("sabal_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SABAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(usdot
  ("usdot_z_zzz_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("usdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("usdot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("usdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("usdot_za_zzv_s2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("usdot_za_zzv_s4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("usdot_za_zzw_s2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("usdot_za_zzw_s4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("USDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("USDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sbclt
  ("sbclt_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldumaxah
  ("LDUMAXAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldeorb
  ("LDEORB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uaddlb
  ("uaddlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(histseg
  ("histseg_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(urshlr
  ("urshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(cpyfert
  ("CPYFERT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cmpls
  ("cmpls_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpls_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(shuh
  ("SHUH_HI_hints" "" ())
)

(stg
  ("STG_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STG_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STG_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqshrnb
  ("uqshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sqshl
  ("sqshl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("sqshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SQSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHL_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddw
  ("SADDW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmlalbt
  ("sqdmlalbt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(sshll
  ("SSHLL_asimdshf_L" "VUInteger.8H, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(saddwt
  ("saddwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(prfum
  ("PRFUM_P_ldst_unscaled" "PLDL1KEEP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smullt
  ("smullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("smullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("smullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(udiv
  ("udiv_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UDIV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UDIV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwscasal
  ("RCWSCASAL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sm3tt2b
  ("SM3TT2B_VVV_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(faddp
  ("faddp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FADDP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADDP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADDP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FADDP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(brkpas
  ("brkpas_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(lduminalh
  ("LDUMINALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtnt
  ("fcvtnt_z_p_z_s2hz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtnt_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtnt_z_p_z_s2h" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtnt_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtnt_z8_mz2_s2b" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
)

(pacia
  ("PACIA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfmopa
  ("bfmopa_za32_pp_zz_" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("bfmopa_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(paciasp
  ("PACIASP_HI_hints" "" ())
)

(ld4r
  ("LD4R_asisdlso_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4R_asisdlsop_RX4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4R_asisdlsop_R4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcmge
  ("fcmge_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("fcmge_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FCMGE_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMGE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgmt
  ("SETGMT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwscaspa
  ("RCWSCASPA_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(swpal
  ("SWPAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsmaxalh
  ("LDSMAXALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cbbge
  ("CBBGE_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(rcwsetal
  ("RCWSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(incp
  ("incp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("incp_r_p_r_" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(setgomtn
  ("SETGOMTN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(addp
  ("addp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("ADDP_asisdpair_only" "DUInteger, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADDP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sumop4s
  ("sumop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("sumop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(orv
  ("orv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(st1d
  ("st1d_z_p_br_u128" "{Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_br_" "{Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bi_u128" "{Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_z_p_bi_" "{Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1d_za_p_rrr_" "{ZA UInteger H .D [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(ldsminalb
  ("LDSMINALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldclrl
  ("LDCLRL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldnf1sw
  ("ldnf1sw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(extq
  ("extq_z_zi_des" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm4" (imm-range 0 15 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(xaflag
  ("XAFLAG_M_pstate" "" ())
)

(ld4h
  ("ld4h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld4h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(bics
  ("bics_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("BICS_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BICS_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(facge
  ("facge_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FACGE_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGE_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FACGE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lasta
  ("lasta_v_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("lasta_r_p_z_" "WZR, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmullt
  ("sqdmullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqdmullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(swpb
  ("SWPB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(lduminlh
  ("LDUMINLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uabdl
  ("UABDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autiasppc
  ("AUTIASPPC_only_dp_1src_imm" "SInteger" (("imm16" (imm-range 0 65535 1))))
)

(ldclrpl
  ("LDCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(insr
  ("insr_z_r_" "ZUInteger.B, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("insr_z_v_" "ZUInteger.B, BUInteger" (("size" (element-size B H S D)) ("Vm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldsminalh
  ("LDSMINALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fdivr
  ("fdivr_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(uabdlb
  ("uabdlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(expand
  ("expand_z_p_z_" "ZUInteger.B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldfmax
  ("LDFMAX_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAX_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAX_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(saddlb
  ("saddlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(st3q
  ("st3q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st3q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldsmaxalb
  ("LDSMAXALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pacnbibsppc
  ("PACNBIBSPPC_64LR_dp_1src" "" ())
)

(psel
  ("psel_p_ppi_" "PUInteger, PUInteger, PUInteger.D, [W UInteger UInteger]" (("Pn" (reg-range 0 15)) ("Pm" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(swppa
  ("SWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(nor
  ("nor_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(umaxv
  ("umaxv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("UMAXV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumaxab
  ("LDUMAXAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmla
  ("fmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmla_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmla_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmla_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("FMLA_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLA_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLA_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLA_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLA_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLA_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldpsw
  ("LDPSW_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDPSW_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDPSW_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldfaddl
  ("LDFADDL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFADDL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(trn2
  ("trn2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("trn2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("trn2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("TRN2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(orr
  ("orr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("orr_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("orr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
  ("orr_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("ORR_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORR_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORR_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORR_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORR_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ORR_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
  ("ORR_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
)

(st1h
  ("st1h_z_p_br_" "{Z UInteger . H}, PUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_z_p_bi_" "{Z UInteger . H}, PUInteger, [SP]" (("size" (element-size B H S D)) ("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("st1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("st1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("st1h_za_p_rrr_" "{ZA UInteger H .H [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
)

(ldclrh
  ("LDCLRH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwswpa
  ("RCWSWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldff1sb
  ("ldff1sb_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_br_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldff1sb_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(histcnt
  ("histcnt_z_p_zz_" "ZUInteger.S, PUInteger/Z, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rcwscasl
  ("RCWSCASL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(urshr
  ("urshr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("URSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("URSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(frsqrts
  ("frsqrts_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRSQRTS_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTS_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRSQRTS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swpah
  ("SWPAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfern
  ("CPYFERN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldnp
  ("LDNP_32_ldstnapair_offs" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDNP_S_ldstnapair_offs" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDNP_D_ldstnapair_offs" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(autiasppcr
  ("AUTIASPPCR_64LRR_dp_1src" "XZR" (("Rn" (reg-range 0 31))))
)

(ldsmaxlb
  ("LDSMAXLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ubfm
  ("UBFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UBFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldaprb
  ("LDAPRB_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(subpt
  ("subpt_z_p_zz_" "ZUInteger.D, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("subpt_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SUBPT_64_addsub_pt" "SP, SP, XZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(nop
  ("NOP_HI_hints" "" ())
)

(maddpt
  ("MADDPT_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(esb
  ("ESB_HI_hints" "" ())
)

(smc
  ("SMC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(caspl
  ("CASPL_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASPL_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwclral
  ("RCWCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(andv
  ("andv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(umlsl
  ("umlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("umlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("umlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("umlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("umlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("umlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
  ("umlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
  ("UMLSL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmul
  ("fmul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fmul_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fmul_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fmul_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fmul_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fmul_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("fmul_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("fmul_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("fmul_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FMUL_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMUL_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldaddh
  ("LDADDH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyprtwn
  ("CPYPRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcmuo
  ("fcmuo_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(eor
  ("eor_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("eor_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("eor_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
  ("eor_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("EOR_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EOR_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EOR_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EOR_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EOR_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(whilelo
  ("whilelo_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilelo_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilelo_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(ssublb
  ("ssublb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rdffrs
  ("rdffrs_p_p_f_" "PUInteger.B, PUInteger/Z" (("Pg" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(ftmopa
  ("ftmopa_za_zzzi_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("ftmopa_za32_z8z8zi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("ftmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("ftmopa_za16_z8z8zi_b2x1" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
  ("ftmopa_za_zzzi_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(ldaddah
  ("LDADDAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmlslb
  ("bfmlslb_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmlslb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(sdiv
  ("sdiv_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SDIV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SDIV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfsub
  ("bfsub_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfsub_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfsub_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfsub_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(wfit
  ("WFIT_only_systeminstrswithreg" "XZR" (("Rd" (reg-range 0 31))))
)

(xpaci
  ("XPACI_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(uqrshrnt
  ("uqrshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(lsl
  ("lsl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("lsl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("lsl_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("lsl_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("lsl_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(sha512h2
  ("SHA512H2_QQV_cryptosha512_3" "QUInteger, QUInteger, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ret
  ("RET_64R_branch_reg" "" (("Rn" (reg-range 0 31))))
)

(smov
  ("SMOV_asimdins_W_w" "WZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SMOV_asimdins_X_x" "XZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqdmlslb
  ("sqdmlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqdmlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(xtn
  ("XTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwsclrpl
  ("RCWSCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqdech
  ("uqdech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqdech_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqdech_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldnt1h
  ("ldnt1h_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1h_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1h_z_p_bi_contiguous" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1h_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ldnt1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(whilehi
  ("whilehi_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilehi_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilehi_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(fcmpe
  ("FCMPE_S_floatcmp" "SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMPE_SZ_floatcmp" "SUInteger, 0.0" (("Rn" (reg-range 0 31))))
  ("FCMPE_D_floatcmp" "DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMPE_DZ_floatcmp" "DUInteger, 0.0" (("Rn" (reg-range 0 31))))
  ("FCMPE_H_floatcmp" "HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMPE_HZ_floatcmp" "HUInteger, 0.0" (("Rn" (reg-range 0 31))))
)

(rdffr
  ("rdffr_p_p_f_" "PUInteger.B, PUInteger/Z" (("Pg" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("rdffr_p_f_" "PUInteger.B" (("Pd" (reg-range 0 15))))
)

(sturh
  ("STURH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldnf1sb
  ("ldnf1sb_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1sb_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1sb_z_p_bi_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(brkn
  ("brkn_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pdm" (reg-range 0 15))))
)

(subg
  ("SUBG_64_addsub_immtags" "SP, SP, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ushllt
  ("ushllt_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stnp
  ("STNP_32_ldstnapair_offs" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STNP_S_ldstnapair_offs" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STNP_D_ldstnapair_offs" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smlslt
  ("smlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(cbheq
  ("CBHEQ_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
)

(ursra
  ("ursra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("URSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("URSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fclamp
  ("fclamp_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fclamp_mz_zz_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("fclamp_mz_zz_4" "{Z UInteger . H - Z UInteger . H}, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
)

(seten
  ("SETEN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(umov
  ("UMOV_asimdins_W_w" "WZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMOV_asimdins_X_x" "XZR, VUInteger.D[UInteger" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(pacibsppc
  ("PACIBSPPC_64LR_dp_1src" "" ())
)

(stlxrb
  ("STLXRB_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(frinta
  ("frinta_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frinta_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frinta_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("frinta_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FRINTA_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTA_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTA_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTA_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTA_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sbfm
  ("SBFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SBFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcmp
  ("FCMP_S_floatcmp" "SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMP_SZ_floatcmp" "SUInteger, 0.0" (("Rn" (reg-range 0 31))))
  ("FCMP_D_floatcmp" "DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMP_DZ_floatcmp" "DUInteger, 0.0" (("Rn" (reg-range 0 31))))
  ("FCMP_H_floatcmp" "HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("FCMP_HZ_floatcmp" "HUInteger, 0.0" (("Rn" (reg-range 0 31))))
)

(rcwsswp
  ("RCWSSWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(umin
  ("umin_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("umin_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("umin_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("umin_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("umin_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("umin_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("UMIN_32U_minmax_imm" "WZR, WZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMIN_64U_minmax_imm" "XZR, XZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMIN_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMIN_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UMIN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(clz
  ("clz_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("clz_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("CLZ_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CLZ_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CLZ_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtrsb
  ("LDTRSB_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTRSB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cadd
  ("cadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 90" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(uqcvt
  ("uqcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("uqcvt_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
)

(rsubhn
  ("RSUBHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uunpkhi
  ("uunpkhi_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldbfmaxl
  ("LDBFMAXL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcvtxnt
  ("fcvtxnt_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvtxnt_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(setpt
  ("SETPT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bf1cvtl
  ("bf1cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("BF1CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsminl
  ("LDSMINL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMINL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sturb
  ("STURB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fadda
  ("fadda_v_p_z_" "HUInteger, PUInteger, HUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
)

(ptrue
  ("ptrue_p_s_" "PUInteger.B" (("size" (element-size B H S D)) ("Pd" (reg-range 0 15))))
  ("ptrue_pn_i_" "PNUInteger.B" (("size" (element-size B H S D)) ("PNd" (reg-range 0 7))))
)

(whilege
  ("whilege_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilege_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilege_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(bl
  ("BL_only_branch_imm" "SInteger" (("imm26" (imm-range 0 67108863 1))))
)

(cpyfmrtrn
  ("CPYFMRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqshrnt
  ("uqshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(umaxqv
  ("umaxqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(uqshl
  ("uqshl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("uqshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UQSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQSHL_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQSHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldnt1b
  ("ldnt1b_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1b_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1b_z_p_bi_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1b_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ldnt1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(madd
  ("MADD_32A_dp_3src" "WZR, WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("MADD_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldclralb
  ("LDCLRALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(usublt
  ("usublt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldnf1sh
  ("ldnf1sh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1sh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cpy
  ("cpy_z_o_i_" "ZUInteger.B, PUInteger/Z, SInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
  ("cpy_z_p_i_" "ZUInteger.B, PUInteger/M, SInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
  ("cpy_z_p_v_" "ZUInteger.B, PUInteger/M, BUInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Vn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("cpy_z_p_r_" "ZUInteger.B, PUInteger/M, WSP" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldfminl
  ("LDFMINL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(madpt
  ("madpt_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(dupm
  ("dupm_z_i_" "ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zd" (reg-range 0 31))))
)

(pacdzb
  ("PACDZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(ldaddal
  ("LDADDAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDADDAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsmax
  ("LDSMAX_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMAX_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwclrpa
  ("RCWCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stz2g
  ("STZ2G_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STZ2G_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STZ2G_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldadd
  ("LDADD_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDADD_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smaxp
  ("smaxp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SMAXP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfpwtn
  ("CPYFPWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfminnm
  ("LDBFMINNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsmaxal
  ("LDSMAXAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMAXAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(nand
  ("nand_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(sqrdmlah
  ("sqrdmlah_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlah_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlah_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("sqrdmlah_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("SQRDMLAH_asisdsame2_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLAH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLAH_asimdsame2_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMLAH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(movprfx
  ("movprfx_z_p_z_" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("movprfx_z_z_" "ZUInteger, ZUInteger" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(fvdot
  ("fvdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fvdot_za_z8z8i_2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
)

(bf2cvt
  ("bf2cvt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bf2cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
)

(uminv
  ("uminv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("UMINV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfmaxa
  ("LDFMAXA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwssetpa
  ("RCWSSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(decw
  ("decw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("decw_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldnt1d
  ("ldnt1d_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1d_z_p_bi_contiguous" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1d_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnt1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ldnt1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ldnt1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ldnt1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
)

(sha512h
  ("SHA512H_QQV_cryptosha512_3" "QUInteger, QUInteger, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldclrp
  ("LDCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqshrn
  ("sqshrn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("SQSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smop4s
  ("smop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(frinti
  ("frinti_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frinti_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("FRINTI_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTI_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTI_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTI_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTI_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldxrb
  ("LDXRB_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld4w
  ("ld4w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld4w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cpyfptrn
  ("CPYFPTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld64b
  ("LD64B_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mlapt
  ("mlapt_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(ldfminnmal
  ("LDFMINNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNMAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNMAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgptn
  ("SETGPTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(subhnb
  ("subhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(chkfeat
  ("CHKFEAT_HF_hints" "X16" ())
)

(sqrshrunt
  ("sqrshrunt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(usmopa
  ("usmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("usmopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(rshrnb
  ("rshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(addhnt
  ("addhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(andqv
  ("andqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(fcvtms
  ("FCVTMS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfminnm
  ("LDFMINNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNM_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINNM_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rcwcaspal
  ("RCWCASPAL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(usmop4s
  ("usmop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("usmop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(usmlall
  ("usmlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("usmlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("usmlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("usmlall_za_zzv_s2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("usmlall_za_zzv_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("usmlall_za_zzv_s4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("usmlall_za_zzw_s2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("usmlall_za_zzw_s4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(cpyptwn
  ("CPYPTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(caspt
  ("CASPT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmaxnmqv
  ("fmaxnmqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(ld1rd
  ("ld1rd_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(addsubp
  ("addsubp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(brkbs
  ("brkbs_p_p_p_z" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(sha256su0
  ("SHA256SU0_VV_cryptosha2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lduminal
  ("LDUMINAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMINAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(abs
  ("abs_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("abs_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ABS_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ABS_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ABS_asisdmisc_R" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ABS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bmops
  ("bmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(fmlsl2
  ("FMLSL2_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLSL2_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwssetal
  ("RCWSSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(f2cvt
  ("f2cvt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("f2cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
)

(sb
  ("SB_only_barriers" "" ())
)

(ldtclra
  ("LDTCLRA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTCLRA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmlalb
  ("bfmlalb_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmlalb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(fcvt
  ("fcvt_z_p_z_s2hz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_h2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_d2hz" "ZUInteger.H, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_h2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_s2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_s2h" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_h2s" "ZUInteger.S, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_d2h" "ZUInteger.H, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_h2d" "ZUInteger.D, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_p_z_s2d" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("fcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("fcvt_z8_mz2_" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("fcvt_mz2_z_" "{Z UInteger .S- Z UInteger .S}, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("fcvt_z8_mz4_" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
  ("FCVT_DS_floatdp1" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVT_HS_floatdp1" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVT_SD_floatdp1" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVT_HD_floatdp1" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVT_SH_floatdp1" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVT_DH_floatdp1" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smaxv
  ("smaxv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
  ("SMAXV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(shrn
  ("SHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfe
  ("CPYFE_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlalltb
  ("fmlalltb_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalltb_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALLTB_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALLTB_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqshrn
  ("uqshrn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("UQSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("UQSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(br
  ("BR_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
)

(stgp
  ("STGP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STGP_64_ldstpair_off" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STGP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfptn
  ("CPYFPTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fcvtmu
  ("FCVTMU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCVTMU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(autib1716
  ("AUTIB1716_HI_hints" "" ())
)

(bfmmla
  ("bfmmla_z_zzz_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmmla_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("BFMMLA_asimdsame2_E" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldumaxal
  ("LDUMAXAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMAXAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1rb
  ("ld1rb_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rb_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rb_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rb_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(crc32cw
  ("CRC32CW_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sutmopa
  ("sutmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
)

(axflag
  ("AXFLAG_M_pstate" "" ())
)

(ldsmin
  ("LDSMIN_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMIN_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fminnm
  ("fminnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fminnm_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
  ("fminnm_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fminnm_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("fminnm_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("fminnm_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FMINNM_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNM_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNM_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNM_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMINNM_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setpn
  ("SETPN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqrshrnb
  ("sqrshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld1rh
  ("ld1rh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rh_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rh_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(fmls
  ("fmls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmls_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmls_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmls_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("fmls_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("FMLS_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLS_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLS_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLS_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfewtn
  ("CPYFEWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(brkpbs
  ("brkpbs_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(stlrb
  ("STLRB_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqdmlal
  ("SQDMLAL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLAL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLAL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQDMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqdecd
  ("uqdecd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
  ("uqdecd_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqdecd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(lduminalb
  ("LDUMINALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(firstp
  ("firstp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
)

(stfmin
  ("STFMIN_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMIN_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMIN_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(stbfmax
  ("STBFMAX_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(bfdot
  ("bfdot_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfdot_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfdot_za_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("bfdot_za_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfdot_za_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfdot_za_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfdot_za_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("BFDOT_asimdsame2_D" "VUInteger.2S, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BFDOT_asimdelem_E" "VUInteger.2S, VUInteger.4H, VUInteger.2H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sm4e
  ("sm4e_z_zz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SM4E_VV4_cryptosha512_2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sxtb
  ("sxtb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sxtb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(umlslb
  ("umlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("umlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(swpab
  ("SWPAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(mrs
  ("MRS_RS_systemmove" "XZR, ACTLR_EL3" (("Rt" (reg-range 0 31))))
)

(stfminnm
  ("STFMINNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINNM_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMINNM_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(zero
  ("zero_za_i_" "{}" (("imm8" (imm-range 0 255 1))))
  ("zero_za1_ri_2" "ZA.D[WUInteger, UInteger, VGx2" (("off3" (imm-range 0 7 1))))
  ("zero_za1_ri_4" "ZA.D[WUInteger, UInteger, VGx4" (("off3" (imm-range 0 7 1))))
  ("zero_za2_ri_1" "ZA.D[WUInteger, UInteger:UInteger" (("off3" (imm-range 0 7 1))))
  ("zero_za2_ri_2" "ZA.D[WUInteger, UInteger:UInteger, VGx2]" (("off2" (imm-range 0 3 1))))
  ("zero_za2_ri_4" "ZA.D[WUInteger, UInteger:UInteger, VGx4]" (("off2" (imm-range 0 3 1))))
  ("zero_za4_ri_1" "ZA.D[WUInteger, UInteger:UInteger" (("off2" (imm-range 0 3 1))))
  ("zero_za4_ri_2" "ZA.D[WUInteger, UInteger:UInteger, VGx2]" ())
  ("zero_za4_ri_4" "ZA.D[WUInteger, UInteger:UInteger, VGx4]" ())
  ("zero_zt_i_" "{ZT0}" ())
)

(fnmsb
  ("fnmsb_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldaddl
  ("LDADDL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDADDL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bf1cvt
  ("bf1cvt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bf1cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
)

(paciaz
  ("PACIAZ_HI_hints" "" ())
)

(setgoe
  ("SETGOE_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(eon
  ("EON_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("EON_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uqdecb
  ("uqdecb_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
  ("uqdecb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
)

(ldfmaxal
  ("LDFMAXAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMAXAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(lduminah
  ("LDUMINAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(rdsvl
  ("rdsvl_r_i_" "XUInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(eor3
  ("eor3_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("EOR3_VVV16_crypto4" "VUInteger.16B, VUInteger.16B, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(whilels
  ("whilels_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
  ("whilels_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
  ("whilels_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(casa
  ("CASA_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("CASA_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqshrunb
  ("sqshrunb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldsetpl
  ("LDSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ucvtflt
  ("ucvtflt_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(cpyetn
  ("CPYETN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stlxrh
  ("STLXRH_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldrh
  ("LDRH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(swpt
  ("SWPT_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWPT_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(eorv
  ("eorv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(uaddl
  ("UADDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(rcwseta
  ("RCWSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(aesimc
  ("aesimc_z_z_" "ZUInteger.B, ZUInteger.B" (("Zdn" (reg-range 0 31))))
  ("AESIMC_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lduminb
  ("LDUMINB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1w
  ("ld1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bi_u128" "{Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_br_u128" "{Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
  ("ld1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
  ("ld1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
  ("ld1w_za_p_rrr_" "{ZA UInteger H .S [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
)

(csinc
  ("CSINC_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CSINC_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(addpt
  ("addpt_z_p_zz_" "ZUInteger.D, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("addpt_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ADDPT_64_addsub_pt" "SP, SP, XZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ssublt
  ("ssublt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(st4d
  ("st4d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st4d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(umop4a
  ("umop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("umop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(cpyern
  ("CPYERN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stllrb
  ("STLLRB_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldnf1w
  ("ldnf1w_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ldnf1w_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(drps
  ("DRPS_64E_branch_reg" "" ())
)

(rcwsclrp
  ("RCWSCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(gcsstr
  ("GCSSTR_64_ldst_gcs" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfmn
  ("CPYFMN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqshrunt
  ("sqshrunt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(rcwcasa
  ("RCWCASA_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(autdb
  ("AUTDB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqadd
  ("sqadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqadd_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("sqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("SQADD_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmwn
  ("CPYFMWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqrdmulh
  ("sqrdmulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqrdmulh_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqrdmulh_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sqrdmulh_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("SQRDMULH_asisdsame_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMULH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMULH_asimdsame_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQRDMULH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmrtwn
  ("CPYFMRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(smlslb
  ("smlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("smlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(fnmls
  ("fnmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(usmops
  ("usmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("usmops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(subs
  ("SUBS_32S_addsub_imm" "WZR, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUBS_64S_addsub_imm" "XZR, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUBS_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUBS_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUBS_32S_addsub_ext" "WZR, WSP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SUBS_64S_addsub_ext" "XZR, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(retabsppc
  ("RETABSPPC_only_miscbranch" "SInteger" (("imm16" (imm-range 0 65535 1))))
)

(bfclamp
  ("bfclamp_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bfclamp_mz_zz_2" "{Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("bfclamp_mz_zz_4" "{Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
)

(ld1rob
  ("ld1rob_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rob_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ld1rqw
  ("ld1rqw_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rqw_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldbfmaxnma
  ("LDBFMAXNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pacdb
  ("PACDB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmwtn
  ("CPYFMWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setgom
  ("SETGOM_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldfminal
  ("LDFMINAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDFMINAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stxrh
  ("STXRH_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ushl
  ("USHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("USHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldseth
  ("LDSETH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyptrn
  ("CPYPTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(aesemc
  ("aesemc_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
  ("aesemc_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
)

(aese
  ("aese_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("aese_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
  ("aese_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
  ("AESE_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsmaxb
  ("LDSMAXB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfprtwn
  ("CPYFPRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bfmls
  ("bfmls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmls_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfmls_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("bfmls_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmls_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmls_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfmls_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(uqdecp
  ("uqdecp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
  ("uqdecp_r_p_r_uw" "WUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
  ("uqdecp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
)

(frintm
  ("frintm_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintm_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("frintm_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
  ("frintm_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("FRINTM_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTM_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTM_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTM_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FRINTM_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtsetl
  ("LDTSETL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTSETL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfmaxnmal
  ("LDBFMAXNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcpy
  ("fcpy_z_p_i_" "ZUInteger.H, PUInteger/M, Real" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
)

(cbnz
  ("CBNZ_32_compbranch" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
  ("CBNZ_64_compbranch" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
)

(rsubhnt
  ("rsubhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stlrh
  ("STLRH_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stfadd
  ("STFADD_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFADD_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFADD_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(smaddl
  ("SMADDL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqxtunt
  ("sqxtunt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stbfmaxl
  ("STBFMAXL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(ursqrte
  ("ursqrte_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ursqrte_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("URSQRTE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ld1q
  ("ld1q_z_p_ar_d_64_unscaled" "{Z UInteger .Q}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1q_za_p_rrr_" "{ZA UInteger H .Q [W UInteger 0]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
)

(ld4
  ("LD4_asisdlse_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsep_R4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsep_I4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlso_B4_4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlso_H4_4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlso_S4_4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlso_D4_4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_BX4_r4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_HX4_r4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_SX4_r4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_DX4_r4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_B4_i4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_H4_i4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_S4_i4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD4_asisdlsop_D4_i4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 32" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldbfminl
  ("LDBFMINL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ld1rod
  ("ld1rod_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld1rod_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(ldeor
  ("LDEOR_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDEOR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(st4h
  ("st4h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st4h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(cmpge
  ("cmpge_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpge_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("cmpge_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
)

(rcwswppa
  ("RCWSWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(saddlbt
  ("saddlbt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(pacizb
  ("PACIZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(pmlal
  ("pmlal_mz_zzzw_1x2" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 15))))
)

(swpp
  ("SWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bfmlslt
  ("bfmlslt_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmlslt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
)

(brkpb
  ("brkpb_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(cpyprtrn
  ("CPYPRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(bic
  ("bic_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bic_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("bic_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("BIC_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BIC_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BIC_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("BIC_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
  ("BIC_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
)

(cpyfm
  ("CPYFM_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtaddal
  ("LDTADDAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTADDAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(svc
  ("SVC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
)

(sqxtun
  ("SQXTUN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("SQXTUN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldbfaddl
  ("LDBFADDL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfmt
  ("CPYFMT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsetl
  ("LDSETL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sha512su1
  ("SHA512SU1_VVV2_cryptosha512_3" "VUInteger.2D, VUInteger.2D, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(casplt
  ("CASPLT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfmwt
  ("CPYFMWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uzp
  ("uzp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("uzp_mz_zz_2q" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("uzp_mz_z_4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
  ("uzp_mz_z_4q" "{Z UInteger .Q- Z UInteger .Q}, {Z UInteger .Q- Z UInteger .Q}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
)

(bfmla
  ("bfmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("bfmla_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfmla_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("bfmla_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmla_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("bfmla_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("bfmla_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(ld2
  ("LD2_asisdlse_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsep_R2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsep_I2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlso_B2_2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlso_H2_2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlso_S2_2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlso_D2_2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_BX2_r2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_HX2_r2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_SX2_r2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_DX2_r2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_B2_i2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_H2_i2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_S2_i2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LD2_asisdlsop_D2_i2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsetalh
  ("LDSETALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ctz
  ("CTZ_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CTZ_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpypwtn
  ("CPYPWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sys
  ("SYS_CR_systeminstrs" "UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
)

(ushr
  ("USHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("USHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(lduminh
  ("LDUMINH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cpyfetn
  ("CPYFETN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fexpa
  ("fexpa_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(dcps2
  ("DCPS2_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
)

(stllrh
  ("STLLRH_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fcmlt
  ("fcmlt_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("FCMLT_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLT_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLT_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FCMLT_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stfmax
  ("STFMAX_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAX_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
  ("STFMAX_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
)

(cpypwn
  ("CPYPWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(eorbt
  ("eorbt_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(bti
  ("BTI_HB_hints" "" ())
)

(rcwsetpal
  ("RCWSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pmov
  ("pmov_p_zi_b" "PUInteger.B, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("pmov_p_zi_h" "PUInteger.H, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("pmov_p_zi_s" "PUInteger.S, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("pmov_p_zi_d" "PUInteger.D, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
  ("pmov_z_pi_b" "ZUInteger, PUInteger.B" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("pmov_z_pi_h" "ZUInteger, PUInteger.H" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("pmov_z_pi_s" "ZUInteger, PUInteger.S" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("pmov_z_pi_d" "ZUInteger, PUInteger.D" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
)

(rshrnt
  ("rshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(stilp
  ("STILP_32SE_ldiappstilp" "WZR, WZR, [SP -8], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STILP_32S_ldiappstilp" "WZR, WZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STILP_64SS_ldiappstilp" "XZR, XZR, [SP -16], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STILP_64S_ldiappstilp" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(wrffr
  ("wrffr_f_p_" "PUInteger.B" (("Pn" (reg-range 0 15))))
)

(rcwsswppa
  ("RCWSSWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(casalb
  ("CASALB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ldsmaxh
  ("LDSMAXH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(lsr
  ("lsr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
  ("lsr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("lsr_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("lsr_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("lsr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld3d
  ("ld3d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld3d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(lduminl
  ("LDUMINL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMINL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uqrshlr
  ("uqrshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
)

(ldsetp
  ("LDSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(umullt
  ("umullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("umullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("umullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ldumaxa
  ("LDUMAXA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDUMAXA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(cmge
  ("CMGE_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGE_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGE_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMGE_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldtsetal
  ("LDTSETAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDTSETAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(brkb
  ("brkb_p_p_p_" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
)

(fsubr
  ("fsubr_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("fsubr_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
)

(stxp
  ("STXP_SP32_ldstexclp" "WZR, WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STXP_SP64_ldstexclp" "WZR, XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stlxp
  ("STLXP_SP32_ldstexclp" "WZR, WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLXP_SP64_ldstexclp" "WZR, XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(bf2cvtlt
  ("bf2cvtlt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(pacm
  ("PACM_HI_hints" "" ())
)

(ldsmaxah
  ("LDSMAXAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(ptest
  ("ptest__p_p_" "PUInteger, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15))))
)

(svdot
  ("svdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("svdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("svdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
)

(rcwsclral
  ("RCWSCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sxth
  ("sxth_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("sxth_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ld3b
  ("ld3b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("ld3b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(fmulx
  ("fmulx_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FMULX_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMULX_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldapur
  ("LDAPUR_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_B_ldapstl_simd" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_Q_ldapstl_simd" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_H_ldapstl_simd" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_S_ldapstl_simd" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDAPUR_D_ldapstl_simd" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(fmov
  ("FMOV_asimdimm_S_s" "VUInteger.2S, SInteger" (("Rd" (reg-range 0 31))))
  ("FMOV_asimdimm_H_h" "VUInteger.4H, SInteger" (("Rd" (reg-range 0 31))))
  ("FMOV_asimdimm_D2_d" "VUInteger.2D, SInteger" (("Rd" (reg-range 0 31))))
  ("FMOV_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_64VX_float2int" "XZR, VUInteger.D[1]" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_V64I_float2int" "VUInteger.D[1], XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMOV_S_floatimm" "SUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
  ("FMOV_D_floatimm" "DUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
  ("FMOV_H_floatimm" "HUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
)

(addva
  ("addva_za_pp_z_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("addva_za_pp_z_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(umops
  ("umops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("umops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("umops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(usubwt
  ("usubwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(addpl
  ("addpl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
)

(retaa
  ("RETAA_64E_branch_reg" "" ())
)

(ldrb
  ("LDRB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDRB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uminp
  ("uminp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("UMINP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(sqrshrnt
  ("sqrshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(ushllb
  ("ushllb_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(bfcvtn
  ("bfcvtn_z8_mz2_bf2b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("bfcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
  ("BFCVTN_asimdmisc_4S" "VUInteger.4H, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(raddhn
  ("RADDHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(st64bv0
  ("ST64BV0_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(movn
  ("MOVN_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
  ("MOVN_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
)

(fminnmqv
  ("fminnmqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
)

(ldumaxlh
  ("LDUMAXLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(pfalse
  ("pfalse_p_" "PUInteger.B" (("Pd" (reg-range 0 15))))
)

(ldaddb
  ("LDADDB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(add
  ("add_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("add_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("add_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
  ("add_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("add_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
  ("add_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("add_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
  ("add_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("add_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
  ("add_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("add_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("ADD_32_addsub_imm" "WSP, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_64_addsub_imm" "SP, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_32_addsub_ext" "WSP, WSP, WZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_64_addsub_ext" "SP, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("ADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fmlalltt
  ("fmlalltt_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("fmlalltt_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
  ("FMLALLTT_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FMLALLTT_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyp
  ("CPYP_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(setet
  ("SETET_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(zip1
  ("zip1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("zip1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("zip1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("ZIP1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(blraa
  ("BLRAA_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
)

(st4b
  ("st4b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
  ("st4b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
)

(revh
  ("revh_z_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("revh_z_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(bfscale
  ("bfscale_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("bfscale_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfscale_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
  ("bfscale_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("bfscale_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
)

(ldsmaxab
  ("LDSMAXAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sunpkhi
  ("sunpkhi_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(smlsll
  ("smlsll_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlsll_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlsll_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlsll_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlsll_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("smlsll_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
  ("smlsll_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("smlsll_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
  ("smlsll_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
  ("smlsll_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
  ("smlsll_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(stltxr
  ("STLTXR_SR32_ldstexclr_unpriv" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLTXR_SR64_ldstexclr_unpriv" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(sqrshrunb
  ("sqrshrunb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
)

(bmopa
  ("bmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(ldsmaxl
  ("LDSMAXL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("LDSMAXL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(famax
  ("famax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("famax_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
  ("famax_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
  ("FAMAX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FAMAX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cmhs
  ("CMHS_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMHS_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(stxr
  ("STXR_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STXR_SR64_ldstexclr" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(setgoetn
  ("SETGOETN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(swp
  ("SWP_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("SWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(stlxr
  ("STLXR_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
  ("STLXR_SR64_ldstexclr" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(uclamp
  ("uclamp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uclamp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("uclamp_mz_zz_4" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
)

(smopa
  ("smopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("smopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
  ("smopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
)

(autdzb
  ("AUTDZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
)

(sha256h2
  ("SHA256H2_QQV_cryptosha3" "QUInteger, QUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(uzp1
  ("uzp1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("uzp1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
  ("uzp1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
  ("UZP1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpypwt
  ("CPYPWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(fabd
  ("fabd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
  ("FABD_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABD_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABD_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("FABD_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cmlt
  ("CMLT_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
  ("CMLT_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(cpyfmtwn
  ("CPYFMTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(ldsetalb
  ("LDSETALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

(smop4a
  ("smop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
  ("smop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
)

(uunpk
  ("uunpk_mz_z_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
  ("uunpk_mz_z_4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
)

(aesmc
  ("aesmc_z_z_" "ZUInteger.B, ZUInteger.B" (("Zdn" (reg-range 0 31))))
  ("AESMC_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
)

(casalh
  ("CASALH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
)

