;; 整合表: mnemonic -> layer1 -> layer2 -> encodings
;; 生成命令: racket syntax/gen-cached.rkt

(stp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("STP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("STP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory pre-index)
      ("STP_32_ldstpair_pre" "WZR, WZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory immediate)
      ("STP_32_ldstpair_post" "WZR, WZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory immediate)
      ("STP_S_ldstpair_post" "SUInteger, SUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_D_ldstpair_post" "DUInteger, DUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory pre-index)
      ("STP_S_ldstpair_pre" "SUInteger, SUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_D_ldstpair_pre" "DUInteger, DUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((simd-scalar simd-scalar memory)
      ("STP_S_ldstpair_off" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_D_ldstpair_off" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("STP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("STP_32_ldstpair_off" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sunpklo
  (c2
    ((sve-z sve-z)
      ("sunpklo_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("LDP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("LDP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory pre-index)
      ("LDP_32_ldstpair_pre" "WZR, WZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory immediate)
      ("LDP_32_ldstpair_post" "WZR, WZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory immediate)
      ("LDP_S_ldstpair_post" "SUInteger, SUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_D_ldstpair_post" "DUInteger, DUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory pre-index)
      ("LDP_S_ldstpair_pre" "SUInteger, SUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_D_ldstpair_pre" "DUInteger, DUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDP_S_ldstpair_off" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_D_ldstpair_off" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("LDP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDP_32_ldstpair_off" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(blraaz
  (c1
    ((gpr-64)
      ("BLRAAZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(sqcvtu
  (c2
    ((sve-z reg-list)
      ("sqcvtu_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqcvtu_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sabdl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SABDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfmrt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpymt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfpwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(zipq2
  (c3
    ((sve-z sve-z sve-z)
      ("zipq2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1sw
  (c2
    ((reg-list sve-p)
      ("ld1sw_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sw_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sw_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sw_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1sw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sw_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sw_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cbz
  (c2
    ((gpr-64 immediate)
      ("CBZ_64_compbranch" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("CBZ_32_compbranch" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(casalt
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASALT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(usubwb
  (c3
    ((sve-z sve-z sve-z)
      ("usubwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sttxr
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STTXR_SR32_ldstexclr_unpriv" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-64 memory)
      ("STTXR_SR64_ldstexclr_unpriv" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgoptn
  (c0m1
    ((memory gpr-64)
      ("SETGOPTN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsswppl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sha1p
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA1P_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(addhn
  (c3
    ((simd-vector simd-vector simd-vector)
      ("ADDHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldtrsw
  (c1m
    ((gpr-64 memory)
      ("LDTRSW_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fminv
  (c2
    ((simd-scalar simd-vector)
      ("FMINV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("fminv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(uxth
  (c3
    ((sve-z sve-p sve-z)
      ("uxth_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("uxth_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldnf1b
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1b_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1b_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1b_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1b_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(autibsppcr
  (c1
    ((gpr-64)
      ("AUTIBSPPCR_64LRR_dp_1src" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(str
  (c1m1
    ((gpr-32 memory pre-index)
      ("STR_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory pre-index)
      ("STR_B_ldst_immpre" "BUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_Q_ldst_immpre" "QUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_H_ldst_immpre" "HUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_S_ldst_immpre" "SUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_D_ldst_immpre" "DUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory pre-index)
      ("STR_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("STR_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("STR_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory immediate)
      ("STR_B_ldst_immpost" "BUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_Q_ldst_immpost" "QUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_H_ldst_immpost" "HUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_S_ldst_immpost" "SUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_D_ldst_immpost" "DUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("str_za_ri_" "ZA[WUInteger, UInteger, [SP]" (("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("STR_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((sve-p memory)
      ("str_p_bi_" "PUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Pt" (reg-range 0 15))))
    )
    ((simd-scalar memory)
      ("STR_B_ldst_regoff" "BUInteger, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_BL_ldst_regoff" "BUInteger, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_Q_ldst_regoff" "QUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_H_ldst_regoff" "HUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_S_ldst_regoff" "SUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_D_ldst_regoff" "DUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_B_ldst_pos" "BUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_Q_ldst_pos" "QUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_H_ldst_pos" "HUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_S_ldst_pos" "SUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_D_ldst_pos" "DUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((sme-zt memory)
      ("str_zt_br_" "ZT0, [SP]" (("Rn" (reg-range 0 31))))
    )
    ((sve-z memory)
      ("str_z_bi_" "ZUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STR_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STR_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(blr
  (c1
    ((gpr-64)
      ("BLR_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(ctermeq
  (c2
    ((gpr-32 gpr-32)
      ("ctermeq_rr_" "WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ldumaxl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMAXL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMAXL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfmin
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMIN_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(usmmla
  (c3
    ((simd-vector simd-vector simd-vector)
      ("USMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("usmmla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(orrs
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("orrs_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ld1rsw
  (c2m
    ((reg-list sve-p memory)
      ("ld1rsw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(bfm
  (c4
    ((gpr-64 gpr-64 immediate immediate)
      ("BFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate immediate)
      ("BFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(f1cvtl
  (c2
    ((simd-vector simd-vector)
      ("F1CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z)
      ("f1cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(cpyfmrtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cblt
  (c3
    ((gpr-64 immediate immediate)
      ("CBLT_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBLT_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(shadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("shadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(crc32w
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32W_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfmop4s
  (c3
    ((sme-za reg-list sve-z)
      ("bfmop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4s_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("bfmop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4s_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("bfmop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4s_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("bfmop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4s_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(stur
  (c1m
    ((gpr-32 memory)
      ("STUR_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory)
      ("STUR_B_ldst_unscaled" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STUR_Q_ldst_unscaled" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STUR_H_ldst_unscaled" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STUR_S_ldst_unscaled" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STUR_D_ldst_unscaled" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STUR_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqrshr
  (c3
    ((sve-z reg-list immediate)
      ("uqrshr_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("uqrshr_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqxtn
  (c2
    ((simd-vector simd-vector)
      ("SQXTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SQXTN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(adr
  (c2
    ((gpr-64 immediate)
      ("ADR_only_pcreladdr" "XZR, SInteger" (("immlo" (imm-range 0 3 1)) ("immhi" (imm-range 0 524287 1)) ("Rd" (reg-range 0 31))))
    )
  )
  (c1m
    ((sve-z memory)
      ("adr_z_az_d_s32_scaled" "ZUInteger.D, [Z UInteger .D Z UInteger .D SXTW]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("adr_z_az_d_u32_scaled" "ZUInteger.D, [Z UInteger .D Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("adr_z_az_sd_same_scaled" "ZUInteger.S, [Z UInteger . S Z UInteger . S]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyert
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYERT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cntp
  (c3
    ((gpr-64 sve-pn vector-length)
      ("cntp_r_pn_" "XUInteger, PNUInteger.B, VLx2" (("size" (element-size B H S D)) ("PNn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 sve-p sve-p)
      ("cntp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
    )
  )
)

(decb
  (c1
    ((gpr-64)
      ("decb_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(cpymtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(gcsb
  (c1
    ((barrier-option)
      ("GCSB_HD_hints" "DSYNC" ())
    )
  )
)

(setgmtn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGMTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsseta
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sel
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sel_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-p sve-p sve-p sve-p)
      ("sel_p_p_pp_" "PUInteger.B, PUInteger, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((reg-list sve-pn reg-list reg-list)
      ("sel_mz_p_zz_2" "{Z UInteger . B - Z UInteger . B}, PNUInteger, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("sel_mz_p_zz_4" "{Z UInteger . B - Z UInteger . B}, PNUInteger, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
  )
)

(nbsl
  (c4
    ((sve-z sve-z sve-z sve-z)
      ("nbsl_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(compact
  (c3
    ((sve-z sve-p sve-z)
      ("compact_z_p_z_s" "ZUInteger.B, PUInteger, ZUInteger.B" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("compact_z_p_z_" "ZUInteger.S, PUInteger, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smlal
  (c1
    ((sme-za)
      ("smlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("smlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("smlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("smlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("smlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("smlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMLAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(strb
  (c1m1
    ((gpr-32 memory pre-index)
      ("STRB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("STRB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("STRB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STRB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STRB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sm3partw2
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3PARTW2_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sysp
  (c4
    ((immediate system-reg system-reg immediate)
      ("SYSP_CR_syspairinstrs" "UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
    )
  )
)

(ldfmaxnmal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNMAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNMAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(autibsppc
  (c1
    ((immediate)
      ("AUTIBSPPC_only_dp_1src_imm" "SInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(fscale
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fscale_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FSCALE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSCALE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fscale_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fscale_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("fscale_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fscale_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(stlurb
  (c1m
    ((gpr-32 memory)
      ("STLURB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sbcs
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("SBCS_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("SBCS_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st1
  (c1m1
    ((reg-list memory immediate)
      ("ST1_asisdlsep_I4_i4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_I3_i3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_I1_i1" "{V UInteger . 8B}, [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_I2_i2" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("ST1_asisdlsep_R4_r4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_R3_r3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_R1_r1" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsep_R2_r2" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("ST1_asisdlso_B1_1b" "{V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlso_H1_1h" "{V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlso_S1_1s" "{V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlso_D1_1d" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("ST1_asisdlsop_B1_i1b" "{V UInteger . B}, [UInteger], [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_H1_i1h" "{V UInteger . H}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_S1_i1s" "{V UInteger . S}, [UInteger], [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_D1_i1d" "{V UInteger . D}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("ST1_asisdlsop_BX1_r1b" "{V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_HX1_r1h" "{V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_SX1_r1s" "{V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlsop_DX1_r1d" "{V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("ST1_asisdlse_R4_4v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlse_R3_3v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlse_R1_1v" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST1_asisdlse_R2_2v" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rprfm
  (c2m
    ((prefetch-op gpr-64 memory)
      ("RPRFM_R_ldst_regoff" "PLDKEEP, XZR, [SP]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtn
  (c2
    ((simd-vector simd-vector)
      ("FCVTN_asimdmisc_N" "VUInteger.4H, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list)
      ("fcvtn_z8_mz2_h2b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("fcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("fcvtn_z8_mz4_" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FCVTN_asimdsame2_H" "VUInteger.8B, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTN_asimdsame2_D" "VUInteger.8B, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwscaspl
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWSCASPL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mad
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("mad_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(umullb
  (c3
    ((sve-z sve-z sve-z)
      ("umullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("umullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("umullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwswppal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stbfminl
  (c1m
    ((simd-scalar memory)
      ("STBFMINL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(setget
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGET_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sm3tt1a
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3TT1A_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cbhgt
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHGT_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqdecp
  (c2
    ((gpr-64 sve-p)
      ("sqdecp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("sqdecp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 sve-p gpr-32)
      ("sqdecp_r_p_r_sx" "XUInteger, PUInteger.B, WUInteger" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(umlalt
  (c3
    ((sve-z sve-z sve-z)
      ("umlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpyfewtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(nmatch
  (c4
    ((sve-p sve-p sve-z sve-z)
      ("nmatch_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(sxtw
  (c3
    ((sve-z sve-p sve-z)
      ("sxtw_z_p_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sxtw_z_p_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fcvtl
  (c2
    ((simd-vector simd-vector)
      ("FCVTL_asimdmisc_L" "VUInteger.4S, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z)
      ("fcvtl_mz2_z_" "{Z UInteger .S- Z UInteger .S}, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(ldclr
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDCLR_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(addsvl
  (c3
    ((gpr-64 gpr-64 immediate)
      ("addsvl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld3q
  (c2
    ((reg-list sve-p)
      ("ld3q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld3q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldsetb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(st2h
  (c2
    ((reg-list sve-p)
      ("st2h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st2h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(udf
  (c1
    ((immediate)
      ("UDF_only_perm_undef" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(rcwssetpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(orns
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("orns_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ld1roh
  (c2
    ((reg-list sve-p)
      ("ld1roh_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1roh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(st3
  (c1m1
    ((reg-list memory immediate)
      ("ST3_asisdlsep_I3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("ST3_asisdlsep_R3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("ST3_asisdlso_B3_3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlso_H3_3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlso_S3_3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlso_D3_3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("ST3_asisdlsop_B3_i3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_H3_i3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 6" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_S3_i3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 12" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_D3_i3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 24" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("ST3_asisdlsop_BX3_r3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_HX3_r3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_SX3_r3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST3_asisdlsop_DX3_r3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("ST3_asisdlse_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stxrb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STXRB_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsswpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(srhadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("srhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SRHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcmeq
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmeq_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("fcmeq_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-scalar simd-scalar float-const)
      ("FCMEQ_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMEQ_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("FCMEQ_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMEQ_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FCMEQ_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMEQ_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector float-const)
      ("FCMEQ_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMEQ_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtzun
  (c2
    ((sve-z reg-list)
      ("fcvtzun_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bif
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BIF_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpymn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(frecps
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FRECPS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRECPS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FRECPS_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRECPS_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("frecps_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cmla
  (c4
    ((sve-z sve-z sve-z immediate)
      ("cmla_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("cmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("cmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(tchangeb
  (c2
    ((immediate gpr-64)
      ("TCHANGEB_tc_reg" "UInteger, XUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((immediate immediate)
      ("TCHANGEB_tc_imm" "UInteger, UInteger" (("imm7" (imm-range 0 127 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfpwt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwswpp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uvdot
  (c1
    ((sme-za)
      ("uvdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("uvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("uvdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(psb
  (c1
    ((barrier-option)
      ("PSB_HC_hints" "CSYNC" ())
    )
  )
)

(cmle
  (c3
    ((simd-scalar simd-scalar immediate)
      ("CMLE_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("CMLE_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfmwtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtpu
  (c2
    ((simd-vector simd-vector)
      ("FCVTPU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTPU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTPU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTPU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(lastp
  (c3
    ((gpr-64 sve-p sve-p)
      ("lastp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldsetlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fnmad
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fnmad_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(smull
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(udivr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("udivr_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(eortb
  (c3
    ((sve-z sve-z sve-z)
      ("eortb_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fsub_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fsub_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("fsub_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fsub_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c1m1
    ((sme-za memory reg-list)
      ("fsub_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fsub_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FSUB_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSUB_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FSUB_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSUB_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSUB_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fsub_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwswpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldfmaxnm
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNM_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNM_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfpt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtps
  (c2
    ((simd-vector simd-vector)
      ("FCVTPS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTPS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTPS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTPS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTPS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfminnml
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNML_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNML_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("uqsub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UQSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("UQSUB_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uqsub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(uaddw
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UADDW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(texit
  (c0
    (()
      ("TEXIT_te_branch_reg" "" ())
    )
  )
)

(fcvtzu
  (c2
    ((simd-vector simd-vector)
      ("FCVTZU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("fcvtzu_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("fcvtzu_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTZU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTZU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTZU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("FCVTZU_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar immediate)
      ("FCVTZU_32S_float2fix" "WZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_32D_float2fix" "WZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_32H_float2fix" "WZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar immediate)
      ("FCVTZU_64S_float2fix" "XZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_64D_float2fix" "XZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZU_64H_float2fix" "XZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("FCVTZU_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z)
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
    )
  )
)

(uabal
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UABAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uabal_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpyewn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rshrn
  (c3
    ((simd-vector simd-vector immediate)
      ("RSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldnf1h
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1h_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1h_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1h_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(casal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASAL_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("CASAL_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyertn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYERTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(movt
  (c2
    ((gpr-64 sme-zt)
      ("movt_r_zt_" "XUInteger, ZT0[UInteger" (("off3" (imm-range 0 7 1)) ("Rt" (reg-range 0 31))))
    )
    ((sme-zt sve-z)
      ("movt_zt_z_" "ZT0, ZUInteger" (("off2" (imm-range 0 3 1)) ("Zt" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-zt)
      ("movt_zt_r_" "ZT0[UInteger, XUInteger" (("off3" (imm-range 0 7 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uxtb
  (c3
    ((sve-z sve-p sve-z)
      ("uxtb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("uxtb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fmsb
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmsb_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(sha1h
  (c2
    ((simd-scalar simd-scalar)
      ("SHA1H_SS_cryptosha2" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldraa
  (c1m1
    ((gpr-64 memory pre-index)
      ("LDRAA_64W_ldst_pac" "XZR, [SP], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("LDRAA_64_ldst_pac" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(st3b
  (c2m
    ((reg-list sve-p memory)
      ("st3b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st3b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(uhadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldlarb
  (c1m
    ((gpr-32 memory)
      ("LDLARB_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(fnmla
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fnmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(st1w
  (c2
    ((reg-list sve-pn)
      ("st1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("st1w_z_p_br_u128" "{Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_br_" "{Z UInteger . S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bi_u128" "{Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_z_p_bi_" "{Z UInteger . S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1w_za_p_rrr_" "{ZA UInteger H .S [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
    ((reg-list sve-pn memory)
      ("st1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(aesdimc
  (c3
    ((reg-list reg-list sve-z)
      ("aesdimc_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
      ("aesdimc_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(uqrshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqrshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UQRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("UQRSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldumaxh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fminp
  (c2
    ((simd-scalar simd-vector)
      ("FMINP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fminp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMINP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyprtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ftmad
  (c4
    ((sve-z sve-z sve-z immediate)
      ("ftmad_z_zzi_" "ZUInteger.H, ZUInteger.H, ZUInteger.H, UInteger" (("size" (element-size B H S D)) ("imm3" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(fcmne
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmne_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("fcmne_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ldlarh
  (c1m
    ((gpr-32 memory)
      ("LDLARH_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(f1cvt
  (c2
    ((reg-list sve-z)
      ("f1cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
    ((sve-z sve-z)
      ("f1cvt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(scvtflt
  (c2
    ((sve-z sve-z)
      ("scvtflt_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smulh
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("smulh_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("SMULH_64_dp_3src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("smulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smmla
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("smmla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(urecpe
  (c2
    ((simd-vector simd-vector)
      ("URECPE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("urecpe_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("urecpe_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st3d
  (c2
    ((reg-list sve-p)
      ("st3d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st3d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(csdb
  (c0
    (()
      ("CSDB_HI_hints" "" ())
    )
  )
)

(swppl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(f2cvtlt
  (c2
    ((sve-z sve-z)
      ("f2cvtlt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bfadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("bfadd_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfadd_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("bfadd_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fvdotb
  (c3
    ((sme-za reg-list sve-z)
      ("fvdotb_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger, VGx4], {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(ldset
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSET_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsclra
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgen
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGEN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ftssel
  (c3
    ((sve-z sve-z sve-z)
      ("ftssel_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldfadd
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFADD_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADD_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADD_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcmgt
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmgt_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("fcmgt_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-scalar simd-scalar float-const)
      ("FCMGT_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGT_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("FCMGT_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGT_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FCMGT_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGT_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector float-const)
      ("FCMGT_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGT_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stfmaxnml
  (c1m
    ((simd-scalar memory)
      ("STFMAXNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXNML_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXNML_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(csinv
  (c4
    ((gpr-32 gpr-32 gpr-32 cond-code)
      ("CSINV_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 cond-code)
      ("CSINV_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(shsubr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("shsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(addspl
  (c3
    ((gpr-64 gpr-64 immediate)
      ("addspl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autdza
  (c1
    ((gpr-64)
      ("AUTDZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(uaba
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UABA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uaba_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(stlurh
  (c1m
    ((gpr-32 memory)
      ("STLURH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmpne
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmpne_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmpne_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmpne_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(fmlal
  (c1
    ((sme-za)
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
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLAL_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLAL_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cbbgt
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBGT_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cas
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CAS_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("CAS_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(casah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASAH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(irg
  (c2
    ((gpr-64 gpr-64)
      ("IRG_64I_dp_2src" "SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(eretaa
  (c0
    (()
      ("ERETAA_64E_branch_reg" "" ())
    )
  )
)

(msubpt
  (c4
    ((gpr-64 gpr-64 gpr-64 gpr-64)
      ("MSUBPT_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldumaxlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldnf1d
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1d_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ld2r
  (c1m1
    ((reg-list memory immediate)
      ("LD2R_asisdlsop_R2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD2R_asisdlsop_RX2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD2R_asisdlso_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsetlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqdmlslbt
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlslbt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(braa
  (c2
    ((gpr-64 gpr-64)
      ("BRAA_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
    )
  )
)

(rcwclrpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(suqadd
  (c2
    ((simd-vector simd-vector)
      ("SUQADD_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SUQADD_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("suqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldclralh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rev
  (c2
    ((gpr-64 gpr-64)
      ("REV_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("REV_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-p sve-p)
      ("rev_p_p_" "PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((sve-z sve-z)
      ("rev_z_z_" "ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqdmull
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQDMULL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQDMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQDMULL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQDMULL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st1q
  (c2m
    ((reg-list sve-p memory)
      ("st1q_z_p_ar_d_64_unscaled" "{Z UInteger .Q}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1q_za_p_rrr_" "{ZA UInteger H .Q [W UInteger 0]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
)

(addg
  (c4
    ((gpr-64 gpr-64 immediate immediate)
      ("ADDG_64_addsub_immtags" "SP, SP, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cmeq
  (c3
    ((simd-scalar simd-scalar immediate)
      ("CMEQ_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("CMEQ_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("CMEQ_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMEQ_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setp
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETP_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(usqadd
  (c2
    ((simd-vector simd-vector)
      ("USQADD_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("USQADD_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("usqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cnt
  (c2
    ((simd-vector simd-vector)
      ("CNT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("CNT_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("CNT_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("cnt_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("cnt_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqincp
  (c2
    ((gpr-64 sve-p)
      ("sqincp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("sqincp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 sve-p gpr-32)
      ("sqincp_r_p_r_sx" "XUInteger, PUInteger.B, WUInteger" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(umull
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UMULL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldapurb
  (c1m
    ((gpr-32 memory)
      ("LDAPURB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ssubwb
  (c3
    ((sve-z sve-z sve-z)
      ("ssubwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyewtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rsubhnb
  (c3
    ((sve-z sve-z sve-z)
      ("rsubhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldar
  (c1m
    ((gpr-32 memory)
      ("LDAR_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAR_LR64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sabd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sabd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SABD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(umlalb
  (c3
    ((sve-z sve-z sve-z)
      ("umlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(rcwsswpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldfadda
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFADDA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cntb
  (c1
    ((gpr-64)
      ("cntb_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fdiv
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fdiv_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FDIV_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDIV_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FDIV_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDIV_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDIV_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqdecb
  (c2
    ((gpr-64 gpr-32)
      ("sqdecb_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqdecb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(cmphs
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmphs_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmphs_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmphs_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(autizb
  (c1
    ((gpr-64)
      ("AUTIZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(fminqv
  (c3
    ((simd-vector sve-p sve-z)
      ("fminqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(bit
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BIT_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqdmlslt
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cbhi
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBHI_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 immediate immediate)
      ("CBHI_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBHI_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBHI_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sbc
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("SBC_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("SBC_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfetrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFETRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyetrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYETRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfmwtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtzs
  (c2
    ((simd-vector simd-vector)
      ("FCVTZS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("fcvtzs_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("fcvtzs_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTZS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTZS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTZS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("FCVTZS_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar immediate)
      ("FCVTZS_32S_float2fix" "WZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_32D_float2fix" "WZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_32H_float2fix" "WZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar immediate)
      ("FCVTZS_64S_float2fix" "XZR, SUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_64D_float2fix" "XZR, DUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTZS_64H_float2fix" "XZR, HUInteger, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("FCVTZS_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z)
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
    )
  )
)

(uqincd
  (c1
    ((gpr-64)
      ("uqincd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqincd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqincd_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(addhnb
  (c3
    ((sve-z sve-z sve-z)
      ("addhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1rqb
  (c2m
    ((reg-list sve-p memory)
      ("ld1rqb_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rqb_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldbfminnma
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smlalb
  (c3
    ((sve-z sve-z sve-z)
      ("smlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(tchangef
  (c2
    ((immediate gpr-64)
      ("TCHANGEF_tc_reg" "UInteger, XUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((immediate immediate)
      ("TCHANGEF_tc_imm" "UInteger, UInteger" (("imm7" (imm-range 0 127 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldarb
  (c1m
    ((gpr-32 memory)
      ("LDARB_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwswpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(decp
  (c2
    ((gpr-64 sve-p)
      ("decp_r_p_r_" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("decp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(stbfminnml
  (c1m
    ((simd-scalar memory)
      ("STBFMINNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ldap
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDAP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsminlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsminal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMINAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMINAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmop4a
  (c3
    ((sme-za reg-list sve-z)
      ("bfmop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4a_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("bfmop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4a_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("bfmop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4a_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("bfmop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("bfmop4a_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(setgopt
  (c0m1
    ((memory gpr-64)
      ("SETGOPT_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpypt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(whilele
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilele_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilele_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilele_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(brk
  (c1
    ((immediate)
      ("BRK_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(ldnt1sb
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1sb_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1sb_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(stnt1b
  (c2m
    ((reg-list sve-p memory)
      ("stnt1b_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1b_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1b_z_p_br_contiguous" "{Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1b_z_p_bi_contiguous" "{Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("stnt1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
      ("stnt1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(rcwscas
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCAS_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stnt1d
  (c2
    ((reg-list sve-pn)
      ("stnt1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("stnt1d_z_p_br_contiguous" "{Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("stnt1d_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1d_z_p_bi_contiguous" "{Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("stnt1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(umlslt
  (c3
    ((sve-z sve-z sve-z)
      ("umlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldapursw
  (c1m
    ((gpr-64 memory)
      ("LDAPURSW_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmaxnmv
  (c2
    ((simd-scalar simd-vector)
      ("FMAXNMV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNMV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("fmaxnmv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(index
  (c3
    ((sve-z immediate gpr-32)
      ("index_z_ir_" "ZUInteger.B, SInteger, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("imm5" (imm-range 0 31 1)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z gpr-32 gpr-32)
      ("index_z_rr_" "ZUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z gpr-32 immediate)
      ("index_z_ri_" "ZUInteger.B, WZR, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z immediate immediate)
      ("index_z_ii_" "ZUInteger.B, SInteger, SInteger" (("size" (element-size B H S D)) ("imm5b" (imm-range 0 31 1)) ("imm5" (imm-range 0 31 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqneg
  (c2
    ((simd-vector simd-vector)
      ("SQNEG_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SQNEG_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("sqneg_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqneg_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldtp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("LDTP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("LDTP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory immediate)
      ("LDTP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory pre-index)
      ("LDTP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDTP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("LDTP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(caspa
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPA_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 gpr-32 memory)
      ("CASPA_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1rqd
  (c2
    ((reg-list sve-p)
      ("ld1rqd_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1rqd_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sqdmulh
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQDMULH_asimdsame_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQDMULH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQDMULH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("sqdmulh_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("sqdmulh_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQDMULH_asisdsame_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("sqdmulh_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("sqdmulh_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("sqdmulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmulh_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmulh_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmulh_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(autia
  (c2
    ((gpr-64 gpr-64)
      ("AUTIA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(umax
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("umax_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("UMAX_64U_minmax_imm" "XZR, XZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("umax_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("UMAX_32U_minmax_imm" "WZR, WZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UMAX_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("UMAX_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("umax_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("umax_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("UMAX_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("umax_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("umax_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(ldarh
  (c1m
    ((gpr-32 memory)
      ("LDARH_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclra
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDCLRA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgopn
  (c0m1
    ((memory gpr-64)
      ("SETGOPN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(prfm
  (c2
    ((prefetch-op immediate)
      ("PRFM_P_loadlit" "PLDL1KEEP, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((prefetch-op memory)
      ("PRFM_P_ldst_regoff" "PLDL1KEEP, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("PRFM_P_ldst_pos" "PLDL1KEEP, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(whilewr
  (c3
    ((sve-p gpr-64 gpr-64)
      ("whilewr_p_rr_" "PUInteger.B, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ldaddab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtr
  (c1m
    ((gpr-32 memory)
      ("LDTR_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDTR_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sev
  (c0
    (()
      ("SEV_HI_hints" "" ())
    )
  )
)

(umop4s
  (c3
    ((sme-za reg-list sve-z)
      ("umop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("umop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("umop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("umop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(uqinch
  (c1
    ((gpr-64)
      ("uqinch_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqinch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqinch_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(ssubl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SSUBL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(asrd
  (c4
    ((sve-z sve-p sve-z immediate)
      ("asrd_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(frecpe
  (c2
    ((simd-vector simd-vector)
      ("FRECPE_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRECPE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z)
      ("frecpe_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRECPE_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRECPE_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqxtnb
  (c2
    ((sve-z sve-z)
      ("sqxtnb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqshlu
  (c4
    ((sve-z sve-p sve-z immediate)
      ("sqshlu_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQSHLU_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQSHLU_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sminp
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sminp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMINP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyewt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldsminah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgoet
  (c0m1
    ((memory gpr-64)
      ("SETGOET_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(clastb
  (c4
    ((gpr-32 sve-p gpr-32 sve-z)
      ("clastb_r_p_z_" "WZR, PUInteger, WZR, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z sve-z)
      ("clastb_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-scalar sve-p simd-scalar sve-z)
      ("clastb_v_p_z_" "BUInteger, PUInteger, BUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
    )
  )
)

(st3h
  (c2
    ((reg-list sve-p)
      ("st3h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st3h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(casab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASAB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfminnmal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uzpq1
  (c3
    ((sve-z sve-z sve-z)
      ("uzpq1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldsminh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyertrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYERTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sm3ss1
  (c4
    ((simd-vector simd-vector simd-vector simd-vector)
      ("SM3SS1_VVV4_crypto4" "VUInteger.4S, VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgp
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGP_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(umlall
  (c1
    ((sme-za)
      ("umlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlall_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlall_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("umlall_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("umlall_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("umlall_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
    )
    ((sme-za memory reg-list reg-list)
      ("umlall_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlall_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za memory sve-z sve-z)
      ("umlall_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
  )
)

(sttr
  (c1m
    ((gpr-32 memory)
      ("STTR_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STTR_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sm3tt2a
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3TT2A_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldtclr
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTCLR_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTCLR_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldgm
  (c1m
    ((gpr-64 memory)
      ("LDGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(trn1
  (c3
    ((sve-p sve-p sve-p)
      ("trn1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("TRN1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("trn1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("trn1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fcvtns
  (c2
    ((simd-vector simd-vector)
      ("FCVTNS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTNS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTNS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTNS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pmullb
  (c3
    ((sve-z sve-z sve-z)
      ("pmullb_z_zz_q" "ZUInteger.Q, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("pmullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld4q
  (c2
    ((reg-list sve-p)
      ("ld4q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld4q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cmplt
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmplt_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmplt_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(whilerw
  (c3
    ((sve-p gpr-64 gpr-64)
      ("whilerw_p_rr_" "PUInteger.B, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ftsmul
  (c3
    ((sve-z sve-z sve-z)
      ("ftsmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cbhs
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBHS_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBHS_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fjcvtzs
  (c2
    ((gpr-32 simd-scalar)
      ("FJCVTZS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(punpklo
  (c2
    ((sve-p sve-p)
      ("punpklo_p_p_" "PUInteger.H, PUInteger.B" (("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(cmphi
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmphi_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmphi_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmphi_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(cnth
  (c1
    ((gpr-64)
      ("cnth_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(dech
  (c1
    ((gpr-64)
      ("dech_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("dech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(sqdech
  (c2
    ((gpr-64 gpr-32)
      ("sqdech_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqdech_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqdech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(sqinch
  (c2
    ((gpr-64 gpr-32)
      ("sqinch_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqinch_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqinch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(setgoen
  (c0m1
    ((memory gpr-64)
      ("SETGOEN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(brabz
  (c1
    ((gpr-64)
      ("BRABZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(fnmsub
  (c4
    ((simd-scalar simd-scalar simd-scalar simd-scalar)
      ("FNMSUB_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMSUB_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMSUB_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(whilehs
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilehs_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilehs_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilehs_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(fcvtnu
  (c2
    ((simd-vector simd-vector)
      ("FCVTNU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTNU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTNU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTNU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTNU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqrshrn
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQRSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQRSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("sqrshrn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshrn_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshrn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(mvni
  (c2
    ((simd-vector immediate)
      ("MVNI_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
      ("MVNI_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((simd-vector immediate keyword immediate)
      ("MVNI_asimdimm_M_sm" "VUInteger.2S, UInteger, MSL, 8" (("Rd" (reg-range 0 31))))
    )
  )
)

(usublb
  (c3
    ((sve-z sve-z sve-z)
      ("usublb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cbgt
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBGT_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 immediate immediate)
      ("CBGT_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBGT_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBGT_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfminal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uhsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uhsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UHSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bcax
  (c4
    ((simd-vector simd-vector simd-vector simd-vector)
      ("BCAX_VVV16_crypto4" "VUInteger.16B, VUInteger.16B, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z sve-z)
      ("bcax_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsminlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("smops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("smops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("smops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(fcvtxn
  (c2
    ((simd-vector simd-vector)
      ("FCVTXN_asimdmisc_N" "VUInteger.2S, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTXN_asisdmisc_N" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(swpalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stnt1h
  (c2
    ((reg-list sve-pn)
      ("stnt1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("stnt1h_z_p_br_contiguous" "{Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("stnt1h_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1h_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1h_z_p_bi_contiguous" "{Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("stnt1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(incw
  (c1
    ((gpr-64)
      ("incw_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("incw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(saddv
  (c3
    ((simd-scalar sve-p sve-z)
      ("saddv_r_p_z_" "DUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(cntd
  (c1
    ((gpr-64)
      ("cntd_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(clrex
  (c0
    (()
      ("CLREX_BN_barriers" "" ())
    )
  )
)

(sqdecd
  (c2
    ((gpr-64 gpr-32)
      ("sqdecd_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqdecd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqdecd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(swpta
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPTA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPTA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmlal2
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLAL2_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLAL2_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(subps
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("SUBPS_64S_dp_2src" "XZR, SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldnt1w
  (c2
    ((reg-list sve-pn)
      ("ldnt1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ldnt1w_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1w_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1w_z_p_bi_contiguous" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1w_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("ldnt1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(lduminab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uaddwb
  (c3
    ((sve-z sve-z sve-z)
      ("uaddwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldxrh
  (c1m
    ((gpr-32 memory)
      ("LDXRH_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtzsn
  (c2
    ((sve-z reg-list)
      ("fcvtzsn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(uadalp
  (c2
    ((simd-vector simd-vector)
      ("UADALP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("uadalp_z_p_z_" "ZUInteger.H, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(uqincp
  (c2
    ((gpr-64 sve-p)
      ("uqincp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("uqincp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 sve-p)
      ("uqincp_r_p_r_uw" "WUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(blrabz
  (c1
    ((gpr-64)
      ("BLRABZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(decd
  (c1
    ((gpr-64)
      ("decd_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("decd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldapurh
  (c1m
    ((gpr-32 memory)
      ("LDAPURH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(lastb
  (c3
    ((gpr-32 sve-p sve-z)
      ("lastb_r_p_z_" "WZR, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar sve-p sve-z)
      ("lastb_v_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(extr
  (c4
    ((gpr-64 gpr-64 gpr-64 immediate)
      ("EXTR_64_extract" "XZR, XZR, XZR, UInteger" (("Rm" (reg-range 0 31)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 immediate)
      ("EXTR_32_extract" "WZR, WZR, WZR, UInteger" (("Rm" (reg-range 0 31)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(prfw
  (c2
    ((prefetch-op sve-p)
      ("prfw_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfw_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfw_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfw_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
  (c2m
    ((prefetch-op sve-p memory)
      ("prfw_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfw_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("prfw_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(autiasp
  (c0
    (()
      ("AUTIASP_HI_hints" "" ())
    )
  )
)

(b
  (c1
    ((immediate)
      ("B_only_condbranch" "SInteger" (("imm19" (imm-range 0 524287 1))))
      ("B_only_branch_imm" "SInteger" (("imm26" (imm-range 0 67108863 1))))
    )
  )
)

(sqincb
  (c2
    ((gpr-64 gpr-32)
      ("sqincb_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqincb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(movz
  (c2
    ((gpr-64 immediate)
      ("MOVZ_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("MOVZ_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uabalt
  (c3
    ((sve-z sve-z sve-z)
      ("uabalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ssra
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("ssra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sminv
  (c2
    ((simd-scalar simd-vector)
      ("SMINV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("sminv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(cpypn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwssetpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmax
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfmax_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmax_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfmax_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmax_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(umlsll
  (c1
    ((sme-za)
      ("umlsll_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlsll_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlsll_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlsll_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlsll_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("umlsll_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("umlsll_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("umlsll_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
    )
    ((sme-za memory reg-list reg-list)
      ("umlsll_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("umlsll_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za memory sve-z sve-z)
      ("umlsll_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
  )
)

(adds
  (c5
    ((gpr-64 gpr-64 gpr-32 keyword immediate)
      ("ADDS_64S_addsub_ext" "XZR, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("ADDS_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("ADDS_32S_addsub_ext" "WZR, WSP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("ADDS_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("ADDS_64S_addsub_imm" "XZR, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("ADDS_32S_addsub_imm" "WZR, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st64b
  (c1m
    ((gpr-64 memory)
      ("ST64B_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsminab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldeora
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDEORA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDEORA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uhsubr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uhsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(zip
  (c2
    ((reg-list reg-list)
      ("zip_mz_z_4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
      ("zip_mz_z_4q" "{Z UInteger .Q- Z UInteger .Q}, {Z UInteger .Q- Z UInteger .Q}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list sve-z sve-z)
      ("zip_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("zip_mz_zz_2q" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(usubl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("USUBL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfmaxnma
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNMA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNMA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpymwtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqincd
  (c2
    ((gpr-64 gpr-32)
      ("sqincd_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqincd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqincd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(pacib
  (c2
    ((gpr-64 gpr-64)
      ("PACIB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfmaxnm
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmaxnmp
  (c2
    ((simd-scalar simd-vector)
      ("FMAXNMP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNMP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmaxnmp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMAXNMP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNMP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwclrl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsminb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sttp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("STTP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("STTP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory immediate)
      ("STTP_Q_ldstpair_post" "QUInteger, QUInteger, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar memory pre-index)
      ("STTP_Q_ldstpair_pre" "QUInteger, QUInteger, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((simd-scalar simd-scalar memory)
      ("STTP_Q_ldstpair_off" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("STTP_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ctermne
  (c2
    ((gpr-32 gpr-32)
      ("ctermne_rr_" "WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ldnt1sh
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1sh_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1sh_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ld3w
  (c2
    ((reg-list sve-p)
      ("ld3w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld3w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sevl
  (c0
    (()
      ("SEVL_HI_hints" "" ())
    )
  )
)

(sha1su1
  (c2
    ((simd-vector simd-vector)
      ("SHA1SU1_VV_cryptosha2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(swpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmlallbb
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALLBB_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALLBB_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlallbb_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlallbb_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fmlslt
  (c3
    ((sve-z sve-z sve-z)
      ("fmlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlslt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldbfadda
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFADDA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(facgt
  (c4
    ((sve-p sve-p sve-z sve-z)
      ("facgt_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FACGT_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FACGT_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FACGT_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FACGT_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqrdmlsh
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQRDMLSH_asimdsame2_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQRDMLSH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQRDMLSH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQRDMLSH_asisdsame2_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sqrdmlsh_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlsh_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlsh_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlsh_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fmlallbt
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALLBT_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALLBT_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlallbt_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlallbt_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(gcssttr
  (c1m
    ((gpr-64 memory)
      ("GCSSTTR_64_ldst_gcs" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1b
  (c2
    ((reg-list sve-p)
      ("ld1b_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
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
      ("ld1b_za_p_rrr_" "{ZA0 H .B [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
    )
    ((reg-list sve-pn memory)
      ("ld1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
      ("ld1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(sudot
  (c1
    ((sme-za)
      ("sudot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sudot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("sudot_za_zzv_s2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("sudot_za_zzv_s4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SUDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sudot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldur
  (c1m
    ((gpr-32 memory)
      ("LDUR_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory)
      ("LDUR_B_ldst_unscaled" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDUR_Q_ldst_unscaled" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDUR_H_ldst_unscaled" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDUR_S_ldst_unscaled" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDUR_D_ldst_unscaled" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDUR_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sm4ekey
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM4EKEY_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sm4ekey_z_zz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpymwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uabdlt
  (c3
    ((sve-z sve-z sve-z)
      ("uabdlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldaxr
  (c1m
    ((gpr-32 memory)
      ("LDAXR_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAXR_LR64_ldstexclr" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsetl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cbbne
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBNE_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stfminnml
  (c1m
    ((simd-scalar memory)
      ("STFMINNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINNML_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINNML_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(umlal
  (c1
    ((sme-za)
      ("umlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("umlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("umlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("umlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("umlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("umlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMLAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(srshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("srshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("srshl_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("srshl_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SRSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("srshl_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("srshl_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(saddlt
  (c3
    ((sve-z sve-z sve-z)
      ("saddlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fdup
  (c2
    ((sve-z float-const)
      ("fdup_z_i_" "ZUInteger.H, Real" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyprt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sumlall
  (c1
    ((sme-za)
      ("sumlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("sumlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("sumlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("sumlall_za_zzv_s2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("sumlall_za_zzv_s4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
    )
  )
)

(ushll
  (c3
    ((simd-vector simd-vector immediate)
      ("USHLL_asimdshf_L" "VUInteger.8H, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sli
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SLI_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SLI_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("sli_z_zzi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfertwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFERTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfcvt
  (c2
    ((simd-scalar simd-scalar)
      ("BFCVT_BS_floatdp1" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list)
      ("bfcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("bfcvt_z8_mz2_" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("bfcvt_z_p_z_s2bfz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("bfcvt_z_p_z_s2bf" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1d
  (c2
    ((reg-list sve-pn)
      ("ld1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ld1d_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_br_u128" "{Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1d_z_p_bi_u128" "{Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1d_za_p_rrr_" "{ZA UInteger H .D [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("ld1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(pacibsp
  (c0
    (()
      ("PACIBSP_HI_hints" "" ())
    )
  )
)

(cpyptn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stllr
  (c1m
    ((gpr-32 memory)
      ("STLLR_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STLLR_SL64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mla
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("mla_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("MLA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("MLA_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("mla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("mla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("mla_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(braaz
  (c1
    ((gpr-64)
      ("BRAAZ_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(cpymtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwclr
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmple
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmple_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmple_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(cpyet
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYET_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqxtnb
  (c2
    ((sve-z sve-z)
      ("uqxtnb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldff1b
  (c2
    ((reg-list sve-p)
      ("ldff1b_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1b_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_br_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1b_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(udot
  (c1
    ((sme-za)
      ("udot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("udot_za32_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("udot_za32_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("udot_za32_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("udot_za32_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("udot_za32_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("udot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z16_zzz_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z32_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z32_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("udot_z16_zzzi_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("udot_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("udot_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("udot_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(umulh
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("umulh_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("UMULH_64_dp_3src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("umulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smlall
  (c1
    ((sme-za)
      ("smlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlall_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlall_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("smlall_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("smlall_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("smlall_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
    )
    ((sme-za memory reg-list reg-list)
      ("smlall_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlall_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za memory sve-z sve-z)
      ("smlall_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
  )
)

(sqshrnt
  (c3
    ((sve-z sve-z immediate)
      ("sqshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(autibz
  (c0
    (()
      ("AUTIBZ_HI_hints" "" ())
    )
  )
)

(ldurh
  (c1m
    ((gpr-32 memory)
      ("LDURH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcmla
  (c5
    ((sve-z sve-p sve-z sve-z immediate)
      ("fcmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c4
    ((simd-vector simd-vector simd-vector immediate)
      ("FCMLA_asimdsame2_C" "VUInteger.4H, VUInteger.4H, VUInteger.4H, 0" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMLA_advsimd_elt" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger], 0" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("fcmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fcmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ssubltb
  (c3
    ((sve-z sve-z sve-z)
      ("ssubltb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(mrrs
  (c3
    ((gpr-64 gpr-64 system-reg)
      ("MRRS_RS_systemmovepr" "XZR, XUInteger, ACTLR_EL3" (("Rt" (reg-range 0 31))))
    )
  )
)

(ldumaxalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ands
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("ANDS_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("ANDS_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("ands_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("ANDS_64S_log_imm" "XZR, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("ANDS_32S_log_imm" "WZR, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(saddl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SADDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fminnmv
  (c2
    ((simd-scalar simd-vector)
      ("FMINNMV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNMV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("fminnmv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(urhadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("urhadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("URHADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(frint32x
  (c2
    ((simd-vector simd-vector)
      ("FRINT32X_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINT32X_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINT32X_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frint32x_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frint32x_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(saddlp
  (c2
    ((simd-vector simd-vector)
      ("SADDLP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(adclt
  (c3
    ((sve-z sve-z sve-z)
      ("adclt_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(uqsubr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldfminnma
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNMA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNMA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtadd
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTADD_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTADD_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtxr
  (c1m
    ((gpr-32 memory)
      ("LDTXR_LR32_ldstexclr_unpriv" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDTXR_LR64_ldstexclr_unpriv" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(caspalt
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPALT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(raddhnb
  (c3
    ((sve-z sve-z sve-z)
      ("raddhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(uabalb
  (c3
    ((sve-z sve-z sve-z)
      ("uabalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(eret
  (c0
    (()
      ("ERET_64E_branch_reg" "" ())
    )
  )
)

(lsrv
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("LSRV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("LSRV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sumops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("sumops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("sumops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(uqadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("uqadd_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UQADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("UQADD_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uqadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fcadd
  (c5
    ((sve-z sve-p sve-z sve-z immediate)
      ("fcadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H, 90" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c4
    ((simd-vector simd-vector simd-vector immediate)
      ("FCADD_asimdsame2_C" "VUInteger.4H, VUInteger.4H, VUInteger.4H, 90" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sub
  (c5
    ((gpr-64 gpr-64 gpr-32 keyword immediate)
      ("SUB_64_addsub_ext" "SP, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("SUB_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("SUB_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1m1
    ((sme-za memory reg-list)
      ("sub_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sub_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("SUB_64_addsub_imm" "SP, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("sub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("SUB_32_addsub_imm" "WSP, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("SUB_32_addsub_ext" "WSP, WSP, WZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SUB_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("sub_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("sub_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("sub_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sub_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(nands
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("nands_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(uqincb
  (c1
    ((gpr-64)
      ("uqincb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqincb_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(ldaxp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDAXP_LP64_ldstexclp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDAXP_LP32_ldstexclp" "WZR, WZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmul
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmul_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfmul_mz_zzv_2x1" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("bfmul_mz_zzv_4x1" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfmul_mz_zzw_2x2" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("bfmul_mz_zzw_4x4" "{Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("bfmul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("bfmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bfmlsl
  (c1
    ((sme-za)
      ("bfmlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("bfmlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("bfmlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("bfmlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("bfmlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("bfmlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
)

(ldclral
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDCLRAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(msub
  (c4
    ((gpr-32 gpr-32 gpr-32 gpr-32)
      ("MSUB_32A_dp_3src" "WZR, WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 gpr-64)
      ("MSUB_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyprn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpymrtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwswppl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldumin
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMIN_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMIN_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uaddwt
  (c3
    ((sve-z sve-z sve-z)
      ("uaddwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cbbhi
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBHI_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stbfmaxnml
  (c1m
    ((simd-scalar memory)
      ("STBFMAXNML_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(pmullt
  (c3
    ((sve-z sve-z sve-z)
      ("pmullt_z_zz_q" "ZUInteger.Q, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("pmullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(frint32z
  (c2
    ((simd-vector simd-vector)
      ("FRINT32Z_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINT32Z_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINT32Z_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frint32z_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frint32z_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqincw
  (c2
    ((gpr-64 gpr-32)
      ("sqincw_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqincw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqincw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(hvc
  (c1
    ((immediate)
      ("HVC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(swppal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclrpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cnot
  (c3
    ((sve-z sve-p sve-z)
      ("cnot_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("cnot_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1h
  (c2
    ((reg-list sve-pn)
      ("ld1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ld1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1h_za_p_rrr_" "{ZA UInteger H .H [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((reg-list sve-pn memory)
      ("ld1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(ld1rqh
  (c2
    ((reg-list sve-p)
      ("ld1rqh_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1rqh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldsetpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pacia1716
  (c0
    (()
      ("PACIA1716_HI_hints" "" ())
    )
  )
)

(rax1
  (c3
    ((simd-vector simd-vector simd-vector)
      ("RAX1_VVV2_cryptosha512_3" "VUInteger.2D, VUInteger.2D, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("rax1_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fmaxqv
  (c3
    ((simd-vector sve-p sve-z)
      ("fmaxqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(smullb
  (c3
    ((sve-z sve-z sve-z)
      ("smullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("smullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("smullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(yield
  (c0
    (()
      ("YIELD_HI_hints" "" ())
    )
  )
)

(rcwcasp
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWCASP_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(crc32b
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32B_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwcasl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCASL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stgm
  (c1m
    ((gpr-64 memory)
      ("STGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cbhne
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHNE_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(umaxp
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("umaxp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMAXP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ucvtf
  (c2
    ((simd-vector simd-vector)
      ("UCVTF_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-64)
      ("UCVTF_S64_float2int" "SUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("ucvtf_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("ucvtf_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z)
      ("ucvtf_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("UCVTF_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_sisd_32D" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_sisd_32H" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_sisd_64H" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_sisd_64S" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-32)
      ("UCVTF_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_D32_float2int" "DUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("UCVTF_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("UCVTF_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z)
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
    )
    ((simd-scalar gpr-64 immediate)
      ("UCVTF_S64_float2fix" "SUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_D64_float2fix" "DUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_H64_float2fix" "HUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-32 immediate)
      ("UCVTF_S32_float2fix" "SUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_D32_float2fix" "DUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UCVTF_H32_float2fix" "HUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(xar
  (c4
    ((sve-z sve-z sve-z immediate)
      ("xar_z_zzi_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector immediate)
      ("XAR_VVV2_crypto3_imm6" "VUInteger.2D, VUInteger.2D, VUInteger.2D, UInteger" (("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bc
  (c1
    ((immediate)
      ("BC_only_condbranch" "SInteger" (("imm19" (imm-range 0 524287 1))))
    )
  )
)

(pacdza
  (c1
    ((gpr-64)
      ("PACDZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(sqrdcmlah
  (c4
    ((sve-z sve-z sve-z immediate)
      ("sqrdcmlah_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("sqrdcmlah_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdcmlah_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(st3w
  (c2
    ((reg-list sve-p)
      ("st3w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st3w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(setmt
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETMT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(smsubl
  (c4
    ((gpr-64 gpr-32 gpr-32 gpr-64)
      ("SMSUBL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldff1sw
  (c2
    ((reg-list sve-p)
      ("ldff1sw_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sw_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sw_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1sw_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sw_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sw_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(luti6
  (c3m
    ((reg-list reg-list reg-list memory)
      ("luti6_mz4_zmz2_1" "{Z UInteger .H - Z UInteger .H}, {Z UInteger .H Z UInteger .H}, {Z UInteger - Z UInteger}, [UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
      ("luti6_mz4_zmz2_4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, {Z UInteger .H Z UInteger .H}, {Z UInteger - Z UInteger}, [UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
    )
  )
  (c3
    ((reg-list sme-zt reg-list)
      ("luti6_mz4_ztmz3_1" "{Z UInteger .B - Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
      ("luti6_mz4_ztmz3_4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 3))))
    )
    ((sve-z reg-list sve-z)
      ("luti6_z_zzz_8" "ZUInteger.B, {Z UInteger .B Z UInteger .B}, ZUInteger" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("luti6_z_zzz_16" "ZUInteger.H, {Z UInteger .H Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sme-zt sve-z)
      ("luti6_z_ztz_" "ZUInteger.B, ZT0, ZUInteger" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(revw
  (c3
    ((sve-z sve-p sve-z)
      ("revw_z_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("revw_z_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stfminl
  (c1m
    ((simd-scalar memory)
      ("STFMINL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(stbfaddl
  (c1m
    ((simd-scalar memory)
      ("STBFADDL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(smlalt
  (c3
    ((sve-z sve-z sve-z)
      ("smlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cfinv
  (c0
    (()
      ("CFINV_M_pstate" "" ())
    )
  )
)

(sumop4a
  (c3
    ((sme-za reg-list sve-z)
      ("sumop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("sumop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("sumop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("sumop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(rdvl
  (c2
    ((gpr-64 immediate)
      ("rdvl_r_i_" "XUInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsetpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclrah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(brkns
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkns_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pdm" (reg-range 0 15))))
    )
  )
)

(st1b
  (c2m
    ((reg-list sve-p memory)
      ("st1b_z_p_br_" "{Z UInteger . B}, PUInteger, [SP X UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_z_p_bi_" "{Z UInteger . B}, PUInteger, [SP]" (("size" (element-size B H S D)) ("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1b_za_p_rrr_" "{ZA0 H .B [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
    )
    ((reg-list sve-pn memory)
      ("st1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
      ("st1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(ldtaddl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTADDL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTADDL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pacnbiasppc
  (c0
    (()
      ("PACNBIASPPC_64LR_dp_1src" "" ())
    )
  )
)

(hint
  (c1
    ((immediate)
      ("HINT_HM_hints" "UInteger" ())
    )
  )
)

(cpyen
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(subp
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("subp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("SUBP_64S_dp_2src" "XZR, SP, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bf1cvtlt
  (c2
    ((sve-z sve-z)
      ("bf1cvtlt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cmgt
  (c3
    ((simd-scalar simd-scalar immediate)
      ("CMGT_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("CMGT_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("CMGT_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMGT_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldaddalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmad
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmad_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(setf8
  (c1
    ((gpr-32)
      ("SETF8_only_setf" "WZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(ldeorl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDEORL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDEORL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmin
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfmin_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmin_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfmin_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmin_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(cpyfmtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(lsrr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("lsrr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldumaxalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pacib171615
  (c0
    (()
      ("PACIB171615_64LR_dp_1src" "" ())
    )
  )
)

(sha256su1
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SHA256SU1_VVV_cryptosha3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fabs
  (c2
    ((simd-vector simd-vector)
      ("FABS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FABS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FABS_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FABS_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FABS_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("fabs_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fabs_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldumax
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMAX_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMAX_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(addvl
  (c3
    ((gpr-64 gpr-64 immediate)
      ("addvl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(tbx
  (c3
    ((simd-vector reg-list simd-vector)
      ("TBX_asimdtbl_L1_1" "VUInteger.8B, {V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBX_asimdtbl_L2_2" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBX_asimdtbl_L3_3" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBX_asimdtbl_L4_4" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("tbx_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqcvt
  (c2
    ((sve-z reg-list)
      ("sqcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqcvt_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(luti2
  (c3
    ((sve-z reg-list sve-z)
      ("luti2_z_zz_8" "ZUInteger.B, {Z UInteger .B}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("luti2_z_zz_16" "ZUInteger.H, {Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-vector reg-list simd-element)
      ("LUTI2_asimdtbl_L5" "VUInteger.16B, {V UInteger . 16B}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("LUTI2_asimdtbl_L6" "VUInteger.8H, {V UInteger . 8H}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sme-zt sve-z)
      ("luti2_z_ztz_" "ZUInteger.B, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((reg-list sme-zt sve-z)
      ("luti2_mz2_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("luti2_mz4_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
      ("luti2_mz2_ztz_8" "{Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
      ("luti2_mz4_ztz_4" "{Z UInteger . B Z UInteger . B Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
    )
  )
)

(sshllb
  (c3
    ((sve-z sve-z immediate)
      ("sshllb_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ssubw
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SSUBW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcmle
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmle_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-scalar simd-scalar float-const)
      ("FCMLE_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMLE_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector float-const)
      ("FCMLE_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMLE_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(whilelt
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilelt_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilelt_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilelt_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(tbz
  (c3
    ((gpr-32 immediate immediate)
      ("TBZ_only_testbranch" "WZR, UInteger, SInteger" (("imm14" (imm-range 0 16383 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwclrp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(casb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ssubwt
  (c3
    ((sve-z sve-z sve-z)
      ("ssubwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rev16
  (c2
    ((simd-vector simd-vector)
      ("REV16_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("REV16_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("REV16_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fnmul
  (c3
    ((simd-scalar simd-scalar simd-scalar)
      ("FNMUL_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMUL_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMUL_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld1rw
  (c2m
    ((reg-list sve-p memory)
      ("ld1rw_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rw_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sabalb
  (c3
    ((sve-z sve-z sve-z)
      ("sabalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(usvdot
  (c1
    ((sme-za)
      ("usvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(cbhhi
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHHI_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtnp
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDTNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("LDTNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwscasa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCASA_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mova
  (c2
    ((reg-list sme-za)
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
  )
  (c1
    ((sme-za)
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
    )
  )
  (c3
    ((sve-z sve-p sme-za)
      ("mova_z_p_rza_b" "ZUInteger.B, PUInteger/M, ZA0H.B[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off4" (imm-range 0 15 1)) ("Zd" (reg-range 0 31))))
      ("mova_z_p_rza_h" "ZUInteger.H, PUInteger/M, ZAUIntegerH.H[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 31))))
      ("mova_z_p_rza_w" "ZUInteger.S, PUInteger/M, ZAUIntegerH.S[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 31))))
      ("mova_z_p_rza_d" "ZUInteger.D, PUInteger/M, ZAUIntegerH.D[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
      ("mova_z_p_rza_q" "ZUInteger.Q, PUInteger/M, ZAUIntegerH.Q[WUInteger, 0" (("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(caspat
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPAT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsset
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cls
  (c2
    ((simd-vector simd-vector)
      ("CLS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("CLS_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("CLS_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("cls_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("cls_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(setmn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETMN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsclr
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldeorh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fminnmp
  (c2
    ((simd-scalar simd-vector)
      ("FMINNMP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNMP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fminnmp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMINNMP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNMP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(gmi
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("GMI_64G_dp_2src" "XZR, SP, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(movaz
  (c2
    ((sve-z sme-za)
      ("movaz_z_rza_b" "ZUInteger.B, ZA0H.B[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off4" (imm-range 0 15 1)) ("Zd" (reg-range 0 31))))
      ("movaz_z_rza_h" "ZUInteger.H, ZAUIntegerH.H[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off3" (imm-range 0 7 1)) ("Zd" (reg-range 0 31))))
      ("movaz_z_rza_w" "ZUInteger.S, ZAUIntegerH.S[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("off2" (imm-range 0 3 1)) ("Zd" (reg-range 0 31))))
      ("movaz_z_rza_d" "ZUInteger.D, ZAUIntegerH.D[WUInteger, UInteger" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 31))))
      ("movaz_z_rza_q" "ZUInteger.Q, ZAUIntegerH.Q[WUInteger, 0" (("Rs" (reg-range 0 3)) ("Zd" (reg-range 0 31))))
    )
    ((reg-list sme-za)
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
  )
)

(luti4
  (c3
    ((reg-list sme-zt reg-list)
      ("luti4_mz4_ztmz2_1" "{Z UInteger .B- Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
      ("luti4_mz4_ztmz2_4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, ZT0, {Z UInteger - Z UInteger}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 3))))
    )
    ((sve-z reg-list sve-z)
      ("luti4_z_zz_8" "ZUInteger.B, {Z UInteger .B}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("luti4_z_zz_2x16" "ZUInteger.H, {Z UInteger .H Z UInteger . H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("luti4_z_zz_1x16" "ZUInteger.H, {Z UInteger .H}, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-vector reg-list simd-element)
      ("LUTI4_asimdtbl_L7" "VUInteger.8H, {V UInteger . 8H V UInteger . 8H}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("LUTI4_asimdtbl_L5" "VUInteger.16B, {V UInteger . 16B}, VUInteger[UInteger]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sme-zt sve-z)
      ("luti4_z_ztz_" "ZUInteger.B, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((reg-list sme-zt sve-z)
      ("luti4_mz2_ztz_1" "{Z UInteger . B - Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("luti4_mz4_ztz_1" "{Z UInteger . H - Z UInteger . H}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
      ("luti4_mz2_ztz_8" "{Z UInteger . B Z UInteger . B}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
      ("luti4_mz4_ztz_4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, ZT0, ZUInteger[UInteger]" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 3))))
    )
  )
)

(sqdmlsl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQDMLSL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQDMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQDMLSL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQDMLSL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setmtn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETMTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(xpacd
  (c1
    ((gpr-64)
      ("XPACD_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(msb
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("msb_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(swpalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cbhhs
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHHS_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(crc32cx
  (c3
    ((gpr-32 gpr-32 gpr-64)
      ("CRC32CX_64C_dp_2src" "WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(subhnt
  (c3
    ((sve-z sve-z sve-z)
      ("subhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fmop4s
  (c3
    ((sme-za reg-list sve-z)
      ("fmop4s_za_zz_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_d2x1" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("fmop4s_za_zz_s2x2" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_d2x2" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("fmop4s_za_zz_s1x1" "ZAUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_d1x1" "ZAUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("fmop4s_za_zz_s1x2" "ZAUInteger.S, ZUInteger.S, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4s_za_zz_d1x2" "ZAUInteger.D, ZUInteger.D, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(autda
  (c2
    ((gpr-64 gpr-64)
      ("AUTDA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpym
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYM_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(blrab
  (c2
    ((gpr-64 gpr-64)
      ("BLRAB_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
    )
  )
)

(aesd
  (c2
    ((simd-vector simd-vector)
      ("AESD_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("aesd_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
      ("aesd_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("aesd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsmaxa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMAXA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMAXA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cash
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld2b
  (c2m
    ((reg-list sve-p memory)
      ("ld2b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld2b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(rcwclrpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(shll
  (c3
    ((simd-vector simd-vector immediate)
      ("SHLL_asimdmisc_S" "VUInteger.8H, VUInteger.8B, 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fdot
  (c1
    ((sme-za)
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
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FDOT_asimdsame2_DD" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDOT_asimdsame2_D" "VUInteger.4H, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDOT_asimdsame2_FP16FP32" "VUInteger.2S, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDOT_asimdelem_G" "VUInteger.4H, VUInteger.8B, VUInteger.2B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FDOT_asimdelem_FP16FP32" "VUInteger.2S, VUInteger.4H, VUInteger.2H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fdot_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fdot_z_zz8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fdot_z32_zz8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fdot_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fdot_z_zz8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fdot_z32_zz8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fmopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("fmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmopa_za32_pp_z8z8_8" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmopa_za16_pp_z8z8_8" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmopa_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(cpyewtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(flogb
  (c3
    ((sve-z sve-p sve-z)
      ("flogb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("flogb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(autia1716
  (c0
    (()
      ("AUTIA1716_HI_hints" "" ())
    )
  )
)

(famin
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("famin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FAMIN_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FAMIN_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("famin_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("famin_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(dcps1
  (c0
    (()
      ("DCPS1_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(bfmaxnm
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmaxnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfmaxnm_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmaxnm_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfmaxnm_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfmaxnm_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(cbne
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBNE_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 immediate immediate)
      ("CBNE_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBNE_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBNE_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsswppal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(dup
  (c2
    ((simd-vector simd-vector)
      ("DUP_asimdins_DV_v" "VUInteger.8B, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z gpr-32)
      ("dup_z_r_" "ZUInteger.B, WSP" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-scalar simd-vector)
      ("DUP_asisdone_only" "BUInteger, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z)
      ("dup_z_zi_" "ZUInteger.Q, ZUInteger.Q[UInteger]" (("imm2" (imm-range 0 3 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-vector gpr-32)
      ("DUP_asimdins_DR_r" "VUInteger.8B, WZR" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z immediate)
      ("dup_z_i_" "ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stbfadd
  (c1m
    ((simd-scalar memory)
      ("STBFADD_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(hlt
  (c1
    ((immediate)
      ("HLT_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(ldumina
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMINA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMINA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldr
  (c2
    ((gpr-64 immediate)
      ("LDR_64_loadlit" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("LDR_32_loadlit" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar immediate)
      ("LDR_S_loadlit" "SUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
      ("LDR_D_loadlit" "DUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
      ("LDR_Q_loadlit" "QUInteger, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m1
    ((gpr-32 memory pre-index)
      ("LDR_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory pre-index)
      ("LDR_B_ldst_immpre" "BUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_Q_ldst_immpre" "QUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_H_ldst_immpre" "HUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_S_ldst_immpre" "SUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_D_ldst_immpre" "DUInteger, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory pre-index)
      ("LDR_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("LDR_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDR_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory immediate)
      ("LDR_B_ldst_immpost" "BUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_Q_ldst_immpost" "QUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_H_ldst_immpost" "HUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_S_ldst_immpost" "SUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_D_ldst_immpost" "DUInteger, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("ldr_za_ri_" "ZA[WUInteger, UInteger, [SP]" (("Rn" (reg-range 0 31)) ("off4" (imm-range 0 15 1))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDR_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((sve-p memory)
      ("ldr_p_bi_" "PUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Pt" (reg-range 0 15))))
    )
    ((simd-scalar memory)
      ("LDR_B_ldst_regoff" "BUInteger, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_BL_ldst_regoff" "BUInteger, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_Q_ldst_regoff" "QUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_H_ldst_regoff" "HUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_S_ldst_regoff" "SUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_D_ldst_regoff" "DUInteger, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_B_ldst_pos" "BUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_Q_ldst_pos" "QUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_H_ldst_pos" "HUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_S_ldst_pos" "SUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_D_ldst_pos" "DUInteger, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((sme-zt memory)
      ("ldr_zt_br_" "ZT0, [SP]" (("Rn" (reg-range 0 31))))
    )
    ((sve-z memory)
      ("ldr_z_bi_" "ZUInteger, [SP]" (("imm9h" (imm-range 0 63 1)) ("imm9l" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDR_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDR_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfp
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFP_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(movi
  (c2
    ((simd-vector immediate)
      ("MOVI_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
      ("MOVI_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
      ("MOVI_asimdimm_D2_d" "VUInteger.2D, UInteger" (("Rd" (reg-range 0 31))))
    )
    ((simd-scalar immediate)
      ("MOVI_asimdimm_D_ds" "DUInteger, UInteger" (("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((simd-vector immediate keyword immediate)
      ("MOVI_asimdimm_M_sm" "VUInteger.2S, UInteger, MSL, 8" (("Rd" (reg-range 0 31))))
      ("MOVI_asimdimm_N_b" "VUInteger.8B, UInteger, LSL, 0" (("Rd" (reg-range 0 31))))
    )
  )
)

(adcs
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("ADCS_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("ADCS_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(match
  (c4
    ((sve-p sve-p sve-z sve-z)
      ("match_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(whilegt
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilegt_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilegt_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilegt_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(fvdott
  (c3
    ((sme-za reg-list sve-z)
      ("fvdott_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger, VGx4], {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(cpyfetwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFETWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(tblq
  (c3
    ((sve-z reg-list sve-z)
      ("tblq_z_zz_" "ZUInteger.B, {Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld2d
  (c2
    ((reg-list sve-p)
      ("ld2d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld2d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(stmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("stmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("stmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(rbit
  (c2
    ((simd-vector simd-vector)
      ("RBIT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("RBIT_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("RBIT_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("rbit_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("rbit_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(frintn
  (c2
    ((simd-vector simd-vector)
      ("FRINTN_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTN_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("frintn_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("frintn_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTN_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTN_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTN_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frintn_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frintn_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldsetpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1sh
  (c2
    ((reg-list sve-p)
      ("ld1sh_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1sh_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1sh_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sqxtnt
  (c2
    ((sve-z sve-z)
      ("sqxtnt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sttnp
  (c2m
    ((simd-scalar simd-scalar memory)
      ("STTNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("STTNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtlt
  (c3
    ((sve-z sve-p sve-z)
      ("fcvtlt_z_p_z_h2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtlt_z_p_z_s2dz" "ZUInteger.D, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtlt_z_p_z_h2s" "ZUInteger.S, PUInteger/M, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtlt_z_p_z_s2d" "ZUInteger.D, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fccmpe
  (c4
    ((simd-scalar simd-scalar immediate cond-code)
      ("FCCMPE_S_floatccmp" "SUInteger, SUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCCMPE_D_floatccmp" "DUInteger, DUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCCMPE_H_floatccmp" "HUInteger, HUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(caspal
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPAL_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 gpr-32 memory)
      ("CASPAL_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bftmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("bftmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("bftmopa_za_zzzi_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(cpyfprtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(raddhnt
  (c3
    ((sve-z sve-z sve-z)
      ("raddhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st2b
  (c2m
    ((reg-list sve-p memory)
      ("st2b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st2b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(eors
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("eors_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(brkpa
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkpa_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(bext
  (c3
    ((sve-z sve-z sve-z)
      ("bext_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stbfminnm
  (c1m
    ((simd-scalar memory)
      ("STBFMINNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(fmmla
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMMLA_asimd_FP16FP16" "VUInteger.8H, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMMLA_asimd_FP8FP16" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMMLA_asimd_FP16FP32" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMMLA_asimd_FP8FP32" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmmla_z32_zz8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmmla_z16_zz8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmmla_z_zzz_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmmla_z32_zzz_h" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmmla_z_zzz_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmmla_z_zzz_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(subr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("subr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("subr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldapp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDAPP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(strh
  (c1m1
    ((gpr-32 memory pre-index)
      ("STRH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("STRH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("STRH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STRH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldfmaxl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtclral
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTCLRAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTCLRAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sunpk
  (c2
    ((reg-list reg-list)
      ("sunpk_mz_z_4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
    )
    ((reg-list sve-z)
      ("sunpk_mz_z_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(fmsub
  (c4
    ((simd-scalar simd-scalar simd-scalar simd-scalar)
      ("FMSUB_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMSUB_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMSUB_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(paciza
  (c1
    ((gpr-64)
      ("PACIZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(fmin
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmin_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fmin_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMIN_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMIN_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fmin_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmin_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMIN_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMIN_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMIN_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("fmin_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmin_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(cpyfprtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPRTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldaddalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldapr
  (c1m1
    ((gpr-64 memory immediate)
      ("LDAPR_64L_ldapstl_writeback" "XZR, [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDAPR_32L_ldapstl_writeback" "WZR, [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDAPR_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAPR_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqrshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqrshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(st2d
  (c2
    ((reg-list sve-p)
      ("st2d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st2d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(shsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("shsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SHSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld2h
  (c2
    ((reg-list sve-p)
      ("ld2h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld2h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(frintp
  (c2
    ((simd-vector simd-vector)
      ("FRINTP_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTP_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("frintp_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("frintp_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTP_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTP_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTP_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frintp_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frintp_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pacia171615
  (c0
    (()
      ("PACIA171615_64LR_dp_1src" "" ())
    )
  )
)

(setgpt
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGPT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld1r
  (c1m1
    ((reg-list memory immediate)
      ("LD1R_asisdlsop_R1_i" "{V UInteger . 8B}, [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD1R_asisdlsop_RX1_r" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD1R_asisdlso_R1" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfmaxa
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldrsh
  (c1m1
    ((gpr-32 memory pre-index)
      ("LDRSH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory pre-index)
      ("LDRSH_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("LDRSH_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDRSH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDRSH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDRSH_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSH_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sha256h
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA256H_QQV_cryptosha3" "QUInteger, QUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(f2cvtl
  (c2
    ((simd-vector simd-vector)
      ("F2CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z)
      ("f2cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(ld3
  (c1m1
    ((reg-list memory immediate)
      ("LD3_asisdlsep_I3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD3_asisdlsep_R3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("LD3_asisdlso_B3_3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlso_H3_3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlso_S3_3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlso_D3_3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("LD3_asisdlsop_B3_i3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_H3_i3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 6" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_S3_i3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 12" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_D3_i3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 24" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("LD3_asisdlsop_BX3_r3b" "{V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_HX3_r3h" "{V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_SX3_r3s" "{V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD3_asisdlsop_DX3_r3d" "{V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD3_asisdlse_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sttrh
  (c1m
    ((gpr-32 memory)
      ("STTRH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(tsb
  (c1
    ((barrier-option)
      ("TSB_HC_hints" "CSYNC" ())
    )
  )
)

(sysl
  (c5
    ((gpr-64 immediate system-reg system-reg immediate)
      ("SYSL_RC_systeminstrs" "XZR, UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
    )
  )
)

(stbfmaxnm
  (c1m
    ((simd-scalar memory)
      ("STBFMAXNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(cpymrtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sttrb
  (c1m
    ((gpr-32 memory)
      ("STTRB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setge
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGE_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldtclrl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTCLRL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTCLRL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stcph
  (c0
    (()
      ("STCPH_HI_hints" "" ())
    )
  )
)

(ldclrab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(dcps3
  (c0
    (()
      ("DCPS3_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(rcwcaspl
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWCASPL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfcvtnt
  (c3
    ((sve-z sve-p sve-z)
      ("bfcvtnt_z_p_z_s2bfz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("bfcvtnt_z_p_z_s2bf" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1
  (c1m1
    ((reg-list memory immediate)
      ("LD1_asisdlsep_I4_i4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_I3_i3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 24" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_I1_i1" "{V UInteger . 8B}, [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_I2_i2" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD1_asisdlsep_R4_r4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_R3_r3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_R1_r1" "{V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsep_R2_r2" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("LD1_asisdlso_B1_1b" "{V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlso_H1_1h" "{V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlso_S1_1s" "{V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlso_D1_1d" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("LD1_asisdlsop_B1_i1b" "{V UInteger . B}, [UInteger], [SP], 1" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_H1_i1h" "{V UInteger . H}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_S1_i1s" "{V UInteger . S}, [UInteger], [SP], 4" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_D1_i1d" "{V UInteger . D}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("LD1_asisdlsop_BX1_r1b" "{V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_HX1_r1h" "{V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_SX1_r1s" "{V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlsop_DX1_r1d" "{V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD1_asisdlse_R4_4v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlse_R3_3v" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlse_R1_1v" "{V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD1_asisdlse_R2_2v" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fnmadd
  (c4
    ((simd-scalar simd-scalar simd-scalar simd-scalar)
      ("FNMADD_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMADD_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNMADD_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfmax
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAX_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(st64bv
  (c2m
    ((gpr-64 gpr-64 memory)
      ("ST64BV_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fadd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fadd_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("fadd_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fadd_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c1m1
    ((sme-za memory reg-list)
      ("fadd_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fadd_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FADD_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FADD_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FADD_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FADD_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FADD_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fadd_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(setgetn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGETN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(splice
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("splice_z_p_zz_des" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p reg-list)
      ("splice_z_p_zz_con" "ZUInteger.B, PUInteger, {Z UInteger . B Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ptrues
  (c1
    ((sve-p)
      ("ptrues_p_s_" "PUInteger.B" (("size" (element-size B H S D)) ("Pd" (reg-range 0 15))))
    )
  )
)

(shrnt
  (c3
    ((sve-z sve-z immediate)
      ("shrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfmrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sha512su0
  (c2
    ((simd-vector simd-vector)
      ("SHA512SU0_VV2_cryptosha512_2" "VUInteger.2D, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwswp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(asrr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("asrr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldap1
  (c1m1
    ((reg-list memory memory)
      ("LDAP1_asisdlso_D1" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(caslb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASLB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqabs
  (c2
    ((simd-vector simd-vector)
      ("SQABS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SQABS_asisdmisc_R" "BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("sqabs_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqabs_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldumaxb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(brka
  (c3
    ((sve-p sve-p sve-p)
      ("brka_p_p_p_" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(saddlv
  (c2
    ((simd-scalar simd-vector)
      ("SADDLV_asimdall_only" "HUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sabdlb
  (c3
    ((sve-z sve-z sve-z)
      ("sabdlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(shl
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SHL_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgomt
  (c0m1
    ((memory gpr-64)
      ("SETGOMT_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldursh
  (c1m
    ((gpr-32 memory)
      ("LDURSH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDURSH_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(asrv
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("ASRV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("ASRV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfminnm
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfminnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfminnm_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfminnm_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfminnm_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfminnm_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(sminqv
  (c3
    ((simd-vector sve-p sve-z)
      ("sminqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(fcvtas
  (c2
    ((simd-vector simd-vector)
      ("FCVTAS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTAS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTAS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTAS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfvdot
  (c1
    ((sme-za)
      ("bfvdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(suvdot
  (c1
    ((sme-za)
      ("suvdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(cpyfptwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ext
  (c4
    ((sve-z sve-z sve-z immediate)
      ("ext_z_zi_des" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm8h" (imm-range 0 31 1)) ("imm8l" (imm-range 0 7 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector immediate)
      ("EXT_asimdext_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B, UInteger" (("Rm" (reg-range 0 31)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z reg-list immediate)
      ("ext_z_zi_con" "ZUInteger.B, {Z UInteger .B Z UInteger .B}, UInteger" (("imm8h" (imm-range 0 31 1)) ("imm8l" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(setgpn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGPN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqxtnt
  (c2
    ((sve-z sve-z)
      ("uqxtnt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(tbl
  (c3
    ((sve-z reg-list sve-z)
      ("tbl_z_zz_2" "ZUInteger.B, {Z UInteger . B Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("tbl_z_zz_1" "ZUInteger.B, {Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-vector reg-list simd-vector)
      ("TBL_asimdtbl_L1_1" "VUInteger.8B, {V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBL_asimdtbl_L2_2" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBL_asimdtbl_L3_3" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("TBL_asimdtbl_L4_4" "VUInteger.8B, {V UInteger . 16B V UInteger . 16B V UInteger . 16B V UInteger . 16B}, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(casp
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASP_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 gpr-32 memory)
      ("CASP_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(msr
  (c2
    ((system-reg immediate)
      ("MSR_SI_pstate" "UAO, UInteger" ())
    )
    ((system-reg gpr-64)
      ("MSR_SR_systemmove" "ACTLR_EL3, XZR" (("Rt" (reg-range 0 31))))
    )
  )
)

(rcwssetp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsclrpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smaxqv
  (c3
    ((simd-vector sve-p sve-z)
      ("smaxqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(punpkhi
  (c2
    ((sve-p sve-p)
      ("punpkhi_p_p_" "PUInteger.H, PUInteger.B" (("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(retab
  (c0
    (()
      ("RETAB_64E_branch_reg" "" ())
    )
  )
)

(rcwsetp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldurb
  (c1m
    ((gpr-32 memory)
      ("LDURB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtau
  (c2
    ((simd-vector simd-vector)
      ("FCVTAU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTAU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTAU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTAU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTAU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfewt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgomn
  (c0m1
    ((memory gpr-64)
      ("SETGOMN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stlur
  (c1m
    ((gpr-32 memory)
      ("STLUR_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory)
      ("STLUR_B_ldapstl_simd" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STLUR_Q_ldapstl_simd" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STLUR_H_ldapstl_simd" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STLUR_S_ldapstl_simd" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STLUR_D_ldapstl_simd" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STLUR_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(paciasppc
  (c0
    (()
      ("PACIASPPC_64LR_dp_1src" "" ())
    )
  )
)

(uqdecw
  (c1
    ((gpr-64)
      ("uqdecw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqdecw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqdecw_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(crc32ch
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32CH_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwset
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSET_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(faddqv
  (c3
    ((simd-vector sve-p sve-z)
      ("faddqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(rmif
  (c3
    ((gpr-64 immediate immediate)
      ("RMIF_only_rmif" "XZR, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31))))
    )
  )
)

(adrp
  (c2
    ((gpr-64 immediate)
      ("ADRP_only_pcreladdr" "XZR, SInteger" (("immlo" (imm-range 0 3 1)) ("immhi" (imm-range 0 524287 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqdmullb
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmullb_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmullb_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmullb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfertrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFERTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldff1d
  (c2
    ((reg-list sve-p)
      ("ldff1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1d_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1d_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1d_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(umaddl
  (c4
    ((gpr-64 gpr-32 gpr-32 gpr-64)
      ("UMADDL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sdivr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sdivr_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(pfirst
  (c3
    ((sve-p sve-p sve-p)
      ("pfirst_p_p_p_" "PUInteger.B, PUInteger, PUInteger.B" (("Pg" (reg-range 0 15))))
    )
  )
)

(ld1sb
  (c2
    ((reg-list sve-p)
      ("ld1sb_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
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
    )
  )
)

(isb
  (c0
    (()
      ("ISB_BI_barriers" "" ())
    )
  )
)

(setgm
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGM_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uxtw
  (c3
    ((sve-z sve-p sve-z)
      ("uxtw_z_p_z_m" "ZUInteger.D, PUInteger/M, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("uxtw_z_p_z_z" "ZUInteger.D, PUInteger/Z, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stbfmin
  (c1m
    ((simd-scalar memory)
      ("STBFMIN_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(csel
  (c4
    ((gpr-32 gpr-32 gpr-32 cond-code)
      ("CSEL_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 cond-code)
      ("CSEL_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(frintx
  (c2
    ((simd-vector simd-vector)
      ("FRINTX_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTX_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTX_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTX_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTX_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frintx_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frintx_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sclamp
  (c3
    ((reg-list sve-z sve-z)
      ("sclamp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("sclamp_mz_zz_4" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("sclamp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(srsra
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SRSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SRSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("srsra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fmop4a
  (c3
    ((sme-za reg-list sve-z)
      ("fmop4a_za_zz_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_z8z8_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za16_z8z8_b2x1" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_d2x1" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("fmop4a_za_zz_s2x2" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_z8z8_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za16_z8z8_b2x2" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_h2x2" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_d2x2" "ZAUInteger.D, {Z UInteger .D- Z UInteger .D}, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("fmop4a_za_zz_s1x1" "ZAUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_z8z8_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za16_z8z8_b1x1" "ZAUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_h1x1" "ZAUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_d1x1" "ZAUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("fmop4a_za_zz_s1x2" "ZAUInteger.S, ZUInteger.S, {Z UInteger .S- Z UInteger .S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_z8z8_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za16_z8z8_b1x2" "ZAUInteger.H, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_h1x2" "ZAUInteger.H, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("fmop4a_za_zz_d1x2" "ZAUInteger.D, ZUInteger.D, {Z UInteger .D- Z UInteger .D}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(crc32cb
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32CB_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldrsb
  (c1m1
    ((gpr-32 memory pre-index)
      ("LDRSB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory pre-index)
      ("LDRSB_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("LDRSB_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDRSB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDRSB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDRSB_64B_ldst_regoff" "XZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSB_64BL_ldst_regoff" "XZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSB_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqsubr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqsubr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldtseta
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTSETA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTSETA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(orqv
  (c3
    ((simd-vector sve-p sve-z)
      ("orqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(cpyfewn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgop
  (c0m1
    ((memory gpr-64)
      ("SETGOP_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfmina
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(zip2
  (c3
    ((sve-p sve-p sve-p)
      ("zip2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("ZIP2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("zip2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("zip2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sumopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("sumopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("sumopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(adc
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("ADC_32_addsub_carry" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("ADC_64_addsub_carry" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfmina
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(neg
  (c2
    ((simd-vector simd-vector)
      ("NEG_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("NEG_asisdmisc_R" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("neg_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("neg_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ins
  (c2
    ((simd-vector simd-vector)
      ("INS_asimdins_IV_v" "VUInteger.B[UInteger], VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector gpr-32)
      ("INS_asimdins_IR_r" "VUInteger.B[UInteger], WZR" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(frintz
  (c2
    ((simd-vector simd-vector)
      ("FRINTZ_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTZ_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTZ_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTZ_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTZ_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frintz_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frintz_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfpn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldff1h
  (c2
    ((reg-list sve-p)
      ("ldff1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_br_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1h_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(fmadd
  (c4
    ((simd-scalar simd-scalar simd-scalar simd-scalar)
      ("FMADD_S_floatdp3" "SUInteger, SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMADD_D_floatdp3" "DUInteger, DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMADD_H_floatdp3" "HUInteger, HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autia171615
  (c0
    (()
      ("AUTIA171615_64LR_dp_1src" "" ())
    )
  )
)

(fmlslb
  (c3
    ((sve-z sve-z sve-z)
      ("fmlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlslb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fcvtx
  (c3
    ((sve-z sve-p sve-z)
      ("fcvtx_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtx_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ssublbt
  (c3
    ((sve-z sve-z sve-z)
      ("ssublbt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(srshr
  (c4
    ((sve-z sve-p sve-z immediate)
      ("srshr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SRSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SRSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pmul
  (c3
    ((simd-vector simd-vector simd-vector)
      ("PMUL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("pmul_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldbfmaxnml
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(casl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASL_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("CASL_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldursb
  (c1m
    ((gpr-32 memory)
      ("LDURSB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDURSB_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sri
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SRI_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SRI_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("sri_z_zzi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(addha
  (c4
    ((sme-za sve-p sve-p sve-z)
      ("addha_za_pp_z_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("addha_za_pp_z_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(casat
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASAT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uzp2
  (c3
    ((sve-p sve-p sve-p)
      ("uzp2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UZP2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uzp2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("uzp2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldadda
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDADDA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDADDA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(movk
  (c2
    ((gpr-64 immediate)
      ("MOVK_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("MOVK_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pacda
  (c2
    ((gpr-64 gpr-64)
      ("PACDA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwssetl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(swph
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqshrnb
  (c3
    ((sve-z sve-z immediate)
      ("sqshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldiapp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("LDIAPP_64LS_ldiappstilp" "XZR, XZR, [SP], 16" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory immediate)
      ("LDIAPP_32LE_ldiappstilp" "WZR, WZR, [SP], 8" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDIAPP_64L_ldiappstilp" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDIAPP_32L_ldiappstilp" "WZR, WZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclrlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rev32
  (c2
    ((simd-vector simd-vector)
      ("REV32_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("REV32_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st4q
  (c2
    ((reg-list sve-p)
      ("st4q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st4q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldeoralh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stnt1w
  (c2
    ((reg-list sve-pn)
      ("stnt1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("stnt1w_z_p_br_contiguous" "{Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("stnt1w_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1w_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("stnt1w_z_p_bi_contiguous" "{Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("stnt1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("stnt1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("stnt1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(ld4d
  (c2
    ((reg-list sve-p)
      ("ld4d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld4d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(frint64x
  (c2
    ((simd-vector simd-vector)
      ("FRINT64X_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINT64X_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINT64X_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frint64x_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frint64x_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pmull
  (c3
    ((simd-vector simd-vector simd-vector)
      ("PMULL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z sve-z)
      ("pmull_mz_zzw_1x2" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(addqp
  (c3
    ((sve-z sve-z sve-z)
      ("addqp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldeoral
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDEORAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDEORAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(tbxq
  (c3
    ((sve-z sve-z sve-z)
      ("tbxq_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sdot
  (c1
    ((sme-za)
      ("sdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sdot_za32_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("sdot_za32_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("sdot_za32_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("sdot_za32_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sdot_za32_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sdot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z16_zzz_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z32_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z32_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sdot_z16_zzzi_h" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("sdot_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("sdot_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("sdot_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(frecpx
  (c2
    ((simd-scalar simd-scalar)
      ("FRECPX_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRECPX_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frecpx_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frecpx_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(setf16
  (c1
    ((gpr-32)
      ("SETF16_only_setf" "WZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(cpyfen
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldeorlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sha1m
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA1M_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqrshrn
  (c3
    ((simd-scalar simd-scalar immediate)
      ("UQRSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("UQRSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("uqrshrn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("uqrshrn_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("uqrshrn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stzg
  (c1m1
    ((gpr-64 memory pre-index)
      ("STZG_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("STZG_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("STZG_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldatxr
  (c1m
    ((gpr-32 memory)
      ("LDATXR_LR32_ldstexclr_unpriv" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDATXR_LR64_ldstexclr_unpriv" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld4b
  (c2m
    ((reg-list sve-p memory)
      ("ld4b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld4b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cpyfprt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autib171615
  (c0
    (()
      ("AUTIB171615_64LR_dp_1src" "" ())
    )
  )
)

(bsl
  (c4
    ((sve-z sve-z sve-z sve-z)
      ("bsl_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BSL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stfaddl
  (c1m
    ((simd-scalar memory)
      ("STFADDL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFADDL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFADDL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(usra
  (c3
    ((simd-scalar simd-scalar immediate)
      ("USRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("USRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("usra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(csneg
  (c4
    ((gpr-32 gpr-32 gpr-32 cond-code)
      ("CSNEG_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 cond-code)
      ("CSNEG_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfminnml
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsetal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSETAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stlp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("STLP_64_ldiappstilp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bsl1n
  (c4
    ((sve-z sve-z sve-z sve-z)
      ("bsl1n_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cpyfpwtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsclrl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfpwtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sm3partw1
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3PARTW1_VVV4_cryptosha512_3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stlr
  (c1m1
    ((gpr-32 memory pre-index)
      ("STLR_32S_ldapstl_writeback" "WZR, [SP -4], !" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory pre-index)
      ("STLR_64S_ldapstl_writeback" "XZR, [SP -8], !" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("STLR_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("STLR_SL64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyetwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYETWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(orn
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("ORN_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("ORN_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("orn_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("ORN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(wfet
  (c1
    ((gpr-64)
      ("WFET_only_systeminstrswithreg" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(cblo
  (c3
    ((gpr-64 immediate immediate)
      ("CBLO_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBLO_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmlsl
  (c1
    ((sme-za)
      ("fmlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("fmlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("fmlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("fmlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("fmlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("fmlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLSL_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLSL_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldursw
  (c1m
    ((gpr-64 memory)
      ("LDURSW_64_ldst_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpypwtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldff1w
  (c2
    ((reg-list sve-p)
      ("ldff1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1w_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sm3tt1b
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3TT1B_VVV4_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfprn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cbbeq
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBEQ_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqxtn
  (c2
    ((simd-vector simd-vector)
      ("UQXTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("UQXTN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(swpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mls
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("mls_z_p_zzz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("MLS_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("MLS_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("mls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("mls_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("mls_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpyfewtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEWTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsswpp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmaxnm
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmaxnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fmaxnm_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMAXNM_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNM_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fmaxnm_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmaxnm_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMAXNM_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNM_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXNM_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("fmaxnm_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmaxnm_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(uqrshrnb
  (c3
    ((sve-z sve-z immediate)
      ("uqrshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqdmlalb
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlalb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlalb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldapursh
  (c1m
    ((gpr-32 memory)
      ("LDAPURSH_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAPURSH_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(crc32x
  (c3
    ((gpr-32 gpr-32 gpr-64)
      ("CRC32X_64C_dp_2src" "WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqincw
  (c1
    ((gpr-64)
      ("uqincw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqincw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqincw_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(ldnt1sw
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1sw_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(pacga
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("PACGA_64P_dp_2src" "XZR, XZR, SP" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfet
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFET_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(caslh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASLH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(f1cvtlt
  (c2
    ((sve-z sve-z)
      ("f1cvtlt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st2g
  (c1m1
    ((gpr-64 memory pre-index)
      ("ST2G_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("ST2G_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("ST2G_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(st2
  (c1m1
    ((reg-list memory immediate)
      ("ST2_asisdlsep_I2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("ST2_asisdlsep_R2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("ST2_asisdlso_B2_2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlso_H2_2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlso_S2_2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlso_D2_2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("ST2_asisdlsop_B2_i2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_H2_i2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_S2_i2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_D2_i2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("ST2_asisdlsop_BX2_r2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_HX2_r2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_SX2_r2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST2_asisdlsop_DX2_r2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("ST2_asisdlse_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(frint64z
  (c2
    ((simd-vector simd-vector)
      ("FRINT64Z_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINT64Z_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINT64Z_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frint64z_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frint64z_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(tenter
  (c1
    ((immediate)
      ("TENTER_te_exception" "UInteger" (("imm7" (imm-range 0 127 1))))
    )
  )
)

(addv
  (c2
    ((simd-scalar simd-vector)
      ("ADDV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqcvtun
  (c2
    ((sve-z reg-list)
      ("sqcvtun_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqcvtun_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bf2cvtl
  (c2
    ((simd-vector simd-vector)
      ("BF2CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z)
      ("bf2cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(ldclrpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfmaxal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldeoralb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(addqv
  (c3
    ((simd-vector sve-p sve-z)
      ("addqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(sha1su0
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SHA1SU0_VVV_cryptosha3" "VUInteger.4S, VUInteger.4S, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fmlalb
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALB_asimdsame2_J" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALB_asimdelem_H" "VUInteger.8H, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlalb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalb_z_z8z8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalb_z_z8z8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(tbnz
  (c3
    ((gpr-32 immediate immediate)
      ("TBNZ_only_testbranch" "WZR, UInteger, SInteger" (("imm14" (imm-range 0 16383 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld3r
  (c1m1
    ((reg-list memory immediate)
      ("LD3R_asisdlsop_R3_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 3" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD3R_asisdlsop_RX3_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD3R_asisdlso_R3" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(brkas
  (c3
    ((sve-p sve-p sve-p)
      ("brkas_p_p_p_z" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ldseta
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSETA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpymrtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpye
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYE_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(xpaclri
  (c0
    (()
      ("XPACLRI_HI_hints" "" ())
    )
  )
)

(setffr
  (c0
    (()
      ("setffr_f_" "" ())
    )
  )
)

(cast
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CAST_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(autibsp
  (c0
    (()
      ("AUTIBSP_HI_hints" "" ())
    )
  )
)

(st4w
  (c2
    ((reg-list sve-p)
      ("st4w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st4w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(rcwscaspal
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWSCASPAL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclrlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld2w
  (c2
    ((reg-list sve-p)
      ("ld2w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld2w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(and
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("AND_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("AND_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("and_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-p sve-p sve-p sve-p)
      ("and_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("AND_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("and_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("AND_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("AND_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("and_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(subhn
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SUBHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uaddlv
  (c2
    ((simd-scalar simd-vector)
      ("UADDLV_asimdall_only" "HUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldrab
  (c1m1
    ((gpr-64 memory pre-index)
      ("LDRAB_64W_ldst_pac" "XZR, [SP], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("LDRAB_64_ldst_pac" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uminqv
  (c3
    ((simd-vector sve-p sve-z)
      ("uminqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(frsqrte
  (c2
    ((simd-vector simd-vector)
      ("FRSQRTE_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRSQRTE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z)
      ("frsqrte_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRSQRTE_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRSQRTE_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stl1
  (c1m1
    ((reg-list memory memory)
      ("STL1_asisdlso_D1" "{V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(revb
  (c3
    ((sve-z sve-p sve-z)
      ("revb_z_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("revb_z_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(caslt
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASLT_C64_comswap_unpriv" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(swplb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("fmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmops_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("fmops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(lslr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("lslr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldrsw
  (c2
    ((gpr-64 immediate)
      ("LDRSW_64_loadlit" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m1
    ((gpr-64 memory pre-index)
      ("LDRSW_64_ldst_immpre" "XZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("LDRSW_64_ldst_immpost" "XZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("LDRSW_64_ldst_regoff" "XZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRSW_64_ldst_pos" "XZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwcas
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCAS_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqrshr
  (c3
    ((sve-z reg-list immediate)
      ("sqrshr_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshr_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpymtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fmaxv
  (c2
    ((simd-scalar simd-vector)
      ("FMAXV_asimdall_only_H" "HUInteger, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXV_asimdall_only_SD" "SUInteger, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("fmaxv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(ldfaddal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFADDAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsetab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsswpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldaddlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfaddal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFADDAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(utmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("utmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("utmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(sqcvtn
  (c2
    ((sve-z reg-list)
      ("sqcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqcvtn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sabdlt
  (c3
    ((sve-z sve-z sve-z)
      ("sabdlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fsqrt
  (c2
    ((simd-vector simd-vector)
      ("FSQRT_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSQRT_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FSQRT_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSQRT_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FSQRT_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("fsqrt_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fsqrt_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(eorqv
  (c3
    ((simd-vector sve-p sve-z)
      ("eorqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(uqcvtn
  (c2
    ((sve-z reg-list)
      ("uqcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("uqcvtn_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(prfb
  (c2
    ((prefetch-op sve-p)
      ("prfb_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
  (c2m
    ((prefetch-op sve-p memory)
      ("prfb_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfb_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfb_i_p_br_s" "PLDL1KEEP, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfb_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("prfb_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfb_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(ldg
  (c1m
    ((gpr-64 memory)
      ("LDG_64Loffset_ldsttags" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(incd
  (c1
    ((gpr-64)
      ("incd_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("incd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cpyewtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYEWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autiaz
  (c0
    (()
      ("AUTIAZ_HI_hints" "" ())
    )
  )
)

(setm
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETM_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(shrnb
  (c3
    ((sve-z sve-z immediate)
      ("shrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cbeq
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBEQ_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 immediate immediate)
      ("CBEQ_64_imm" "XZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBEQ_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate)
      ("CBEQ_32_imm" "WZR, UInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smin
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("smin_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("SMIN_64_minmax_imm" "XZR, XZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("smin_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("SMIN_32_minmax_imm" "WZR, WZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SMIN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("SMIN_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("smin_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("smin_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("SMIN_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("smin_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("smin_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(uaddv
  (c3
    ((simd-scalar sve-p sve-z)
      ("uaddv_r_p_z_" "DUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(rev64
  (c2
    ((simd-vector simd-vector)
      ("REV64_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtnb
  (c2
    ((sve-z reg-list)
      ("fcvtnb_z8_mz2_s2b" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpymrt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMRT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st4
  (c1m1
    ((reg-list memory immediate)
      ("ST4_asisdlsep_I4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("ST4_asisdlsep_R4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("ST4_asisdlso_B4_4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlso_H4_4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlso_S4_4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlso_D4_4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("ST4_asisdlsop_B4_i4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_H4_i4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_S4_i4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_D4_i4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 32" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("ST4_asisdlsop_BX4_r4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_HX4_r4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_SX4_r4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("ST4_asisdlsop_DX4_r4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("ST4_asisdlse_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stfmaxnm
  (c1m
    ((simd-scalar memory)
      ("STFMAXNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXNM_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXNM_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(nors
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("nors_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ld3h
  (c2
    ((reg-list sve-p)
      ("ld3h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld3h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ccmn
  (c4
    ((gpr-64 immediate immediate cond-code)
      ("CCMN_64_condcmp_imm" "XZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate cond-code)
      ("CCMN_32_condcmp_reg" "WZR, WZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate cond-code)
      ("CCMN_32_condcmp_imm" "WZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 immediate cond-code)
      ("CCMN_64_condcmp_reg" "XZR, XZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ldsetah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(dmb
  (c1
    ((barrier-option)
      ("DMB_BO_barriers" "SY" ())
    )
  )
)

(setetn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETETN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cbge
  (c3
    ((gpr-64 gpr-64 immediate)
      ("CBGE_64_regs" "XZR, XZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("CBGE_32_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("bfmops_za32_pp_zz_" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("bfmops_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(cmtst
  (c3
    ((simd-vector simd-vector simd-vector)
      ("CMTST_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMTST_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fmlall
  (c1
    ((sme-za)
      ("fmlall_za32_z8z8i_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("fmlall_za32_z8z8i_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("fmlall_za32_z8z8i_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("fmlall_za32_z8z8v_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("fmlall_za32_z8z8v_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("fmlall_za32_z8z8v_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("fmlall_za32_z8z8w_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("fmlall_za32_z8z8w_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(ccmp
  (c4
    ((gpr-64 immediate immediate cond-code)
      ("CCMP_64_condcmp_imm" "XZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate cond-code)
      ("CCMP_32_condcmp_reg" "WZR, WZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-32 immediate immediate cond-code)
      ("CCMP_32_condcmp_imm" "WZR, UInteger, UInteger, EQ" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 immediate cond-code)
      ("CCMP_64_condcmp_reg" "XZR, XZR, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(cpymrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldapursb
  (c1m
    ((gpr-32 memory)
      ("LDAPURSB_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAPURSB_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmax
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fmax_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMAX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fmax_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmax_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMAX_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAX_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAX_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("fmax_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fmax_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(bgrp
  (c3
    ((sve-z sve-z sve-z)
      ("bgrp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(lslv
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("LSLV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("LSLV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(saddwb
  (c3
    ((sve-z sve-z sve-z)
      ("saddwb_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwcasal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCASAL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(prfd
  (c2
    ((prefetch-op sve-p)
      ("prfd_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfd_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfd_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfd_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
  (c2m
    ((prefetch-op sve-p memory)
      ("prfd_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfd_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("prfd_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(smax
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("smax_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("SMAX_64_minmax_imm" "XZR, XZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("smax_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("SMAX_32_minmax_imm" "WZR, WZR, SInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SMAX_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("SMAX_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("smax_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("smax_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("SMAX_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("smax_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("smax_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(stzgm
  (c1m
    ((gpr-64 memory)
      ("STZGM_64bulk_ldsttags" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqdecw
  (c2
    ((gpr-64 gpr-32)
      ("sqdecw_r_rs_sx" "XUInteger, WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
  (c1
    ((gpr-64)
      ("sqdecw_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("sqdecw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(swptl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPTL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPTL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(incb
  (c1
    ((gpr-64)
      ("incb_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(fccmp
  (c4
    ((simd-scalar simd-scalar immediate cond-code)
      ("FCCMP_S_floatccmp" "SUInteger, SUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCCMP_D_floatccmp" "DUInteger, DUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCCMP_H_floatccmp" "HUInteger, HUInteger, UInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(uabd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uabd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UABD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(swplh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(zipq1
  (c3
    ((sve-z sve-z sve-z)
      ("zipq1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(usmop4a
  (c3
    ((sme-za reg-list sve-z)
      ("usmop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("usmop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("usmop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("usmop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(cmpgt
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmpgt_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmpgt_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmpgt_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(eretab
  (c0
    (()
      ("ERETAB_64E_branch_reg" "" ())
    )
  )
)

(brab
  (c2
    ((gpr-64 gpr-64)
      ("BRAB_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
    )
  )
)

(ummla
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMMLA_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("ummla_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(revd
  (c3
    ((sve-z sve-p sve-z)
      ("revd_z_p_z_m" "ZUInteger.Q, PUInteger/M, ZUInteger.Q" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("revd_z_p_z_z" "ZUInteger.Q, PUInteger/Z, ZUInteger.Q" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smlsl
  (c1
    ((sme-za)
      ("smlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("smlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("smlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("smlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("smlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("smlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMLSL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld2q
  (c2
    ((reg-list sve-p)
      ("ld2q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld2q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldaxrb
  (c1m
    ((gpr-32 memory)
      ("LDAXRB_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcsel
  (c4
    ((simd-scalar simd-scalar simd-scalar cond-code)
      ("FCSEL_S_floatsel" "SUInteger, SUInteger, SUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCSEL_D_floatsel" "DUInteger, DUInteger, DUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCSEL_H_floatsel" "HUInteger, HUInteger, HUInteger, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(clrbhb
  (c0
    (()
      ("CLRBHB_HI_hints" "" ())
    )
  )
)

(cdot
  (c4
    ((sve-z sve-z sve-z immediate)
      ("cdot_z_zzz_" "ZUInteger.S, ZUInteger.B, ZUInteger.B, 0" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("cdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger, 0" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("cdot_z_zzzi_d" "ZUInteger.D, ZUInteger.H, ZUInteger.H[UInteger, 0" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sha1c
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA1C_QSV_cryptosha3" "QUInteger, SUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldeorlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sbclb
  (c3
    ((sve-z sve-z sve-z)
      ("sbclb_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sete
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETE_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uaddlt
  (c3
    ((sve-z sve-z sve-z)
      ("uaddlt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st2q
  (c2
    ((reg-list sve-p)
      ("st2q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st2q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldeorah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(usubw
  (c3
    ((simd-vector simd-vector simd-vector)
      ("USUBW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cntw
  (c1
    ((gpr-64)
      ("cntw_r_s_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwcaspa
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWCASPA_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqrshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqrshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQRSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQRSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwclra
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(inch
  (c1
    ((gpr-64)
      ("inch_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("inch_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsmaxlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpymwt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqxtunb
  (c2
    ((sve-z sve-z)
      ("sqxtunb_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(not
  (c2
    ((simd-vector simd-vector)
      ("NOT_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("not_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("not_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqsub_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("sqsub_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SQSUB_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQSUB_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sqsub_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(retaasppcr
  (c1
    ((gpr-64)
      ("RETAASPPCR_64M_branch_reg" "XZR" (("Rm" (reg-range 0 31))))
    )
  )
)

(crc32h
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32H_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(dsb
  (c1
    ((barrier-option)
      ("DSB_BO_barriers" "SY" ())
      ("DSB_BOn_barriers" "SYnXS" (("imm2" (imm-range 0 3 1))))
    )
  )
)

(rcwsclrpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mul
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("mul_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("mul_z_zi_" "ZUInteger.B, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("MUL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("MUL_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("mul_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("mul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("mul_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("mul_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(retabsppcr
  (c1
    ((gpr-64)
      ("RETABSPPCR_64M_branch_reg" "XZR" (("Rm" (reg-range 0 31))))
    )
  )
)

(setptn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETPTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pacibz
  (c0
    (()
      ("PACIBZ_HI_hints" "" ())
    )
  )
)

(rcwscasp
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWSCASP_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqrshrun
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQRSHRUN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQRSHRUN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("sqrshrun_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshrun_z_mz2_b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshrun_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bsl2n
  (c4
    ((sve-z sve-z sve-z sve-z)
      ("bsl2n_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(asr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("asr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
      ("asr_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z immediate)
      ("asr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("asr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("asr_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwsetpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stfmaxl
  (c1m
    ((simd-scalar memory)
      ("STFMAXL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXL_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAXL_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(sshl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fneg
  (c2
    ((simd-vector simd-vector)
      ("FNEG_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNEG_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FNEG_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNEG_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FNEG_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("fneg_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fneg_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(umopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("umopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("umopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("umopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(umsubl
  (c4
    ((gpr-64 gpr-32 gpr-32 gpr-64)
      ("UMSUBL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgmn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGMN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pnext
  (c3
    ((sve-p sve-p sve-p)
      ("pnext_p_p_p_" "PUInteger.B, PUInteger, PUInteger.B" (("size" (element-size B H S D))))
    )
  )
)

(sqrshru
  (c3
    ((sve-z reg-list immediate)
      ("sqrshru_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}, UInteger" (("imm4" (imm-range 0 15 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("sqrshru_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}, UInteger" (("imm5" (imm-range 0 31 1)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqcadd
  (c4
    ((sve-z sve-z sve-z immediate)
      ("sqcadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 90" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cbbhs
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBHS_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqdmlalt
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlalt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpyfmtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfmlalt
  (c3
    ((sve-z sve-z sve-z)
      ("bfmlalt_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfmlalt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sqshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cbhge
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHGE_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtrb
  (c1m
    ((gpr-32 memory)
      ("LDTRB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(scvtf
  (c2
    ((simd-vector simd-vector)
      ("SCVTF_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-64)
      ("SCVTF_S64_float2int" "SUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("scvtf_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("scvtf_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z)
      ("scvtf_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SCVTF_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_sisd_32D" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_sisd_32H" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_sisd_64H" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_sisd_64S" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-32)
      ("SCVTF_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_D32_float2int" "DUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SCVTF_asisdshf_C" "HUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SCVTF_asimdshf_C" "VUInteger.4H, VUInteger.4H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z)
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
    )
    ((simd-scalar gpr-64 immediate)
      ("SCVTF_S64_float2fix" "SUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_D64_float2fix" "DUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_H64_float2fix" "HUInteger, XZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-32 immediate)
      ("SCVTF_S32_float2fix" "SUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_D32_float2fix" "DUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SCVTF_H32_float2fix" "HUInteger, WZR, UInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(msrr
  (c3
    ((system-reg gpr-64 gpr-64)
      ("MSRR_SR_systemmovepr" "ACTLR_EL3, XZR, XUInteger" (("Rt" (reg-range 0 31))))
    )
  )
)

(stshh
  (c1
    ((prefetch-op)
      ("STSHH_HI_hints" "KEEP" ())
    )
  )
)

(ldaxrh
  (c1m
    ((gpr-32 memory)
      ("LDAXRH_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmlalt
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALT_asimdsame2_J" "VUInteger.8H, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALT_asimdelem_H" "VUInteger.8H, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlalt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalt_z_z8z8z8i_" "ZUInteger.H, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalt_z_z8z8z8_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ld1rsb
  (c2m
    ((reg-list sve-p memory)
      ("ld1rsb_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rsb_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rsb_z_p_bi_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ld1row
  (c2
    ((reg-list sve-p)
      ("ld1row_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1row_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(sshllt
  (c3
    ((sve-z sve-z immediate)
      ("sshllt_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sadalp
  (c2
    ((simd-vector simd-vector)
      ("SADALP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("sadalp_z_p_z_" "ZUInteger.H, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(st2w
  (c2
    ((reg-list sve-p)
      ("st2w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st2w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldlar
  (c1m
    ((gpr-32 memory)
      ("LDLAR_LR32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDLAR_LR64_ldstord" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldeorab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmlal
  (c1
    ((sme-za)
      ("bfmlal_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmlal_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("bfmlal_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("bfmlal_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("bfmlal_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmlal_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("bfmlal_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("bfmlal_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BFMLAL_asimdsame2_F_" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("BFMLAL_asimdelem_F" "VUInteger.4S, VUInteger.8H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldsmina
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMINA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMINA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldtadda
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTADDA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTADDA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(wfe
  (c0
    (()
      ("WFE_HI_hints" "" ())
    )
  )
)

(adclb
  (c3
    ((sve-z sve-z sve-z)
      ("adclb_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpymwtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldxr
  (c1m
    ((gpr-32 memory)
      ("LDXR_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDXR_LR64_ldstexclr" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmpeq
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmpeq_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmpeq_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmpeq_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(faddv
  (c3
    ((simd-scalar sve-p sve-z)
      ("faddv_v_p_z_" "HUInteger, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(cpyertwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYERTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uaddlp
  (c2
    ((simd-vector simd-vector)
      ("UADDLP_asimdmisc_P" "VUInteger.4H, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(saba
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SABA_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("saba_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(dgh
  (c0
    (()
      ("DGH_HI_hints" "" ())
    )
  )
)

(ldaddlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmaxp
  (c2
    ((simd-scalar simd-vector)
      ("FMAXP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmaxp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMAXP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMAXP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfmin
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMIN_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMIN_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMIN_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sabalt
  (c3
    ((sve-z sve-z sve-z)
      ("sabalt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldtrh
  (c1m
    ((gpr-32 memory)
      ("LDTRH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bdep
  (c3
    ((sve-z sve-z sve-z)
      ("bdep_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldbfadd
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFADD_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmhi
  (c3
    ((simd-vector simd-vector simd-vector)
      ("CMHI_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMHI_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uunpklo
  (c2
    ((sve-z sve-z)
      ("uunpklo_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldtrsh
  (c1m
    ((gpr-32 memory)
      ("LDTRSH_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDTRSH_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqshrun
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQSHRUN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQSHRUN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("sqshrun_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pext
  (c2
    ((reg-list sve-pn)
      ("pext_pp_rr_" "{P UInteger . B P UInteger . B}, PNUInteger[UInteger]" (("size" (element-size B H S D)) ("PNn" (reg-range 0 7)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-pn)
      ("pext_pn_rr_" "PUInteger.B, PNUInteger[UInteger]" (("size" (element-size B H S D)) ("imm2" (imm-range 0 3 1)) ("PNn" (reg-range 0 7)) ("Pd" (reg-range 0 15))))
    )
  )
)

(wfi
  (c0
    (()
      ("WFI_HI_hints" "" ())
    )
  )
)

(ldclrb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpymwtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYMWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(srshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("srshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(pacib1716
  (c0
    (()
      ("PACIB1716_HI_hints" "" ())
    )
  )
)

(dupq
  (c2
    ((sve-z sve-z)
      ("dupq_z_zi_" "ZUInteger.D, ZUInteger.D[UInteger]" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rorv
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("RORV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("RORV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(prfh
  (c2
    ((prefetch-op sve-p)
      ("prfh_i_p_bz_s_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfh_i_p_br_s" "PLDL1KEEP, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfh_i_p_bz_d_x32_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfh_i_p_bz_d_64_scaled" "PLDL1KEEP, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
  (c2m
    ((prefetch-op sve-p memory)
      ("prfh_i_p_bi_s" "PLDL1KEEP, PUInteger, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
      ("prfh_i_p_ai_s" "PLDL1KEEP, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("prfh_i_p_ai_d" "PLDL1KEEP, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(cpypwtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPWTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(clasta
  (c4
    ((gpr-32 sve-p gpr-32 sve-z)
      ("clasta_r_p_z_" "WZR, PUInteger, WZR, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z sve-z)
      ("clasta_z_p_zz_" "ZUInteger.B, PUInteger, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-scalar sve-p simd-scalar sve-z)
      ("clasta_v_p_z_" "BUInteger, PUInteger, BUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
    )
  )
)

(lduminlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uzpq2
  (c3
    ((sve-z sve-z sve-z)
      ("uzpq2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sshr
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(urshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("urshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("URSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("urshl_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("urshl_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("URSHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("urshl_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("urshl_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(ldxp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDXP_LP64_ldstexclp" "XZR, XZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDXP_LP32_ldstexclp" "WZR, WZR, [SP 0]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmplo
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmplo_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmplo_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ldfmaxnml
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXNML_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNML_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXNML_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(swptal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPTAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPTAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldaprh
  (c1m
    ((gpr-32 memory)
      ("LDAPRH_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(autib
  (c2
    ((gpr-64 gpr-64)
      ("AUTIB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(retaasppc
  (c1
    ((immediate)
      ("RETAASPPC_only_miscbranch" "SInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(ldtset
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTSET_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTSET_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldff1sh
  (c2
    ((reg-list sve-p)
      ("ldff1sh_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1sh_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sh_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ld1rsh
  (c2m
    ((reg-list sve-p memory)
      ("ld1rsh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rsh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cpyfertn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFERTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ustmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("ustmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(autiza
  (c1
    ((gpr-64)
      ("AUTIZA_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(sabal
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SABAL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sabal_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(usdot
  (c1
    ((sme-za)
      ("usdot_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("usdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("usdot_za_zzv_s2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("usdot_za_zzv_s4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("usdot_za_zzw_s2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("usdot_za_zzw_s4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("USDOT_asimdsame2_D" "VUInteger.2S, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("USDOT_asimdelem_D" "VUInteger.2S, VUInteger.8B, VUInteger.4B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("usdot_z_zzz_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("usdot_z_zzzi_s" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sbclt
  (c3
    ((sve-z sve-z sve-z)
      ("sbclt_z_zzz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldumaxah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldeorb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDEORB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uaddlb
  (c3
    ((sve-z sve-z sve-z)
      ("uaddlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(histseg
  (c3
    ((sve-z sve-z sve-z)
      ("histseg_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(urshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("urshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(cpyfert
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFERT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cmpls
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmpls_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm7" (imm-range 0 127 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmpls_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(shuh
  (c0
    (()
      ("SHUH_HI_hints" "" ())
    )
  )
)

(stg
  (c1m1
    ((gpr-64 memory pre-index)
      ("STG_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("STG_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("STG_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqshrnb
  (c3
    ((sve-z sve-z immediate)
      ("uqshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sqshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z immediate)
      ("sqshl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQSHL_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQSHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SQSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(saddw
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SADDW_asimddiff_W" "VUInteger.8H, VUInteger.8H, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqdmlalbt
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlalbt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sshll
  (c3
    ((simd-vector simd-vector immediate)
      ("SSHLL_asimdshf_L" "VUInteger.8H, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(saddwt
  (c3
    ((sve-z sve-z sve-z)
      ("saddwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(prfum
  (c1m
    ((prefetch-op memory)
      ("PRFUM_P_ldst_unscaled" "PLDL1KEEP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smullt
  (c3
    ((sve-z sve-z sve-z)
      ("smullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("smullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("smullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(udiv
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("udiv_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("UDIV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("UDIV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwscasal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCASAL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sm3tt2b
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SM3TT2B_VVV_crypto3_imm2" "VUInteger.4S, VUInteger.4S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 31)) ("imm2" (imm-range 0 3 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(faddp
  (c2
    ((simd-scalar simd-vector)
      ("FADDP_asisdpair_only_H" "HUInteger, VUInteger.2H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FADDP_asisdpair_only_SD" "SUInteger, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("faddp_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FADDP_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FADDP_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(brkpas
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkpas_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(lduminalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtnt
  (c2
    ((sve-z reg-list)
      ("fcvtnt_z8_mz2_s2b" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("fcvtnt_z_p_z_s2hz" "ZUInteger.H, PUInteger/Z, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtnt_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtnt_z_p_z_s2h" "ZUInteger.H, PUInteger/M, ZUInteger.S" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtnt_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pacia
  (c2
    ((gpr-64 gpr-64)
      ("PACIA_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfmopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("bfmopa_za32_pp_zz_" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("bfmopa_za_pp_zz_16" "ZAUInteger.H, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(paciasp
  (c0
    (()
      ("PACIASP_HI_hints" "" ())
    )
  )
)

(ld4r
  (c1m1
    ((reg-list memory immediate)
      ("LD4R_asisdlsop_R4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD4R_asisdlsop_RX4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD4R_asisdlso_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcmge
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmge_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("fcmge_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-scalar simd-scalar float-const)
      ("FCMGE_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGE_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("FCMGE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FCMGE_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGE_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector float-const)
      ("FCMGE_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMGE_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgmt
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGMT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwscaspa
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWSCASPA_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(swpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsmaxalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cbbge
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBBGE_8_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwsetal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(incp
  (c2
    ((gpr-64 sve-p)
      ("incp_r_p_r_" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("incp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(setgomtn
  (c0m1
    ((memory gpr-64)
      ("SETGOMTN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(addp
  (c2
    ((simd-scalar simd-vector)
      ("ADDP_asisdpair_only" "DUInteger, VUInteger.2D" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("addp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("ADDP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sumop4s
  (c3
    ((sme-za reg-list sve-z)
      ("sumop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("sumop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("sumop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("sumop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("sumop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(orv
  (c3
    ((simd-scalar sve-p sve-z)
      ("orv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(st1d
  (c2
    ((reg-list sve-pn)
      ("st1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("st1d_z_p_br_u128" "{Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_br_" "{Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st1d_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_bi_u128" "{Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_z_p_bi_" "{Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1d_za_p_rrr_" "{ZA UInteger H .D [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("st1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(ldsminalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldclrl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDCLRL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldnf1sw
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1sw_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(extq
  (c4
    ((sve-z sve-z sve-z immediate)
      ("extq_z_zi_des" "ZUInteger.B, ZUInteger.B, ZUInteger.B, UInteger" (("imm4" (imm-range 0 15 1)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(xaflag
  (c0
    (()
      ("XAFLAG_M_pstate" "" ())
    )
  )
)

(ld4h
  (c2
    ((reg-list sve-p)
      ("ld4h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld4h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(bics
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("BICS_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("BICS_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("bics_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(facge
  (c4
    ((sve-p sve-p sve-z sve-z)
      ("facge_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FACGE_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FACGE_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FACGE_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FACGE_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(lasta
  (c3
    ((gpr-32 sve-p sve-z)
      ("lasta_r_p_z_" "WZR, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar sve-p sve-z)
      ("lasta_v_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(sqdmullt
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqdmullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(swpb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(lduminlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uabdl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UABDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autiasppc
  (c1
    ((immediate)
      ("AUTIASPPC_only_dp_1src_imm" "SInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(ldclrpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(insr
  (c2
    ((sve-z gpr-32)
      ("insr_z_r_" "ZUInteger.B, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z simd-scalar)
      ("insr_z_v_" "ZUInteger.B, BUInteger" (("size" (element-size B H S D)) ("Vm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsminalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMINALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fdivr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fdivr_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(uabdlb
  (c3
    ((sve-z sve-z sve-z)
      ("uabdlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(expand
  (c3
    ((sve-z sve-p sve-z)
      ("expand_z_p_z_" "ZUInteger.B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldfmax
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAX_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAX_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAX_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(saddlb
  (c3
    ((sve-z sve-z sve-z)
      ("saddlb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st3q
  (c2
    ((reg-list sve-p)
      ("st3q_z_p_br_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st3q_z_p_bi_contiguous" "{Z UInteger .Q Z UInteger .Q Z UInteger .Q}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldsmaxalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pacnbibsppc
  (c0
    (()
      ("PACNBIBSPPC_64LR_dp_1src" "" ())
    )
  )
)

(psel
  (c3m
    ((sve-p sve-p sve-p memory)
      ("psel_p_ppi_" "PUInteger, PUInteger, PUInteger.D, [W UInteger UInteger]" (("Pn" (reg-range 0 15)) ("Pm" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(swppa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(nor
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("nor_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(umaxv
  (c2
    ((simd-scalar simd-vector)
      ("UMAXV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("umaxv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(ldumaxab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmla
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("fmla_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLA_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLA_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLA_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLA_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("FMLA_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLA_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmla_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmla_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("fmla_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("fmla_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmla_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(ldpsw
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("LDPSW_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("LDPSW_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDPSW_64_ldstpair_off" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldfaddl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFADDL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFADDL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(trn2
  (c3
    ((sve-p sve-p sve-p)
      ("trn2_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("TRN2_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("trn2_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("trn2_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(orr
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("ORR_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("ORR_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c2
    ((simd-vector immediate)
      ("ORR_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
      ("ORR_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("orr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-p sve-p sve-p sve-p)
      ("orr_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("ORR_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("orr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("ORR_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("ORR_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("orr_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st1h
  (c2
    ((reg-list sve-pn)
      ("st1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("st1h_z_p_br_" "{Z UInteger . H}, PUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st1h_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bz_d_64_unscaled" "{Z UInteger . D}, PUInteger, [SP Z UInteger . D]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_ai_d" "{Z UInteger .D}, PUInteger, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_ai_s" "{Z UInteger .S}, PUInteger, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_z_p_bi_" "{Z UInteger . H}, PUInteger, [SP]" (("size" (element-size B H S D)) ("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st1h_za_p_rrr_" "{ZA UInteger H .H [W UInteger UInteger]}, PUInteger, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((reg-list sve-pn memory)
      ("st1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("st1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("st1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(ldclrh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwswpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldff1sb
  (c2
    ((reg-list sve-p)
      ("ldff1sb_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldff1sb_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_br_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_br_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_br_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldff1sb_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(histcnt
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("histcnt_z_p_zz_" "ZUInteger.S, PUInteger/Z, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwscasl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCASL_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(urshr
  (c4
    ((sve-z sve-p sve-z immediate)
      ("urshr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("URSHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("URSHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(frsqrts
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FRSQRTS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRSQRTS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FRSQRTS_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRSQRTS_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("frsqrts_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(swpah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfern
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFERN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldnp
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDNP_S_ldstnapair_offs" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDNP_D_ldstnapair_offs" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("LDNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDNP_32_ldstnapair_offs" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(autiasppcr
  (c1
    ((gpr-64)
      ("AUTIASPPCR_64LRR_dp_1src" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(ldsmaxlb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXLB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ubfm
  (c4
    ((gpr-64 gpr-64 immediate immediate)
      ("UBFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate immediate)
      ("UBFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldaprb
  (c1m
    ((gpr-32 memory)
      ("LDAPRB_32L_memop" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(subpt
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("subpt_z_p_zz_" "ZUInteger.D, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("SUBPT_64_addsub_pt" "SP, SP, XZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("subpt_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(nop
  (c0
    (()
      ("NOP_HI_hints" "" ())
    )
  )
)

(maddpt
  (c4
    ((gpr-64 gpr-64 gpr-64 gpr-64)
      ("MADDPT_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(esb
  (c0
    (()
      ("ESB_HI_hints" "" ())
    )
  )
)

(smc
  (c1
    ((immediate)
      ("SMC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(caspl
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPL_CP64_comswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 gpr-32 memory)
      ("CASPL_CP32_comswappr" "WUInteger, WUInteger, WUInteger, WUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwclral
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(andv
  (c3
    ((simd-scalar sve-p sve-z)
      ("andv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(umlsl
  (c1
    ((sme-za)
      ("umlsl_za_zzi_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("umlsl_za_zzi_2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("umlsl_za_zzi_4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
      ("umlsl_za_zzv_2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlsl_za_zzv_1" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("umlsl_za_zzv_4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("umlsl_za_zzw_2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off2" (imm-range 0 3 1))))
      ("umlsl_za_zzw_4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off2" (imm-range 0 3 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMLSL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("UMLSL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fmul
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmul_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fmul_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMUL_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("FMUL_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fmul_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("fmul_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMUL_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMUL_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("fmul_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("fmul_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("fmul_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fmul_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fmul_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fmul_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldaddh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyprtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcmuo
  (c4
    ((sve-p sve-p sve-z sve-z)
      ("fcmuo_p_p_zz_" "PUInteger.H, PUInteger/Z, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(eor
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("EOR_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("EOR_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("eor_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-p sve-p sve-p sve-p)
      ("eor_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("EOR_64_log_imm" "SP, XZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("eor_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("EOR_32_log_imm" "WSP, WZR, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("EOR_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("eor_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(whilelo
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilelo_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilelo_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilelo_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ssublb
  (c3
    ((sve-z sve-z sve-z)
      ("ssublb_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rdffrs
  (c2
    ((sve-p sve-p)
      ("rdffrs_p_p_f_" "PUInteger.B, PUInteger/Z" (("Pg" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(ftmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("ftmopa_za_zzzi_s2x1" "ZAUInteger.S, {Z UInteger .S- Z UInteger .S}, ZUInteger.S, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("ftmopa_za32_z8z8zi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("ftmopa_za32_zzzi_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("ftmopa_za16_z8z8zi_b2x1" "ZAUInteger.H, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
      ("ftmopa_za_zzzi_h2x1" "ZAUInteger.H, {Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(ldaddah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmlslb
  (c3
    ((sve-z sve-z sve-z)
      ("bfmlslb_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfmlslb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sdiv
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sdiv_z_p_zz_" "ZUInteger.S, PUInteger/M, ZUInteger.S, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("SDIV_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("SDIV_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfsub
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfsub_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("bfsub_za_zw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfsub_za_zw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("bfsub_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(wfit
  (c1
    ((gpr-64)
      ("WFIT_only_systeminstrswithreg" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(xpaci
  (c1
    ((gpr-64)
      ("XPACI_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(uqrshrnt
  (c3
    ((sve-z sve-z immediate)
      ("uqrshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(lsl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("lsl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
      ("lsl_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z immediate)
      ("lsl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("lsl_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("lsl_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sha512h2
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA512H2_QQV_cryptosha512_3" "QUInteger, QUInteger, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ret
  (c0
    (()
      ("RET_64R_branch_reg" "" (("Rn" (reg-range 0 31))))
    )
  )
)

(smov
  (c2
    ((gpr-64 simd-vector)
      ("SMOV_asimdins_X_x" "XZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-vector)
      ("SMOV_asimdins_W_w" "WZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqdmlslb
  (c3
    ((sve-z sve-z sve-z)
      ("sqdmlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqdmlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(xtn
  (c2
    ((simd-vector simd-vector)
      ("XTN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwsclrpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqdech
  (c1
    ((gpr-64)
      ("uqdech_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqdech_z_zs_" "ZUInteger.H" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqdech_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(ldnt1h
  (c2
    ((reg-list sve-pn)
      ("ldnt1h_mz_p_br_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1h_mz_p_br_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1h_mzx_p_br_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1h_mzx_p_br_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ldnt1h_z_p_br_contiguous" "{Z UInteger .H}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1h_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1h_z_p_bi_contiguous" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1h_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("ldnt1h_mz_p_bi_2" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1h_mz_p_bi_4" "{Z UInteger .H- Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1h_mzx_p_bi_2x8" "{Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1h_mzx_p_bi_4x4" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(whilehi
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilehi_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilehi_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilehi_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(fcmpe
  (c2
    ((simd-scalar simd-scalar)
      ("FCMPE_S_floatcmp" "SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCMPE_D_floatcmp" "DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCMPE_H_floatcmp" "HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
    ((simd-scalar float-const)
      ("FCMPE_SZ_floatcmp" "SUInteger, 0.0" (("Rn" (reg-range 0 31))))
      ("FCMPE_DZ_floatcmp" "DUInteger, 0.0" (("Rn" (reg-range 0 31))))
      ("FCMPE_HZ_floatcmp" "HUInteger, 0.0" (("Rn" (reg-range 0 31))))
    )
  )
)

(rdffr
  (c2
    ((sve-p sve-p)
      ("rdffr_p_p_f_" "PUInteger.B, PUInteger/Z" (("Pg" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c1
    ((sve-p)
      ("rdffr_p_f_" "PUInteger.B" (("Pd" (reg-range 0 15))))
    )
  )
)

(sturh
  (c1m
    ((gpr-32 memory)
      ("STURH_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldnf1sb
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1sb_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1sb_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1sb_z_p_bi_s16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(brkn
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkn_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pdm" (reg-range 0 15))))
    )
  )
)

(subg
  (c4
    ((gpr-64 gpr-64 immediate immediate)
      ("SUBG_64_addsub_immtags" "SP, SP, UInteger, UInteger" (("imm6" (imm-range 0 63 1)) ("imm4" (imm-range 0 15 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ushllt
  (c3
    ((sve-z sve-z immediate)
      ("ushllt_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stnp
  (c2m
    ((simd-scalar simd-scalar memory)
      ("STNP_S_ldstnapair_offs" "SUInteger, SUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STNP_D_ldstnapair_offs" "DUInteger, DUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("STNP_Q_ldstnapair_offs" "QUInteger, QUInteger, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory)
      ("STNP_64_ldstnapair_offs" "XZR, XZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("STNP_32_ldstnapair_offs" "WZR, WZR, [SP]" (("imm7" (imm-range 0 127 1)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smlslt
  (c3
    ((sve-z sve-z sve-z)
      ("smlslt_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlslt_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlslt_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cbheq
  (c3
    ((gpr-32 gpr-32 immediate)
      ("CBHEQ_16_regs" "WZR, WZR, SInteger" (("Rm" (reg-range 0 31)) ("imm9" (imm-range 0 511 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ursra
  (c3
    ((simd-scalar simd-scalar immediate)
      ("URSRA_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("URSRA_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("ursra_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fclamp
  (c3
    ((reg-list sve-z sve-z)
      ("fclamp_mz_zz_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("fclamp_mz_zz_4" "{Z UInteger . H - Z UInteger . H}, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("fclamp_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(seten
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETEN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(umov
  (c2
    ((gpr-64 simd-vector)
      ("UMOV_asimdins_X_x" "XZR, VUInteger.D[UInteger" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-vector)
      ("UMOV_asimdins_W_w" "WZR, VUInteger.B[UInteger]" (("imm5" (imm-range 0 31 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(pacibsppc
  (c0
    (()
      ("PACIBSPPC_64LR_dp_1src" "" ())
    )
  )
)

(stlxrb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STLXRB_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(frinta
  (c2
    ((simd-vector simd-vector)
      ("FRINTA_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTA_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("frinta_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("frinta_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTA_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTA_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTA_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frinta_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frinta_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sbfm
  (c4
    ((gpr-64 gpr-64 immediate immediate)
      ("SBFM_64M_bitfield" "XZR, XZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate immediate)
      ("SBFM_32M_bitfield" "WZR, WZR, UInteger, UInteger" (("immr" (imm-range 0 63 1)) ("imms" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcmp
  (c2
    ((simd-scalar simd-scalar)
      ("FCMP_S_floatcmp" "SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCMP_D_floatcmp" "DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("FCMP_H_floatcmp" "HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
    ((simd-scalar float-const)
      ("FCMP_SZ_floatcmp" "SUInteger, 0.0" (("Rn" (reg-range 0 31))))
      ("FCMP_DZ_floatcmp" "DUInteger, 0.0" (("Rn" (reg-range 0 31))))
      ("FCMP_HZ_floatcmp" "HUInteger, 0.0" (("Rn" (reg-range 0 31))))
    )
  )
)

(rcwsswp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(umin
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("umin_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("UMIN_64U_minmax_imm" "XZR, XZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("umin_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("UMIN_32U_minmax_imm" "WZR, WZR, UInteger" (("imm8" (imm-range 0 255 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UMIN_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("UMIN_32_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("umin_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("umin_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((gpr-64 gpr-64 gpr-64)
      ("UMIN_64_dp_2src" "XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("umin_mz_zzw_2x2" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("umin_mz_zzw_4x4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(clz
  (c2
    ((simd-vector simd-vector)
      ("CLZ_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("CLZ_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("CLZ_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("clz_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("clz_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldtrsb
  (c1m
    ((gpr-32 memory)
      ("LDTRSB_32_ldst_unpriv" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDTRSB_64_ldst_unpriv" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cadd
  (c4
    ((sve-z sve-z sve-z immediate)
      ("cadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B, 90" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(uqcvt
  (c2
    ((sve-z reg-list)
      ("uqcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("uqcvt_z_mz4_" "ZUInteger.B, {Z UInteger . S - Z UInteger . S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rsubhn
  (c3
    ((simd-vector simd-vector simd-vector)
      ("RSUBHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uunpkhi
  (c2
    ((sve-z sve-z)
      ("uunpkhi_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldbfmaxl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcvtxnt
  (c3
    ((sve-z sve-p sve-z)
      ("fcvtxnt_z_p_z_d2sz" "ZUInteger.S, PUInteger/Z, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("fcvtxnt_z_p_z_d2s" "ZUInteger.S, PUInteger/M, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(setpt
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETPT_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bf1cvtl
  (c2
    ((simd-vector simd-vector)
      ("BF1CVTL_asimdmisc_V" "VUInteger.8H, VUInteger.8B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list sve-z)
      ("bf1cvtl_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(ldsminl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMINL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMINL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sturb
  (c1m
    ((gpr-32 memory)
      ("STURB_32_ldst_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fadda
  (c4
    ((simd-scalar sve-p simd-scalar sve-z)
      ("fadda_v_p_z_" "HUInteger, PUInteger, HUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31))))
    )
  )
)

(ptrue
  (c1
    ((sve-pn)
      ("ptrue_pn_i_" "PNUInteger.B" (("size" (element-size B H S D)) ("PNd" (reg-range 0 7))))
    )
    ((sve-p)
      ("ptrue_p_s_" "PUInteger.B" (("size" (element-size B H S D)) ("Pd" (reg-range 0 15))))
    )
  )
)

(whilege
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilege_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilege_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilege_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(bl
  (c1
    ((immediate)
      ("BL_only_branch_imm" "SInteger" (("imm26" (imm-range 0 67108863 1))))
    )
  )
)

(cpyfmrtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqshrnt
  (c3
    ((sve-z sve-z immediate)
      ("uqshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(umaxqv
  (c3
    ((simd-vector sve-p sve-z)
      ("umaxqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(uqshl
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqshl_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z immediate)
      ("uqshl_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar simd-scalar immediate)
      ("UQSHL_asisdshf_R" "BUInteger, BUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("UQSHL_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UQSHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("UQSHL_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldnt1b
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1b_z_p_ar_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1b_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1b_z_p_bi_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1b_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("ldnt1b_mz_p_br_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1b_mz_p_br_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1b_mz_p_bi_2" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1b_mz_p_bi_4" "{Z UInteger .B- Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1b_mzx_p_br_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1b_mzx_p_br_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
      ("ldnt1b_mzx_p_bi_2x8" "{Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1b_mzx_p_bi_4x4" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(madd
  (c4
    ((gpr-32 gpr-32 gpr-32 gpr-32)
      ("MADD_32A_dp_3src" "WZR, WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 gpr-64)
      ("MADD_64A_dp_3src" "XZR, XZR, XZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldclralb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDCLRALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(usublt
  (c3
    ((sve-z sve-z sve-z)
      ("usublt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldnf1sh
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1sh_z_p_bi_s64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1sh_z_p_bi_s32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cpy
  (c3
    ((sve-z sve-p gpr-32)
      ("cpy_z_p_r_" "ZUInteger.B, PUInteger/M, WSP" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sve-p simd-scalar)
      ("cpy_z_p_v_" "ZUInteger.B, PUInteger/M, BUInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Vn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sve-p immediate)
      ("cpy_z_o_i_" "ZUInteger.B, PUInteger/Z, SInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
      ("cpy_z_p_i_" "ZUInteger.B, PUInteger/M, SInteger" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldfminl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(madpt
  (c3
    ((sve-z sve-z sve-z)
      ("madpt_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Za" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(dupm
  (c2
    ((sve-z immediate)
      ("dupm_z_i_" "ZUInteger.B, UInteger" (("imm13" (imm-range 0 8191 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pacdzb
  (c1
    ((gpr-64)
      ("PACDZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(ldaddal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDADDAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDADDAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsmax
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMAX_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMAX_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwclrpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCLRPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stz2g
  (c1m1
    ((gpr-64 memory pre-index)
      ("STZ2G_64Spre_ldsttags" "SP, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory immediate)
      ("STZ2G_64Spost_ldsttags" "SP, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-64 memory)
      ("STZ2G_64Soffset_ldsttags" "SP, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldadd
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDADD_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDADD_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smaxp
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("smaxp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SMAXP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfpwtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfminnm
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsmaxal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMAXAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMAXAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(nand
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("nand_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(sqrdmlah
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQRDMLAH_asimdsame2_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQRDMLAH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQRDMLAH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQRDMLAH_asisdsame2_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sqrdmlah_z_zzz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlah_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlah_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("sqrdmlah_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(movprfx
  (c2
    ((sve-z sve-z)
      ("movprfx_z_z_" "ZUInteger, ZUInteger" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("movprfx_z_p_z_" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(fvdot
  (c1
    ((sme-za)
      ("fvdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fvdot_za_z8z8i_2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(bf2cvt
  (c2
    ((reg-list sve-z)
      ("bf2cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
    ((sve-z sve-z)
      ("bf2cvt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(uminv
  (c2
    ((simd-scalar simd-vector)
      ("UMINV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("uminv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(ldfmaxa
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXA_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXA_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwssetpa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(decw
  (c1
    ((gpr-64)
      ("decw_r_rs_" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("decw_z_zs_" "ZUInteger.S" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldnt1d
  (c2
    ((reg-list sve-pn)
      ("ldnt1d_mz_p_br_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1d_mz_p_br_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1d_mzx_p_br_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1d_mzx_p_br_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ldnt1d_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ldnt1d_z_p_bi_contiguous" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnt1d_z_p_ar_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
    ((reg-list sve-pn memory)
      ("ldnt1d_mz_p_bi_2" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ldnt1d_mz_p_bi_4" "{Z UInteger .D- Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1d_mzx_p_bi_2x8" "{Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ldnt1d_mzx_p_bi_4x4" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(sha512h
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA512H_QQV_cryptosha512_3" "QUInteger, QUInteger, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldclrp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqshrn
  (c3
    ((simd-scalar simd-scalar immediate)
      ("SQSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("SQSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("sqshrn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smop4s
  (c3
    ((sme-za reg-list sve-z)
      ("smop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("smop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("smop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("smop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(frinti
  (c2
    ((simd-vector simd-vector)
      ("FRINTI_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTI_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTI_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTI_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTI_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frinti_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frinti_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldxrb
  (c1m
    ((gpr-32 memory)
      ("LDXRB_LR32_ldstexclr" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld4w
  (c2
    ((reg-list sve-p)
      ("ld4w_z_p_br_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld4w_z_p_bi_contiguous" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cpyfptrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ld64b
  (c1m
    ((gpr-64 memory)
      ("LD64B_64L_memop" "XZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mlapt
  (c3
    ((sve-z sve-z sve-z)
      ("mlapt_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldfminnmal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNMAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNMAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgptn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETGPTN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(subhnb
  (c3
    ((sve-z sve-z sve-z)
      ("subhnb_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(chkfeat
  (c1
    ((gpr-64)
      ("CHKFEAT_HF_hints" "X16" ())
    )
  )
)

(sqrshrunt
  (c3
    ((sve-z sve-z immediate)
      ("sqrshrunt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(usmopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("usmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("usmopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(rshrnb
  (c3
    ((sve-z sve-z immediate)
      ("rshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(addhnt
  (c3
    ((sve-z sve-z sve-z)
      ("addhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(andqv
  (c3
    ((simd-vector sve-p sve-z)
      ("andqv_z_p_z_" "VUInteger.16B, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(fcvtms
  (c2
    ((simd-vector simd-vector)
      ("FCVTMS_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTMS_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTMS_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTMS_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMS_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfminnm
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINNM_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNM_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINNM_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rcwcaspal
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("RCWCASPAL_C64_rcwcomswappr" "XUInteger, XUInteger, XUInteger, XUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(usmop4s
  (c3
    ((sme-za reg-list sve-z)
      ("usmop4s_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4s_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("usmop4s_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4s_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("usmop4s_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4s_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("usmop4s_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("usmop4s_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(usmlall
  (c1
    ((sme-za)
      ("usmlall_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("usmlall_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("usmlall_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("usmlall_za_zzv_s2x1" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("usmlall_za_zzv_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("usmlall_za_zzv_s4x1" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("usmlall_za_zzw_s2x2" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger . B- Z UInteger . B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("usmlall_za_zzw_s4x4" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger . B- Z UInteger . B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(cpyptwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(caspt
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmaxnmqv
  (c3
    ((simd-vector sve-p sve-z)
      ("fmaxnmqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(ld1rd
  (c2m
    ((reg-list sve-p memory)
      ("ld1rd_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(addsubp
  (c3
    ((sve-z sve-z sve-z)
      ("addsubp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(brkbs
  (c3
    ((sve-p sve-p sve-p)
      ("brkbs_p_p_p_z" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(sha256su0
  (c2
    ((simd-vector simd-vector)
      ("SHA256SU0_VV_cryptosha2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(lduminal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMINAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMINAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(abs
  (c2
    ((simd-vector simd-vector)
      ("ABS_asimdmisc_R" "VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64)
      ("ABS_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("ABS_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("ABS_asisdmisc_R" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("abs_z_p_z_m" "ZUInteger.B, PUInteger/M, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("abs_z_p_z_z" "ZUInteger.B, PUInteger/Z, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bmops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("bmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(fmlsl2
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLSL2_asimdsame_F" "VUInteger.2S, VUInteger.2H, VUInteger.2H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLSL2_asimdelem_LH" "VUInteger.2S, VUInteger.2H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwssetal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSETAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(f2cvt
  (c2
    ((reg-list sve-z)
      ("f2cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
    ((sve-z sve-z)
      ("f2cvt_z_z8_b2h" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(sb
  (c0
    (()
      ("SB_only_barriers" "" ())
    )
  )
)

(ldtclra
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTCLRA_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTCLRA_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmlalb
  (c3
    ((sve-z sve-z sve-z)
      ("bfmlalb_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfmlalb_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fcvt
  (c2
    ((reg-list sve-z)
      ("fcvt_mz2_z_" "{Z UInteger .S- Z UInteger .S}, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
    ((simd-scalar simd-scalar)
      ("FCVT_DS_floatdp1" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVT_HS_floatdp1" "HUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVT_SD_floatdp1" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVT_HD_floatdp1" "HUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVT_SH_floatdp1" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVT_DH_floatdp1" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list)
      ("fcvt_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("fcvt_z8_mz2_" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("fcvt_z8_mz4_" "ZUInteger.B, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
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
    )
  )
)

(smaxv
  (c2
    ((simd-scalar simd-vector)
      ("SMAXV_asimdall_only" "BUInteger, VUInteger.8B" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-scalar sve-p sve-z)
      ("smaxv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(shrn
  (c3
    ((simd-vector simd-vector immediate)
      ("SHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfe
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFE_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fmlalltb
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALLTB_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALLTB_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlalltb_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalltb_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(uqshrn
  (c3
    ((simd-scalar simd-scalar immediate)
      ("UQSHRN_asisdshf_N" "BUInteger, HUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("UQSHRN_asimdshf_N" "VUInteger.8B, VUInteger.8H, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list immediate)
      ("uqshrn_z_mz2_" "ZUInteger.B, {Z UInteger . H - Z UInteger . H}, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(br
  (c1
    ((gpr-64)
      ("BR_64_branch_reg" "XZR" (("Rn" (reg-range 0 31))))
    )
  )
)

(stgp
  (c2m1
    ((gpr-64 gpr-64 memory immediate)
      ("STGP_64_ldstpair_post" "XZR, XZR, [SP], SInteger" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 memory pre-index)
      ("STGP_64_ldstpair_pre" "XZR, XZR, [SP SInteger], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((gpr-64 gpr-64 memory)
      ("STGP_64_ldstpair_off" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfptn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fcvtmu
  (c2
    ((simd-vector simd-vector)
      ("FCVTMU_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FCVTMU_asisdmiscfp16_R" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_asisdmisc_R" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_sisd_32D" "SUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_sisd_32H" "SUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_sisd_64H" "DUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_sisd_64S" "DUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FCVTMU_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_32D_float2int" "WZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FCVTMU_64S_float2int" "XZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCVTMU_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(autib1716
  (c0
    (()
      ("AUTIB1716_HI_hints" "" ())
    )
  )
)

(bfmmla
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BFMMLA_asimdsame2_E" "VUInteger.4S, VUInteger.8H, VUInteger.8H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("bfmmla_z_zzz_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfmmla_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ldumaxal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMAXAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMAXAL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1rb
  (c2m
    ((reg-list sve-p memory)
      ("ld1rb_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rb_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rb_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rb_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(crc32cw
  (c3
    ((gpr-32 gpr-32 gpr-32)
      ("CRC32CW_32C_dp_2src" "WZR, WZR, WZR" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sutmopa
  (c4
    ((sme-za reg-list sve-z sve-z)
      ("sutmopa_za_zzzi_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B, ZUInteger[UInteger]" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 15))))
    )
  )
)

(axflag
  (c0
    (()
      ("AXFLAG_M_pstate" "" ())
    )
  )
)

(ldsmin
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMIN_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMIN_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fminnm
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fminnm_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fminnm_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMINNM_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNM_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("fminnm_mz_zzv_2x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fminnm_mz_zzv_4x1" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMINNM_S_floatdp2" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNM_D_floatdp2" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMINNM_H_floatdp2" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("fminnm_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("fminnm_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(setpn
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETPN_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqrshrnb
  (c3
    ((sve-z sve-z immediate)
      ("sqrshrnb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1rh
  (c2m
    ((reg-list sve-p memory)
      ("ld1rh_z_p_bi_u16" "{Z UInteger .H}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rh_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rh_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm6" (imm-range 0 63 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(fmls
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("fmls_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzi_s2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzi_d2xi" "ZA.D[WUInteger, UInteger, VGx2, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .S- Z UInteger .S}, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .D- Z UInteger .D}, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLS_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLS_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLS_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLS_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("FMLS_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLS_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmls_z_zzzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmls_z_zzzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("fmls_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("fmls_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("fmls_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(cpyfewtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFEWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(brkpbs
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkpbs_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(stlrb
  (c1m
    ((gpr-32 memory)
      ("STLRB_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqdmlal
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQDMLAL_asimddiff_L" "VUInteger.4S, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQDMLAL_asimdelem_L" "VUInteger.4S, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQDMLAL_asisdelem_L" "SUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQDMLAL_asisddiff_only" "SUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqdecd
  (c1
    ((gpr-64)
      ("uqdecd_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z)
      ("uqdecd_z_zs_" "ZUInteger.D" (("imm4" (imm-range 0 15 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqdecd_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(lduminalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(firstp
  (c3
    ((gpr-64 sve-p sve-p)
      ("firstp_r_p_p_" "XUInteger, PUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stfmin
  (c1m
    ((simd-scalar memory)
      ("STFMIN_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMIN_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMIN_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(stbfmax
  (c1m
    ((simd-scalar memory)
      ("STBFMAX_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(bfdot
  (c1
    ((sme-za)
      ("bfdot_za_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfdot_za_zzi_4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("bfdot_za_zzv_2x1" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfdot_za_zzv_4x1" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfdot_za_zzw_2x2" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfdot_za_zzw_4x4" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BFDOT_asimdsame2_D" "VUInteger.2S, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("BFDOT_asimdelem_E" "VUInteger.2S, VUInteger.4H, VUInteger.2H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("bfdot_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfdot_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(sm4e
  (c2
    ((simd-vector simd-vector)
      ("SM4E_VV4_cryptosha512_2" "VUInteger.4S, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("sm4e_z_zz_" "ZUInteger.S, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(sxtb
  (c3
    ((sve-z sve-p sve-z)
      ("sxtb_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sxtb_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(umlslb
  (c3
    ((sve-z sve-z sve-z)
      ("umlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("umlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(swpab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("SWPAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(mrs
  (c2
    ((gpr-64 system-reg)
      ("MRS_RS_systemmove" "XZR, ACTLR_EL3" (("Rt" (reg-range 0 31))))
    )
  )
)

(stfminnm
  (c1m
    ((simd-scalar memory)
      ("STFMINNM_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINNM_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMINNM_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(zero
  (c1
    ((reg-list)
      ("zero_za_i_" "{}" (("imm8" (imm-range 0 255 1))))
      ("zero_zt_i_" "{ZT0}" ())
    )
    ((sme-za)
      ("zero_za1_ri_2" "ZA.D[WUInteger, UInteger, VGx2" (("off3" (imm-range 0 7 1))))
      ("zero_za1_ri_4" "ZA.D[WUInteger, UInteger, VGx4" (("off3" (imm-range 0 7 1))))
      ("zero_za2_ri_1" "ZA.D[WUInteger, UInteger:UInteger" (("off3" (imm-range 0 7 1))))
      ("zero_za2_ri_2" "ZA.D[WUInteger, UInteger:UInteger, VGx2]" (("off2" (imm-range 0 3 1))))
      ("zero_za2_ri_4" "ZA.D[WUInteger, UInteger:UInteger, VGx4]" (("off2" (imm-range 0 3 1))))
      ("zero_za4_ri_1" "ZA.D[WUInteger, UInteger:UInteger" (("off2" (imm-range 0 3 1))))
      ("zero_za4_ri_2" "ZA.D[WUInteger, UInteger:UInteger, VGx2]" ())
      ("zero_za4_ri_4" "ZA.D[WUInteger, UInteger:UInteger, VGx4]" ())
    )
  )
)

(fnmsb
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fnmsb_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Za" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldaddl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDADDL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDADDL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bf1cvt
  (c2
    ((reg-list sve-z)
      ("bf1cvt_mz2_z8_" "{Z UInteger .H- Z UInteger .H}, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
    ((sve-z sve-z)
      ("bf1cvt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(paciaz
  (c0
    (()
      ("PACIAZ_HI_hints" "" ())
    )
  )
)

(setgoe
  (c0m1
    ((memory gpr-64)
      ("SETGOE_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(eon
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("EON_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("EON_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uqdecb
  (c1
    ((gpr-64)
      ("uqdecb_r_rs_x" "XUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
    ((gpr-32)
      ("uqdecb_r_rs_uw" "WUInteger" (("imm4" (imm-range 0 15 1)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(ldfmaxal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMAXAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMAXAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(lduminah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rdsvl
  (c2
    ((gpr-64 immediate)
      ("rdsvl_r_i_" "XUInteger, SInteger" (("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(eor3
  (c4
    ((simd-vector simd-vector simd-vector simd-vector)
      ("EOR3_VVV16_crypto4" "VUInteger.16B, VUInteger.16B, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z sve-z)
      ("eor3_z_zzz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(whilels
  (c4
    ((sve-pn gpr-64 gpr-64 vector-length)
      ("whilels_pn_rr_" "PNUInteger.B, XUInteger, XUInteger, VLx2" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("PNd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list gpr-64 gpr-64)
      ("whilels_pp_rr_" "{P UInteger . B P UInteger . B}, XUInteger, XUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 7))))
    )
    ((sve-p gpr-32 gpr-32)
      ("whilels_p_p_rr_" "PUInteger.B, WZR, WZR" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(casa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("CASA_C64_comswap" "XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("CASA_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqshrunb
  (c3
    ((sve-z sve-z immediate)
      ("sqshrunb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldsetpl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETPL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ucvtflt
  (c2
    ((sve-z sve-z)
      ("ucvtflt_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyetn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYETN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stlxrh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STLXRH_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldrh
  (c1m1
    ((gpr-32 memory pre-index)
      ("LDRH_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDRH_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDRH_32_ldst_regoff" "WZR, [SP WZR UXTW 0]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRH_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(swpt
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPT_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWPT_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(eorv
  (c3
    ((simd-scalar sve-p sve-z)
      ("eorv_r_p_z_" "BUInteger, PUInteger, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(uaddl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UADDL_asimddiff_L" "VUInteger.8H, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(rcwseta
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(aesimc
  (c2
    ((simd-vector simd-vector)
      ("AESIMC_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z)
      ("aesimc_z_z_" "ZUInteger.B, ZUInteger.B" (("Zdn" (reg-range 0 31))))
    )
  )
)

(lduminb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1w
  (c2
    ((reg-list sve-pn)
      ("ld1w_mz_p_br_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1w_mz_p_br_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1w_mzx_p_br_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1w_mzx_p_br_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z" (("Rm" (reg-range 0 31)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
    ((reg-list sve-p)
      ("ld1w_z_p_bz_s_x32_scaled" "{Z UInteger .S}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_br_u32" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_br_u64" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_br_u128" "{Z UInteger .Q}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bz_d_x32_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bz_d_64_unscaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bz_d_64_scaled" "{Z UInteger .D}, PUInteger/Z" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1w_z_p_bz_s_x32_unscaled" "{Z UInteger .S}, PUInteger/Z, [SP Z UInteger .S UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_ai_s" "{Z UInteger .S}, PUInteger/Z, [Z UInteger .S]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bi_u128" "{Z UInteger .Q}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_bz_d_x32_unscaled" "{Z UInteger .D}, PUInteger/Z, [SP Z UInteger .D UXTW]" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_z_p_ai_d" "{Z UInteger .D}, PUInteger/Z, [Z UInteger .D]" (("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1w_za_p_rrr_" "{ZA UInteger H .S [W UInteger UInteger]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
    ((reg-list sve-pn memory)
      ("ld1w_mz_p_bi_2" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 15))))
      ("ld1w_mz_p_bi_4" "{Z UInteger .S- Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1w_mzx_p_bi_2x8" "{Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 7))))
      ("ld1w_mzx_p_bi_4x4" "{Z UInteger .S Z UInteger .S Z UInteger .S Z UInteger .S}, PNUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("PNg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 3))))
    )
  )
)

(csinc
  (c4
    ((gpr-32 gpr-32 gpr-32 cond-code)
      ("CSINC_32_condsel" "WZR, WZR, WZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 cond-code)
      ("CSINC_64_condsel" "XZR, XZR, XZR, EQ" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(addpt
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("addpt_z_p_zz_" "ZUInteger.D, PUInteger/M, ZUInteger.D, ZUInteger.D" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 gpr-64)
      ("ADDPT_64_addsub_pt" "SP, SP, XZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("addpt_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ssublt
  (c3
    ((sve-z sve-z sve-z)
      ("ssublt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(st4d
  (c2
    ((reg-list sve-p)
      ("st4d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st4d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(umop4a
  (c3
    ((sme-za reg-list sve-z)
      ("umop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("umop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("umop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("umop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("umop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(cpyern
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYERN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stllrb
  (c1m
    ((gpr-32 memory)
      ("STLLRB_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldnf1w
  (c2m
    ((reg-list sve-p memory)
      ("ldnf1w_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ldnf1w_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(drps
  (c0
    (()
      ("DRPS_64E_branch_reg" "" ())
    )
  )
)

(rcwsclrp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(gcsstr
  (c1m
    ((gpr-64 memory)
      ("GCSSTR_64_ldst_gcs" "XZR, [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfmn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqshrunt
  (c3
    ((sve-z sve-z immediate)
      ("sqshrunt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(rcwcasa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWCASA_C64_rcwcomswap" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(autdb
  (c2
    ((gpr-64 gpr-64)
      ("AUTDB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqadd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("sqadd_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("sqadd_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("SQADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQADD_asisdsame_only" "BUInteger, BUInteger, BUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sqadd_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfmwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqrdmulh
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SQRDMULH_asimdsame_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SQRDMULH_asimdelem_R" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("SQRDMULH_asisdelem_R" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("size" (element-size B H S D)) ("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("SQRDMULH_asisdsame_only" "HUInteger, HUInteger, HUInteger" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("sqrdmulh_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqrdmulh_z_zzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqrdmulh_z_zzi_s" "ZUInteger.S, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sqrdmulh_z_zzi_d" "ZUInteger.D, ZUInteger.D, ZUInteger.D[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfmrtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(smlslb
  (c3
    ((sve-z sve-z sve-z)
      ("smlslb_z_zzz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlslb_z_zzzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("smlslb_z_zzzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(fnmls
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fnmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(usmops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("usmops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("usmops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(subs
  (c5
    ((gpr-64 gpr-64 gpr-32 keyword immediate)
      ("SUBS_64S_addsub_ext" "XZR, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("SUBS_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("SUBS_32S_addsub_ext" "WZR, WSP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("SUBS_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("SUBS_64S_addsub_imm" "XZR, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("SUBS_32S_addsub_imm" "WZR, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(retabsppc
  (c1
    ((immediate)
      ("RETABSPPC_only_miscbranch" "SInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(bfclamp
  (c3
    ((reg-list sve-z sve-z)
      ("bfclamp_mz_zz_2" "{Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("bfclamp_mz_zz_4" "{Z UInteger .H- Z UInteger .H}, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("bfclamp_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1rob
  (c2m
    ((reg-list sve-p memory)
      ("ld1rob_z_p_br_contiguous" "{Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1rob_z_p_bi_u8" "{Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ld1rqw
  (c2
    ((reg-list sve-p)
      ("ld1rqw_z_p_br_contiguous" "{Z UInteger .S}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1rqw_z_p_bi_u32" "{Z UInteger .S}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldbfmaxnma
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXNMA_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pacdb
  (c2
    ((gpr-64 gpr-64)
      ("PACDB_64P_dp_1src" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfmwtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setgom
  (c0m1
    ((memory gpr-64)
      ("SETGOM_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldfminal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDFMINAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINAL_32" "SUInteger, SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDFMINAL_64" "DUInteger, DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stxrh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STXRH_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ushl
  (c3
    ((simd-vector simd-vector simd-vector)
      ("USHL_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("USHL_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldseth
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyptrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(aesemc
  (c3
    ((reg-list reg-list sve-z)
      ("aesemc_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
      ("aesemc_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(aese
  (c2
    ((simd-vector simd-vector)
      ("AESE_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("aese_mz_zzi_2x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 15))))
      ("aese_mz_zzi_4x1" "{Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}, ZUInteger.Q[UInteger" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("aese_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsmaxb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfprtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFPRTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bfmls
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmls_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("bfmls_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfmls_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("bfmls_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmls_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmls_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfmls_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("bfmls_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(uqdecp
  (c2
    ((gpr-64 sve-p)
      ("uqdecp_r_p_r_x" "XUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
    ((sve-z sve-p)
      ("uqdecp_z_p_z_" "ZUInteger.H, PUInteger.H" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 sve-p)
      ("uqdecp_r_p_r_uw" "WUInteger, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Rdn" (reg-range 0 31))))
    )
  )
)

(frintm
  (c2
    ((simd-vector simd-vector)
      ("FRINTM_asimdmiscfp16_R" "VUInteger.4H, VUInteger.4H" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTM_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list)
      ("frintm_mz_z_2" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 15))))
      ("frintm_mz_z_4" "{Z UInteger .S- Z UInteger .S}, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar)
      ("FRINTM_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTM_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FRINTM_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("frintm_z_p_z_z" "ZUInteger.H, PUInteger/Z, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("frintm_z_p_z_m" "ZUInteger.H, PUInteger/M, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldtsetl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTSETL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTSETL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfmaxnmal
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMAXNMAL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcpy
  (c3
    ((sve-z sve-p float-const)
      ("fcpy_z_p_i_" "ZUInteger.H, PUInteger/M, Real" (("size" (element-size B H S D)) ("Pg" (reg-range 0 15)) ("imm8" (imm-range 0 255 1)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cbnz
  (c2
    ((gpr-64 immediate)
      ("CBNZ_64_compbranch" "XZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("CBNZ_32_compbranch" "WZR, SInteger" (("imm19" (imm-range 0 524287 1)) ("Rt" (reg-range 0 31))))
    )
  )
)

(rsubhnt
  (c3
    ((sve-z sve-z sve-z)
      ("rsubhnt_z_zz_" "ZUInteger.B, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stlrh
  (c1m
    ((gpr-32 memory)
      ("STLRH_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stfadd
  (c1m
    ((simd-scalar memory)
      ("STFADD_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFADD_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFADD_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(smaddl
  (c4
    ((gpr-64 gpr-32 gpr-32 gpr-64)
      ("SMADDL_64WA_dp_3src" "XZR, WZR, WZR, XZR" (("Rm" (reg-range 0 31)) ("Ra" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqxtunt
  (c2
    ((sve-z sve-z)
      ("sqxtunt_z_zz_" "ZUInteger.B, ZUInteger.H" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stbfmaxl
  (c1m
    ((simd-scalar memory)
      ("STBFMAXL_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ursqrte
  (c2
    ((simd-vector simd-vector)
      ("URSQRTE_asimdmisc_R" "VUInteger.2S, VUInteger.2S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-p sve-z)
      ("ursqrte_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("ursqrte_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld1q
  (c2m
    ((reg-list sve-p memory)
      ("ld1q_z_p_ar_d_64_unscaled" "{Z UInteger .Q}, PUInteger/Z, [Z UInteger .D]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld1q_za_p_rrr_" "{ZA UInteger H .Q [W UInteger 0]}, PUInteger/Z, [SP]" (("Rm" (reg-range 0 31)) ("Rs" (reg-range 0 3)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31))))
    )
  )
)

(ld4
  (c1m1
    ((reg-list memory immediate)
      ("LD4_asisdlsep_I4_i" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], 32" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD4_asisdlsep_R4_r" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("LD4_asisdlso_B4_4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlso_H4_4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlso_S4_4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlso_D4_4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("LD4_asisdlsop_B4_i4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_H4_i4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], 8" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_S4_i4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_D4_i4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], 32" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("LD4_asisdlsop_BX4_r4b" "{V UInteger . B V UInteger . B V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_HX4_r4h" "{V UInteger . H V UInteger . H V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_SX4_r4s" "{V UInteger . S V UInteger . S V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD4_asisdlsop_DX4_r4d" "{V UInteger . D V UInteger . D V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD4_asisdlse_R4" "{V UInteger . 8B V UInteger . 8B V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldbfminl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFMINL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ld1rod
  (c2
    ((reg-list sve-p)
      ("ld1rod_z_p_br_contiguous" "{Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld1rod_z_p_bi_u64" "{Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(ldeor
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDEOR_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDEOR_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(st4h
  (c2
    ((reg-list sve-p)
      ("st4h_z_p_br_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("st4h_z_p_bi_contiguous" "{Z UInteger .H Z UInteger .H Z UInteger .H Z UInteger .H}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(cmpge
  (c4
    ((sve-p sve-p sve-z immediate)
      ("cmpge_p_p_zi_" "PUInteger.B, PUInteger/Z, ZUInteger.B, SInteger" (("size" (element-size B H S D)) ("imm5" (imm-range 0 31 1)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
    ((sve-p sve-p sve-z sve-z)
      ("cmpge_p_p_zz_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("cmpge_p_p_zw_" "PUInteger.B, PUInteger/Z, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(rcwswppa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(saddlbt
  (c3
    ((sve-z sve-z sve-z)
      ("saddlbt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pacizb
  (c1
    ((gpr-64)
      ("PACIZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(pmlal
  (c3
    ((reg-list sve-z sve-z)
      ("pmlal_mz_zzzw_1x2" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 15))))
    )
  )
)

(swpp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWPP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bfmlslt
  (c3
    ((sve-z sve-z sve-z)
      ("bfmlslt_z_zzzi_" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("bfmlslt_z_zzz_" "ZUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(brkpb
  (c4
    ((sve-p sve-p sve-p sve-p)
      ("brkpb_p_p_pp_" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(cpyprtrn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPRTRN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(bic
  (c5
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("BIC_32_log_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("BIC_64_log_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c2
    ((simd-vector immediate)
      ("BIC_asimdimm_L_sl" "VUInteger.2S, UInteger" (("Rd" (reg-range 0 31))))
      ("BIC_asimdimm_L_hl" "VUInteger.4H, UInteger" (("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bic_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-p sve-p sve-p sve-p)
      ("bic_p_p_pp_z" "PUInteger.B, PUInteger/Z, PUInteger.B, PUInteger.B" (("Pm" (reg-range 0 15)) ("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("BIC_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("bic_z_zz_" "ZUInteger.D, ZUInteger.D, ZUInteger.D" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpyfm
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFM_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldtaddal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTADDAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTADDAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(svc
  (c1
    ((immediate)
      ("SVC_EX_exception" "UInteger" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(sqxtun
  (c2
    ((simd-vector simd-vector)
      ("SQXTUN_asimdmisc_N" "VUInteger.8B, VUInteger.8H" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("SQXTUN_asisdmisc_N" "BUInteger, HUInteger" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldbfaddl
  (c2m
    ((simd-scalar simd-scalar memory)
      ("LDBFADDL_16" "HUInteger, HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfmt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldsetl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSETL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sha512su1
  (c3
    ((simd-vector simd-vector simd-vector)
      ("SHA512SU1_VVV2_cryptosha512_3" "VUInteger.2D, VUInteger.2D, VUInteger.2D" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(casplt
  (c4m
    ((gpr-64 gpr-64 gpr-64 gpr-64 memory)
      ("CASPLT_CP64_comswappr_unpriv" "XUInteger, XUInteger, XUInteger, XUInteger, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfmwt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uzp
  (c2
    ((reg-list reg-list)
      ("uzp_mz_z_4" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
      ("uzp_mz_z_4q" "{Z UInteger .Q- Z UInteger .Q}, {Z UInteger .Q- Z UInteger .Q}" (("Zn" (reg-range 0 7)) ("Zd" (reg-range 0 7))))
    )
  )
  (c3
    ((reg-list sve-z sve-z)
      ("uzp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("uzp_mz_zz_2q" "{Z UInteger .Q- Z UInteger .Q}, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(bfmla
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfmla_z_p_zzz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
  (c1
    ((sme-za)
      ("bfmla_za_zzi_h2xi" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfmla_za_zzi_h4xi" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("bfmla_za_zzv_2x1_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmla_za_zzv_4x1_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("bfmla_za_zzw_2x2_16" "ZA.H[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("bfmla_za_zzw_4x4_16" "ZA.H[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((sve-z sve-z sve-z)
      ("bfmla_z_zzzi_h" "ZUInteger.H, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(ld2
  (c1m1
    ((reg-list memory immediate)
      ("LD2_asisdlsep_I2_i" "{V UInteger . 8B V UInteger . 8B}, [SP], 16" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory gpr-64)
      ("LD2_asisdlsep_R2_r" "{V UInteger . 8B V UInteger . 8B}, [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory)
      ("LD2_asisdlso_B2_2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlso_H2_2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlso_S2_2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlso_D2_2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m2
    ((reg-list memory memory immediate)
      ("LD2_asisdlsop_B2_i2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], 2" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_H2_i2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], 4" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_S2_i2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], 8" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_D2_i2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], 16" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((reg-list memory memory gpr-64)
      ("LD2_asisdlsop_BX2_r2b" "{V UInteger . B V UInteger . B}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_HX2_r2h" "{V UInteger . H V UInteger . H}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_SX2_r2s" "{V UInteger . S V UInteger . S}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LD2_asisdlsop_DX2_r2d" "{V UInteger . D V UInteger . D}, [UInteger], [SP], XUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((reg-list memory)
      ("LD2_asisdlse_R2" "{V UInteger . 8B V UInteger . 8B}, [SP]" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsetalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETALH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ctz
  (c2
    ((gpr-64 gpr-64)
      ("CTZ_64_dp_1src" "XZR, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32)
      ("CTZ_32_dp_1src" "WZR, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpypwtn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPWTN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sys
  (c4
    ((immediate system-reg system-reg immediate)
      ("SYS_CR_systeminstrs" "UInteger, CUInteger, CUInteger, UInteger" (("Rt" (reg-range 0 31))))
    )
  )
)

(ushr
  (c3
    ((simd-scalar simd-scalar immediate)
      ("USHR_asisdshf_R" "DUInteger, DUInteger, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("USHR_asimdshf_R" "VUInteger.8B, VUInteger.8B, UInteger" (("immh" (imm-range 0 15 1)) ("immb" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(lduminh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMINH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cpyfetn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFETN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fexpa
  (c2
    ((sve-z sve-z)
      ("fexpa_z_z_" "ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(dcps2
  (c0
    (()
      ("DCPS2_DC_exception" "" (("imm16" (imm-range 0 65535 1))))
    )
  )
)

(stllrh
  (c1m
    ((gpr-32 memory)
      ("STLLRH_SL32_ldstord" "WZR, [SP 0]" (("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fcmlt
  (c4
    ((sve-p sve-p sve-z float-const)
      ("fcmlt_p_p_z0_" "PUInteger.H, PUInteger/Z, ZUInteger.H, 0.0" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
  (c3
    ((simd-scalar simd-scalar float-const)
      ("FCMLT_asisdmiscfp16_FZ" "HUInteger, HUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMLT_asisdmisc_FZ" "SUInteger, SUInteger, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector float-const)
      ("FCMLT_asimdmiscfp16_FZ" "VUInteger.4H, VUInteger.4H, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FCMLT_asimdmisc_FZ" "VUInteger.2S, VUInteger.2S, 0.0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stfmax
  (c1m
    ((simd-scalar memory)
      ("STFMAX_16" "HUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAX_32" "SUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
      ("STFMAX_64" "DUInteger, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31))))
    )
  )
)

(cpypwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(eorbt
  (c3
    ((sve-z sve-z sve-z)
      ("eorbt_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bti
  (c0
    (()
      ("BTI_HB_hints" "" ())
    )
  )
)

(rcwsetpal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSETPAL_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pmov
  (c2
    ((sve-z sve-p)
      ("pmov_z_pi_b" "ZUInteger, PUInteger.B" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("pmov_z_pi_h" "ZUInteger, PUInteger.H" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("pmov_z_pi_s" "ZUInteger, PUInteger.S" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("pmov_z_pi_d" "ZUInteger, PUInteger.D" (("Pn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
    ((sve-p sve-z)
      ("pmov_p_zi_b" "PUInteger.B, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("pmov_p_zi_h" "PUInteger.H, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("pmov_p_zi_s" "PUInteger.S, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
      ("pmov_p_zi_d" "PUInteger.D, ZUInteger" (("Zn" (reg-range 0 31)) ("Pd" (reg-range 0 15))))
    )
  )
)

(rshrnt
  (c3
    ((sve-z sve-z immediate)
      ("rshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(stilp
  (c2m1
    ((gpr-64 gpr-64 memory pre-index)
      ("STILP_64SS_ldiappstilp" "XZR, XZR, [SP -16], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory pre-index)
      ("STILP_32SE_ldiappstilp" "WZR, WZR, [SP -8], !" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c2m
    ((gpr-64 gpr-64 memory)
      ("STILP_64S_ldiappstilp" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("STILP_32S_ldiappstilp" "WZR, WZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(wrffr
  (c1
    ((sve-p)
      ("wrffr_f_p_" "PUInteger.B" (("Pn" (reg-range 0 15))))
    )
  )
)

(rcwsswppa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSSWPPA_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(casalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASALB_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ldsmaxh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(lsr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("lsr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
      ("lsr_z_p_zw_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z immediate)
      ("lsr_z_p_zi_" "ZUInteger.B, PUInteger/M, ZUInteger.B, UInteger" (("Pg" (reg-range 0 7)) ("imm3" (imm-range 0 7 1)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((sve-z sve-z immediate)
      ("lsr_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("lsr_z_zw_" "ZUInteger.B, ZUInteger.B, ZUInteger.D" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld3d
  (c2
    ((reg-list sve-p)
      ("ld3d_z_p_br_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
  (c2m
    ((reg-list sve-p memory)
      ("ld3d_z_p_bi_contiguous" "{Z UInteger .D Z UInteger .D Z UInteger .D}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(lduminl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMINL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMINL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uqrshlr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uqrshlr_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(ldsetp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSETP_128_memop_128" "XZR, XZR, [SP]" (("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(umullt
  (c3
    ((sve-z sve-z sve-z)
      ("umullt_z_zzi_s" "ZUInteger.S, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("umullt_z_zzi_d" "ZUInteger.D, ZUInteger.S, ZUInteger.S[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("umullt_z_zz_" "ZUInteger.H, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ldumaxa
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDUMAXA_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDUMAXA_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(cmge
  (c3
    ((simd-scalar simd-scalar immediate)
      ("CMGE_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("CMGE_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("CMGE_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMGE_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldtsetal
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDTSETAL_64_memop_unpriv" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDTSETAL_32_memop_unpriv" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(brkb
  (c3
    ((sve-p sve-p sve-p)
      ("brkb_p_p_p_" "PUInteger.B, PUInteger/Z, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
  )
)

(fsubr
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fsubr_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
    ((sve-z sve-p sve-z float-const)
      ("fsubr_z_p_zs_" "ZUInteger.H, PUInteger/M, ZUInteger.H, 0.5" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zdn" (reg-range 0 31))))
    )
  )
)

(stxp
  (c3m
    ((gpr-32 gpr-64 gpr-64 memory)
      ("STXP_SP64_ldstexclp" "WZR, XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 memory)
      ("STXP_SP32_ldstexclp" "WZR, WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stlxp
  (c3m
    ((gpr-32 gpr-64 gpr-64 memory)
      ("STLXP_SP64_ldstexclp" "WZR, XZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 memory)
      ("STLXP_SP32_ldstexclp" "WZR, WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rt2" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(bf2cvtlt
  (c2
    ((sve-z sve-z)
      ("bf2cvtlt_z_z8_b2bf" "ZUInteger.H, ZUInteger.B" (("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(pacm
  (c0
    (()
      ("PACM_HI_hints" "" ())
    )
  )
)

(ldsmaxah
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXAH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(ptest
  (c2
    ((sve-p sve-p)
      ("ptest__p_p_" "PUInteger, PUInteger.B" (("Pg" (reg-range 0 15)) ("Pn" (reg-range 0 15))))
    )
  )
)

(svdot
  (c1
    ((sme-za)
      ("svdot_za32_zzi_2xi" "ZA.S[WUInteger, UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("svdot_za_zzi_s4xi" "ZA.S[WUInteger, UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
      ("svdot_za_zzi_d4xi" "ZA.D[WUInteger, UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(rcwsclral
  (c2m
    ((gpr-64 gpr-64 memory)
      ("RCWSCLRAL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sxth
  (c3
    ((sve-z sve-p sve-z)
      ("sxth_z_p_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("sxth_z_p_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ld3b
  (c2m
    ((reg-list sve-p memory)
      ("ld3b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("ld3b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger/Z, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(fmulx
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fmulx_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMULX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMULX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMULX_asimdelem_RH_H" "VUInteger.4H, VUInteger.4H, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMULX_asimdelem_R_SD" "VUInteger.2S, VUInteger.2S, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-vector)
      ("FMULX_asisdelem_RH_H" "HUInteger, HUInteger, VUInteger.H[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMULX_asisdelem_R_SD" "SUInteger, SUInteger, VUInteger.S[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FMULX_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMULX_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldapur
  (c1m
    ((gpr-32 memory)
      ("LDAPUR_32_ldapstl_unscaled" "WZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((simd-scalar memory)
      ("LDAPUR_B_ldapstl_simd" "BUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDAPUR_Q_ldapstl_simd" "QUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDAPUR_H_ldapstl_simd" "HUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDAPUR_S_ldapstl_simd" "SUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDAPUR_D_ldapstl_simd" "DUInteger, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-64 memory)
      ("LDAPUR_64_ldapstl_unscaled" "XZR, [SP]" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(fmov
  (c2
    ((simd-vector immediate)
      ("FMOV_asimdimm_S_s" "VUInteger.2S, SInteger" (("Rd" (reg-range 0 31))))
      ("FMOV_asimdimm_H_h" "VUInteger.4H, SInteger" (("Rd" (reg-range 0 31))))
      ("FMOV_asimdimm_D2_d" "VUInteger.2D, SInteger" (("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-32)
      ("FMOV_S32_float2int" "SUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_H32_float2int" "HUInteger, WZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector gpr-64)
      ("FMOV_V64I_float2int" "VUInteger.D[1], XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar immediate)
      ("FMOV_S_floatimm" "SUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
      ("FMOV_D_floatimm" "DUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
      ("FMOV_H_floatimm" "HUInteger, SInteger" (("imm8" (imm-range 0 255 1)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar gpr-64)
      ("FMOV_D64_float2int" "DUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_H64_float2int" "HUInteger, XZR" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-vector)
      ("FMOV_64VX_float2int" "XZR, VUInteger.D[1]" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar)
      ("FMOV_S_floatdp1" "SUInteger, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_D_floatdp1" "DUInteger, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_H_floatdp1" "HUInteger, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 simd-scalar)
      ("FMOV_32S_float2int" "WZR, SUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_32H_float2int" "WZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 simd-scalar)
      ("FMOV_64D_float2int" "XZR, DUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMOV_64H_float2int" "XZR, HUInteger" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(addva
  (c4
    ((sme-za sve-p sve-p sve-z)
      ("addva_za_pp_z_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("addva_za_pp_z_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.D" (("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(umops
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("umops_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("umops_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("umops_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(usubwt
  (c3
    ((sve-z sve-z sve-z)
      ("usubwt_z_zz_" "ZUInteger.H, ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(addpl
  (c3
    ((gpr-64 gpr-64 immediate)
      ("addpl_r_ri_" "SP, SP, SInteger" (("Rn" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(retaa
  (c0
    (()
      ("RETAA_64E_branch_reg" "" ())
    )
  )
)

(ldrb
  (c1m1
    ((gpr-32 memory pre-index)
      ("LDRB_32_ldst_immpre" "WZR, [SP SInteger], !" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 memory immediate)
      ("LDRB_32_ldst_immpost" "WZR, [SP], SInteger" (("imm9" (imm-range 0 511 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
  (c1m
    ((gpr-32 memory)
      ("LDRB_32B_ldst_regoff" "WZR, [SP WZR UXTW]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRB_32BL_ldst_regoff" "WZR, [SP XZR]" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
      ("LDRB_32_ldst_pos" "WZR, [SP]" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uminp
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("uminp_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("UMINP_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(sqrshrnt
  (c3
    ((sve-z sve-z immediate)
      ("sqrshrnt_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(ushllb
  (c3
    ((sve-z sve-z immediate)
      ("ushllb_z_zi_" "ZUInteger.H, ZUInteger.B, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bfcvtn
  (c2
    ((simd-vector simd-vector)
      ("BFCVTN_asimdmisc_4S" "VUInteger.4H, VUInteger.4S" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z reg-list)
      ("bfcvtn_z8_mz2_bf2b" "ZUInteger.B, {Z UInteger .H- Z UInteger .H}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
      ("bfcvtn_z_mz2_" "ZUInteger.H, {Z UInteger .S- Z UInteger .S}" (("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 31))))
    )
  )
)

(raddhn
  (c3
    ((simd-vector simd-vector simd-vector)
      ("RADDHN_asimddiff_N" "VUInteger.8B, VUInteger.8H, VUInteger.8H" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(st64bv0
  (c2m
    ((gpr-64 gpr-64 memory)
      ("ST64BV0_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(movn
  (c2
    ((gpr-64 immediate)
      ("MOVN_64_movewide" "XZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 immediate)
      ("MOVN_32_movewide" "WZR, UInteger" (("imm16" (imm-range 0 65535 1)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fminnmqv
  (c3
    ((simd-vector sve-p sve-z)
      ("fminnmqv_z_p_z_" "VUInteger.8H, PUInteger, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Vd" (reg-range 0 31))))
    )
  )
)

(ldumaxlh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDUMAXLH_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(pfalse
  (c1
    ((sve-p)
      ("pfalse_p_" "PUInteger.B" (("Pd" (reg-range 0 15))))
    )
  )
)

(ldaddb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDADDB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(add
  (c5
    ((gpr-64 gpr-64 gpr-32 keyword immediate)
      ("ADD_64_addsub_ext" "SP, SP, WZR, UXTB, UInteger" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32 keyword immediate)
      ("ADD_32_addsub_shift" "WZR, WZR, WZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-64 gpr-64 gpr-64 keyword immediate)
      ("ADD_64_addsub_shift" "XZR, XZR, XZR, LSL, UInteger" (("shift" (imm-range 0 3 1)) ("Rm" (reg-range 0 31)) ("imm6" (imm-range 0 63 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("add_z_p_zz_" "ZUInteger.B, PUInteger/M, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c1m1
    ((sme-za memory reg-list)
      ("add_za_zw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("add_za_zw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
  (c3
    ((gpr-64 gpr-64 immediate)
      ("ADD_64_addsub_imm" "SP, SP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z immediate)
      ("add_z_zi_" "ZUInteger.B, ZUInteger.B, UInteger" (("size" (element-size B H S D)) ("imm8" (imm-range 0 255 1)) ("Zdn" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 immediate)
      ("ADD_32_addsub_imm" "WSP, WSP, UInteger" (("imm12" (imm-range 0 4095 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector simd-vector)
      ("ADD_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 gpr-32)
      ("ADD_32_addsub_ext" "WSP, WSP, WZR" (("Rm" (reg-range 0 31)) ("imm3" (imm-range 0 7 1)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list sve-z)
      ("add_mz_zzv_2x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("add_mz_zzv_4x1" "{Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("ADD_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("add_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("add_za_zzv_2x1" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
      ("add_za_zzv_4x1" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, ZUInteger.S" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off3" (imm-range 0 7 1))))
    )
    ((sme-za memory reg-list reg-list)
      ("add_za_zzw_2x2" "ZA.S, [W UInteger UInteger VGx2], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15)) ("off3" (imm-range 0 7 1))))
      ("add_za_zzw_4x4" "ZA.S, [W UInteger UInteger VGx4], {Z UInteger . S - Z UInteger . S}, {Z UInteger . S - Z UInteger . S}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7)) ("off3" (imm-range 0 7 1))))
    )
  )
)

(fmlalltt
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FMLALLTT_asimdsame2_G" "VUInteger.4S, VUInteger.16B, VUInteger.16B" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FMLALLTT_asimdelem_J" "VUInteger.4S, VUInteger.16B, VUInteger.B[UInteger]" (("Rm" (reg-range 0 15)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("fmlalltt_z32_z8z8z8_" "ZUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
      ("fmlalltt_z32_z8z8z8i_" "ZUInteger.S, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zda" (reg-range 0 31))))
    )
  )
)

(cpyp
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYP_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(setet
  (c0m2
    ((memory gpr-64 gpr-64)
      ("SETET_SET_memcms" "[XZR]!, XZR!, XZR" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(zip1
  (c3
    ((sve-p sve-p sve-p)
      ("zip1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("ZIP1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("zip1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("zip1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(blraa
  (c2
    ((gpr-64 gpr-64)
      ("BLRAA_64P_branch_reg" "XZR, SP" (("Rn" (reg-range 0 31)) ("Rm" (reg-range 0 31))))
    )
  )
)

(st4b
  (c2m
    ((reg-list sve-p memory)
      ("st4b_z_p_br_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP X UInteger]" (("Rm" (reg-range 0 31)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
      ("st4b_z_p_bi_contiguous" "{Z UInteger .B Z UInteger .B Z UInteger .B Z UInteger .B}, PUInteger, [SP]" (("imm4" (imm-range 0 15 1)) ("Pg" (reg-range 0 7)) ("Rn" (reg-range 0 31)) ("Zt" (reg-range 0 31))))
    )
  )
)

(revh
  (c3
    ((sve-z sve-p sve-z)
      ("revh_z_z_m" "ZUInteger.S, PUInteger/M, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("revh_z_z_z" "ZUInteger.S, PUInteger/Z, ZUInteger.S" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bfscale
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("bfscale_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((reg-list reg-list sve-z)
      ("bfscale_mz_zzv_2x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfscale_mz_zzv_4x1" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 7))))
    )
    ((reg-list reg-list reg-list)
      ("bfscale_mz_zzw_2x2" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("bfscale_mz_zzw_4x4" "{Z UInteger .H- Z UInteger . H}, {Z UInteger . H- Z UInteger .H}, {Z UInteger . H- Z UInteger . H}" (("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(ldsmaxab
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSMAXAB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sunpkhi
  (c2
    ((sve-z sve-z)
      ("sunpkhi_z_z_" "ZUInteger.H, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smlsll
  (c1
    ((sme-za)
      ("smlsll_za_zzi_s" "ZA.S[WUInteger, UInteger:UInteger, ZUInteger.B, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlsll_za_zzi_d" "ZA.D[WUInteger, UInteger:UInteger, ZUInteger.H, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
      ("smlsll_za_zzi_s2xi" "ZA.S[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlsll_za_zzi_d2xi" "ZA.D[WUInteger, UInteger:UInteger, VGx2, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlsll_za_zzi_s4xi" "ZA.S[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .B- Z UInteger .B}, ZUInteger.B[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
      ("smlsll_za_zzi_d4xi" "ZA.D[WUInteger, UInteger:UInteger, VGx4, {Z UInteger .H- Z UInteger .H}, ZUInteger.H[UInteger" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 7))))
    )
  )
  (c1m2
    ((sme-za memory reg-list sve-z)
      ("smlsll_za_zzv_2x1" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
      ("smlsll_za_zzv_4x1" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31))))
    )
    ((sme-za memory reg-list reg-list)
      ("smlsll_za_zzw_2x2" "ZA.S, [W UInteger UInteger : UInteger VGx2], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 15))))
      ("smlsll_za_zzw_4x4" "ZA.S, [W UInteger UInteger : UInteger VGx4], {Z UInteger . B - Z UInteger . B}, {Z UInteger . B - Z UInteger . B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za memory sve-z sve-z)
      ("smlsll_za_zzv_1" "ZA.S, [W UInteger UInteger : UInteger], ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 15)) ("Zn" (reg-range 0 31)) ("off2" (imm-range 0 3 1))))
    )
  )
)

(stltxr
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STLTXR_SR32_ldstexclr_unpriv" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-64 memory)
      ("STLTXR_SR64_ldstexclr_unpriv" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(sqrshrunb
  (c3
    ((sve-z sve-z immediate)
      ("sqrshrunb_z_zi_" "ZUInteger.B, ZUInteger.H, UInteger" (("imm3" (imm-range 0 7 1)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(bmopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("bmopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.S, ZUInteger.S" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(ldsmaxl
  (c2m
    ((gpr-64 gpr-64 memory)
      ("LDSMAXL_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("LDSMAXL_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(famax
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("famax_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FAMAX_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FAMAX_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((reg-list reg-list reg-list)
      ("famax_mz_zzw_2x2" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 15)) ("Zdn" (reg-range 0 15))))
      ("famax_mz_zzw_4x4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}, {Z UInteger . H - Z UInteger . H}" (("size" (element-size B H S D)) ("Zm" (reg-range 0 7)) ("Zdn" (reg-range 0 7))))
    )
  )
)

(cmhs
  (c3
    ((simd-vector simd-vector simd-vector)
      ("CMHS_asimdsame_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("CMHS_asisdsame_only" "DUInteger, DUInteger, DUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(stxr
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STXR_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-64 memory)
      ("STXR_SR64_ldstexclr" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(setgoetn
  (c0m1
    ((memory gpr-64)
      ("SETGOETN_memset_go" "[XZR]!, XZR!" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(swp
  (c2m
    ((gpr-64 gpr-64 memory)
      ("SWP_64_memop" "XZR, XZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-32 memory)
      ("SWP_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(stlxr
  (c2m
    ((gpr-32 gpr-32 memory)
      ("STLXR_SR32_ldstexclr" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
    ((gpr-32 gpr-64 memory)
      ("STLXR_SR64_ldstexclr" "WZR, XZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(uclamp
  (c3
    ((reg-list sve-z sve-z)
      ("uclamp_mz_zz_2" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
      ("uclamp_mz_zz_4" "{Z UInteger . B - Z UInteger . B}, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 7))))
    )
    ((sve-z sve-z sve-z)
      ("uclamp_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(smopa
  (c5
    ((sme-za sve-p sve-p sve-z sve-z)
      ("smopa_za_pp_zz_32" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("smopa_za32_pp_zz_16" "ZAUInteger.S, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
      ("smopa_za_pp_zz_64" "ZAUInteger.D, PUInteger/M, PUInteger/M, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 31)) ("Pm" (reg-range 0 7)) ("Pn" (reg-range 0 7)) ("Zn" (reg-range 0 31))))
    )
  )
)

(autdzb
  (c1
    ((gpr-64)
      ("AUTDZB_64Z_dp_1src" "XZR" (("Rd" (reg-range 0 31))))
    )
  )
)

(sha256h2
  (c3
    ((simd-scalar simd-scalar simd-vector)
      ("SHA256H2_QQV_cryptosha3" "QUInteger, QUInteger, VUInteger.4S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(uzp1
  (c3
    ((sve-p sve-p sve-p)
      ("uzp1_p_pp_" "PUInteger.B, PUInteger.B, PUInteger.B" (("size" (element-size B H S D)) ("Pm" (reg-range 0 15)) ("Pn" (reg-range 0 15)) ("Pd" (reg-range 0 15))))
    )
    ((simd-vector simd-vector simd-vector)
      ("UZP1_asimdperm_only" "VUInteger.8B, VUInteger.8B, VUInteger.8B" (("size" (element-size B H S D)) ("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z sve-z)
      ("uzp1_z_zz_q" "ZUInteger.Q, ZUInteger.Q, ZUInteger.Q" (("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
      ("uzp1_z_zz_" "ZUInteger.B, ZUInteger.B, ZUInteger.B" (("size" (element-size B H S D)) ("Zm" (reg-range 0 31)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 31))))
    )
  )
)

(cpypwt
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYPWT_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(fabd
  (c4
    ((sve-z sve-p sve-z sve-z)
      ("fabd_z_p_zz_" "ZUInteger.H, PUInteger/M, ZUInteger.H, ZUInteger.H" (("size" (element-size B H S D)) ("Pg" (reg-range 0 7)) ("Zm" (reg-range 0 31)) ("Zdn" (reg-range 0 31))))
    )
  )
  (c3
    ((simd-vector simd-vector simd-vector)
      ("FABD_asimdsamefp16_only" "VUInteger.4H, VUInteger.4H, VUInteger.4H" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FABD_asimdsame_only" "VUInteger.2S, VUInteger.2S, VUInteger.2S" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-scalar simd-scalar simd-scalar)
      ("FABD_asisdsamefp16_only" "HUInteger, HUInteger, HUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
      ("FABD_asisdsame_only" "SUInteger, SUInteger, SUInteger" (("Rm" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cmlt
  (c3
    ((simd-scalar simd-scalar immediate)
      ("CMLT_asisdmisc_Z" "DUInteger, DUInteger, 0" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((simd-vector simd-vector immediate)
      ("CMLT_asimdmisc_Z" "VUInteger.8B, VUInteger.8B, 0" (("size" (element-size B H S D)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(cpyfmtwn
  (c0m3
    ((memory memory pre-index gpr-64)
      ("CPYFMTWN_CPY_memcms" "[XZR]!, [XZR], !, XZR!" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
  )
)

(ldsetalb
  (c2m
    ((gpr-32 gpr-32 memory)
      ("LDSETALB_32_memop" "WZR, WZR, [SP]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

(smop4a
  (c3
    ((sme-za reg-list sve-z)
      ("smop4a_za_zz_b2x1" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za32_zz_h2x1" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za_zz_h2x1" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za reg-list reg-list)
      ("smop4a_za_zz_b2x2" "ZAUInteger.S, {Z UInteger .B- Z UInteger .B}, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za32_zz_h2x2" "ZAUInteger.S, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za_zz_h2x2" "ZAUInteger.D, {Z UInteger .H- Z UInteger .H}, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z sve-z)
      ("smop4a_za_zz_b1x1" "ZAUInteger.S, ZUInteger.B, ZUInteger.B" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za32_zz_h1x1" "ZAUInteger.S, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za_zz_h1x1" "ZAUInteger.D, ZUInteger.H, ZUInteger.H" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
    ((sme-za sve-z reg-list)
      ("smop4a_za_zz_b1x2" "ZAUInteger.S, ZUInteger.B, {Z UInteger .B- Z UInteger .B}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za32_zz_h1x2" "ZAUInteger.S, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
      ("smop4a_za_zz_h1x2" "ZAUInteger.D, ZUInteger.H, {Z UInteger .H- Z UInteger .H}" (("Zm" (reg-range 0 7)) ("Zn" (reg-range 0 7))))
    )
  )
)

(uunpk
  (c2
    ((reg-list reg-list)
      ("uunpk_mz_z_4" "{Z UInteger . H - Z UInteger . H}, {Z UInteger . B - Z UInteger . B}" (("size" (element-size B H S D)) ("Zn" (reg-range 0 15)) ("Zd" (reg-range 0 7))))
    )
    ((reg-list sve-z)
      ("uunpk_mz_z_2" "{Z UInteger . H - Z UInteger . H}, ZUInteger.B" (("size" (element-size B H S D)) ("Zn" (reg-range 0 31)) ("Zd" (reg-range 0 15))))
    )
  )
)

(aesmc
  (c2
    ((simd-vector simd-vector)
      ("AESMC_B_cryptoaes" "VUInteger.16B, VUInteger.16B" (("Rn" (reg-range 0 31)) ("Rd" (reg-range 0 31))))
    )
    ((sve-z sve-z)
      ("aesmc_z_z_" "ZUInteger.B, ZUInteger.B" (("Zdn" (reg-range 0 31))))
    )
  )
)

(casalh
  (c2m
    ((gpr-32 gpr-32 memory)
      ("CASALH_C32_comswap" "WZR, WZR, [SP 0]" (("Rs" (reg-range 0 31)) ("Rn" (reg-range 0 31)) ("Rt" (reg-range 0 31))))
    )
  )
)

