;; ============================================================
;; alias-transforms.rktd - 别名转换规则
;; ============================================================
;;
;; 生成: racket syntax/gen-alias-signatures.rkt
;; 数据来源: MRS Instructions.json
;;

(stumaxl ((c2 (gpr-32 gpr-64)) ldumaxl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldumaxl ((zr 64) 0 1)))

(stuminh ((c2 (gpr-32 gpr-64)) lduminh ((zr 64) 0 1)))

(stclrb ((c2 (gpr-32 gpr-64)) ldclrb ((zr 64) 0 1)))

(not ((c3 (sve-p sve-p sve-p)) eor (0 2 2 2)))

(cinc ((c2 (gpr-32 gpr-64)) csinc (0 0 (zr 32) 2)) ((c2 (gpr-64 gpr-64)) csinc (0 0 (zr 64) 2)))

(umull ((c3 (gpr-64 gpr-32 gpr-32)) umaddl (0 1 2 (zr 64))))

(mul ((c3 (gpr-32 gpr-32 gpr-32)) madd (0 1 2 (zr 32))) ((c3 (gpr-64 gpr-64 gpr-64)) madd (0 1 2 (zr 64))))

(ngcs ((c2 (gpr-32 gpr-32)) sbcs (0 (zr 32) 1)) ((c2 (gpr-64 gpr-64)) sbcs (0 (zr 64) 1)))

(asr ((c4 (gpr-32 gpr-32 immediate keyword)) sbfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate keyword)) sbfm (0 1 (const 0) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) asrv (0 1 2)) ((c3 (gpr-64 gpr-64 gpr-64)) asrv (0 1 2)))

(stsetl ((c2 (gpr-32 gpr-64)) ldsetl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldsetl ((zr 64) 0 1)))

(faclt ((c4 (sve-p sve-p sve-z sve-z)) facgt (0 5 3 3)))

(dc ((c1 (gpr-64)) sys ((const 0) 1 1 (const 0))))

(lsl ((c4 (gpr-32 gpr-32 immediate keyword)) ubfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate keyword)) ubfm (0 1 (const 0) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) lslv (0 1 2)) ((c3 (gpr-64 gpr-64 gpr-64)) lslv (0 1 2)))

(stsmax ((c2 (gpr-32 gpr-64)) ldsmax ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldsmax ((zr 64) 0 1)))

(steorh ((c2 (gpr-32 gpr-64)) ldeorh ((zr 64) 0 1)))

(trcit ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(cset ((c1 (gpr-32)) csinc (0 (zr 32) (zr 32) 1)) ((c1 (gpr-64)) csinc (0 (zr 64) (zr 64) 1)))

(uxth ((c2 (gpr-32 gpr-32)) ubfm (0 1 (const 0) (const 0))))

(gcsss2 ((c1 (gpr-64)) sysl ((zr 64) (const 0) 0 0 (const 0))))

(staddh ((c2 (gpr-32 gpr-64)) ldaddh ((zr 64) 0 1)))

(cbls ((c3 (gpr-32 gpr-32 immediate)) cbhs ((zr 32) (zr 32) 0)) ((c3 (gpr-64 gpr-64 immediate)) cbhs ((zr 64) (zr 64) 0)) ((c4 (gpr-32 immediate immediate immediate)) cblo ((zr 32) (const 0) 2)) ((c4 (gpr-64 immediate immediate immediate)) cblo ((zr 64) (const 0) 2)))

(cmple ((c4 (sve-p sve-p sve-z sve-z)) cmpge (0 5 3 3)))

(cbble ((c3 (gpr-32 gpr-32 immediate)) cbbge ((zr 32) (zr 32) 0)))

(ror ((c4 (gpr-32 gpr-64 immediate keyword)) extr (0 0 (zr 32) (const 0))) ((c4 (gpr-64 gpr-64 immediate keyword)) extr (0 0 (zr 64) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) rorv (0 1 2)) ((c3 (gpr-64 gpr-64 gpr-64)) rorv (0 1 2)))

(mvn ((c3 (gpr-32 gpr-32 keyword)) orn (0 (zr 32) 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) orn (0 (zr 64) 1 0 (const 0))) ((c2 (simd-v simd-v)) not (0 2)))

(ubfx ((c4 (gpr-32 gpr-32 immediate immediate)) ubfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) ubfm (0 1 (const 0) (const 0))))

(stset ((c2 (gpr-32 gpr-64)) ldset ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldset ((zr 64) 0 1)))

(stsmaxlh ((c2 (gpr-32 gpr-64)) ldsmaxlh ((zr 64) 0 1)))

(pssbb ((c0 ()) dsb ()))

(sttsetl ((c2 (gpr-32 gpr-64)) ldtsetl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtsetl ((zr 64) 0 1)))

(cblt ((c3 (gpr-32 gpr-32 immediate)) cbgt ((zr 32) (zr 32) 0)) ((c3 (gpr-64 gpr-64 immediate)) cbgt ((zr 64) (zr 64) 0)))

(stclr ((c2 (gpr-32 gpr-64)) ldclr ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldclr ((zr 64) 0 1)))

(stumaxlb ((c2 (gpr-32 gpr-64)) ldumaxlb ((zr 64) 0 1)))

(cosp ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(ubfiz ((c4 (gpr-32 gpr-32 immediate immediate)) ubfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) ubfm (0 1 (const 0) (const 0))))

(stseth ((c2 (gpr-32 gpr-64)) ldseth ((zr 64) 0 1)))

(csetm ((c1 (gpr-32)) csinv (0 (zr 32) (zr 32) 1)) ((c1 (gpr-64)) csinv (0 (zr 64) (zr 64) 1)))

(orn ((c4 (sve-z sve-z immediate immediate)) orr (2 1 (const 0))))

(stuminl ((c2 (gpr-32 gpr-64)) lduminl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) lduminl ((zr 64) 0 1)))

(stumaxlh ((c2 (gpr-32 gpr-64)) ldumaxlh ((zr 64) 0 1)))

(cblo ((c3 (gpr-32 gpr-32 immediate)) cbhi ((zr 32) (zr 32) 0)) ((c3 (gpr-64 gpr-64 immediate)) cbhi ((zr 64) (zr 64) 0)))

(cpp ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(steorlh ((c2 (gpr-32 gpr-64)) ldeorlh ((zr 64) 0 1)))

(sbfx ((c4 (gpr-32 gpr-32 immediate immediate)) sbfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) sbfm (0 1 (const 0) (const 0))))

(sttset ((c2 (gpr-32 gpr-64)) ldtset ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtset ((zr 64) 0 1)))

(staddb ((c2 (gpr-32 gpr-64)) ldaddb ((zr 64) 0 1)))

(steor ((c2 (gpr-32 gpr-64)) ldeor ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldeor ((zr 64) 0 1)))

(bic ((c4 (sve-z sve-z immediate immediate)) and (2 1 (const 0))))

(stsminl ((c2 (gpr-32 gpr-64)) ldsminl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldsminl ((zr 64) 0 1)))

(stsmaxb ((c2 (gpr-32 gpr-64)) ldsmaxb ((zr 64) 0 1)))

(bfi ((c4 (gpr-32 gpr-32 immediate immediate)) bfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) bfm (0 1 (const 0) (const 0))))

(gcspopx ((c4 (immediate immediate immediate immediate)) sys (0 1 2 3)))

(stsminb ((c2 (gpr-32 gpr-64)) ldsminb ((zr 64) 0 1)))

(cmplo ((c4 (sve-p sve-p sve-z sve-z)) cmphi (0 5 3 3)))

(sxtw ((c2 (gpr-64 gpr-32)) sbfm (0 1 (const 0) (const 0))))

(steorb ((c2 (gpr-32 gpr-64)) ldeorb ((zr 64) 0 1)))

(mov ((c2 (sve-z sve-z)) orr (0 1 0)) ((c3 (sve-z immediate immediate)) dupm (0 (const 0))) ((c5 (sve-z sve-p immediate immediate keyword)) cpy (0 2 2)) ((c2 (sve-z simd-v)) dup (0 0)) ((c3 (sve-z sve-z immediate)) dup (0 2)) ((c2 (sve-z gpr-64)) dup (0 0)) ((c3 (sve-z sve-p simd-v)) cpy (0 2 2)) ((c3 (sve-z sve-p gpr-64)) cpy (0 0 2)) ((c3 (sve-z sve-p sve-z)) sel (0 3 0 0)) ((c3 (sve-p sve-p sve-p)) and (0 2 2 2)) ((c2 (sve-p sve-p)) orr (0 1 1 1)) ((c3 (sve-p sve-p sve-p)) sel (0 2 2 2)) ((c4 (sve-z immediate immediate keyword)) dup (0 1)) ((c4 (gpr-32 immediate sve-p sve-z)) mova (0 4 4 3)) ((c5 (sve-z gpr-32 immediate sve-p sve-z)) mova (0 5 5 3)) ((c5 (gpr-32 immediate immediate sve-z sve-z)) mova (0 0 2)) ((c6 (sve-z gpr-32 immediate immediate sve-z sve-z)) mova (0 0 2)) ((c4 (gpr-32 immediate sve-z sve-z)) mova (0 0 2 3)) ((c4 (sve-z sve-p gpr-32 immediate)) mova (0 1 0 (const 0))) ((c5 (sve-z sve-p sve-z gpr-32 immediate)) mova (0 1 0 (const 0))) ((c5 (sve-z sve-p sve-z gpr-32 immediate)) mova (0 1 0 3)) ((c5 (sve-z sve-z gpr-32 immediate immediate)) mova (0 0 (const 0))) ((c6 (sve-z sve-z sve-z gpr-32 immediate immediate)) mova (0 0 (const 0))) ((c6 (sve-z sve-z sve-z gpr-32 immediate immediate)) mova (0 0 2)) ((c4 (sve-z sve-z gpr-32 immediate)) mova (0 0 (const 0) 3)) ((c2 (gpr-32 gpr-32)) add (0 0 (const 0))) ((c2 (gpr-64 gpr-64)) add (0 0 (const 0))) ((c3 (gpr-32 immediate immediate)) orr (0 (zr 32) (const 0))) ((c3 (gpr-64 immediate immediate)) orr (0 (zr 64) (const 0))) ((c2 (gpr-32 immediate)) movn (0 (const 0))) ((c2 (gpr-32 immediate)) movz (0 (const 0))) ((c2 (gpr-64 immediate)) movn (0 (const 0))) ((c2 (gpr-64 immediate)) movz (0 (const 0))) ((c2 (gpr-32 gpr-32)) orr (0 (zr 32) 1 (const lsl) (const 0))) ((c2 (gpr-64 gpr-64)) orr (0 (zr 64) 1 (const lsl) (const 0))) ((c3 (simd-v simd-v immediate)) dup (1 2)) ((c2 (gpr-32 simd-v)) umov (0 1)) ((c4 (simd-v immediate gpr-64 gpr-64)) ins (0 4)) ((c2 (gpr-64 simd-v)) umov (0 1)) ((c4 (simd-v immediate simd-v immediate)) ins (0 3)) ((c2 (simd-v simd-v)) orr (0 2 2)))

(sttclr ((c2 (gpr-32 gpr-64)) ldtclr ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtclr ((zr 64) 0 1)))

(staddlb ((c2 (gpr-32 gpr-64)) ldaddlb ((zr 64) 0 1)))

(gcspushm ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(uxtl ((c2 (simd-v simd-v)) ushll (1 3 (const 0))))

(tlbip ((c4 (immediate immediate immediate immediate)) sysp ((const 0) 1 1 (const 0))))

(stuminb ((c2 (gpr-32 gpr-64)) lduminb ((zr 64) 0 1)))

(stsmin ((c2 (gpr-32 gpr-64)) ldsmin ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldsmin ((zr 64) 0 1)))

(fcmlt ((c4 (sve-p sve-p sve-z sve-z)) fcmgt (0 5 3 3)))

(cbhlo ((c3 (gpr-32 gpr-32 immediate)) cbhhi ((zr 32) (zr 32) 0)))

(cmpls ((c4 (sve-p sve-p sve-z sve-z)) cmphs (0 5 3 3)))

(cmp ((c4 (gpr-32 immediate immediate keyword)) subs ((zr 32) 0 (const 0))) ((c4 (gpr-64 immediate immediate keyword)) subs ((zr 64) 0 (const 0))) ((c3 (gpr-32 gpr-32 keyword)) subs ((zr 32) 0 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) subs ((zr 64) 0 1 0 (const 0))) ((c2 (gpr-32 gpr-32)) subs ((zr 32) 0 1 2 (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) subs ((zr 64) 0 2 3 (const 0))))

(stclrh ((c2 (gpr-32 gpr-64)) ldclrh ((zr 64) 0 1)))

(negs ((c3 (gpr-32 gpr-32 keyword)) subs (0 (zr 32) 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) subs (0 (zr 64) 1 0 (const 0))))

(lsr ((c4 (gpr-32 gpr-32 immediate keyword)) ubfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate keyword)) ubfm (0 1 (const 0) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) lsrv (0 1 2)) ((c3 (gpr-64 gpr-64 gpr-64)) lsrv (0 1 2)))

(tlbi ((c4 (immediate immediate immediate immediate)) sys ((const 0) 1 1 (const 0))))

(stumaxb ((c2 (gpr-32 gpr-64)) ldumaxb ((zr 64) 0 1)))

(stumax ((c2 (gpr-32 gpr-64)) ldumax ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldumax ((zr 64) 0 1)))

(steorlb ((c2 (gpr-32 gpr-64)) ldeorlb ((zr 64) 0 1)))

(cmplt ((c4 (sve-p sve-p sve-z sve-z)) cmpgt (0 5 3 3)))

(apas ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(mneg ((c3 (gpr-32 gpr-32 gpr-32)) msub (0 1 2 (zr 32))) ((c3 (gpr-64 gpr-64 gpr-64)) msub (0 1 2 (zr 64))))

(stsmaxl ((c2 (gpr-32 gpr-64)) ldsmaxl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldsmaxl ((zr 64) 0 1)))

(cfp ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(movs ((c3 (sve-p sve-p sve-p)) ands (0 2 2 2)) ((c2 (sve-p sve-p)) orrs (0 1 1 1)))

(cbhs ((c4 (gpr-32 immediate immediate immediate)) cbhi ((zr 32) (const 0) 2)) ((c4 (gpr-64 immediate immediate immediate)) cbhi ((zr 64) (const 0) 2)))

(smull ((c3 (gpr-64 gpr-32 gpr-32)) smaddl (0 1 2 (zr 64))))

(gicr ((c1 (gpr-64)) sysl ((zr 64) (const 0) 1 1 (const 0))))

(at ((c1 (gpr-64)) sys ((const 0) 1 1 (const 0))))

(mlbi ((c4 (immediate immediate immediate immediate)) sys ((const 0) 1 1 (const 0))))

(cbbls ((c3 (gpr-32 gpr-32 immediate)) cbbhs ((zr 32) (zr 32) 0)))

(stuminlb ((c2 (gpr-32 gpr-64)) lduminlb ((zr 64) 0 1)))

(stsetlh ((c2 (gpr-32 gpr-64)) ldsetlh ((zr 64) 0 1)))

(smstart ((c1 (immediate)) msr (0 (const 0))))

(cmn ((c4 (gpr-32 immediate immediate keyword)) adds ((zr 32) 0 (const 0))) ((c4 (gpr-64 immediate immediate keyword)) adds ((zr 64) 0 (const 0))) ((c3 (gpr-32 gpr-32 keyword)) adds ((zr 32) 0 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) adds ((zr 64) 0 1 0 (const 0))) ((c2 (gpr-32 gpr-32)) adds ((zr 32) 0 1 2 (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) adds ((zr 64) 0 2 3 (const 0))))

(gcspopcx ((c4 (immediate immediate immediate immediate)) sys (0 1 2 3)))

(steorl ((c2 (gpr-32 gpr-64)) ldeorl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldeorl ((zr 64) 0 1)))

(gcsss1 ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(sxth ((c2 (gpr-32 gpr-32)) sbfm (0 1 (const 0) (const 0))) ((c2 (gpr-64 gpr-32)) sbfm (0 1 (const 0) (const 0))))

(stsminlb ((c2 (gpr-32 gpr-64)) ldsminlb ((zr 64) 0 1)))

(stclrlh ((c2 (gpr-32 gpr-64)) ldclrlh ((zr 64) 0 1)))

(fmov ((c3 (sve-z sve-p immediate)) cpy (0 2 2)) ((c4 (sve-z sve-p immediate immediate)) fcpy (0 2 2)) ((c2 (sve-z immediate)) dup (0 1)) ((c3 (sve-z immediate immediate)) fdup (0 1)))

(uxtb ((c2 (gpr-32 gpr-32)) ubfm (0 1 (const 0) (const 0))))

(plbi ((c4 (immediate immediate immediate immediate)) sys ((const 0) 1 1 (const 0))))

(stsmaxlb ((c2 (gpr-32 gpr-64)) ldsmaxlb ((zr 64) 0 1)))

(sttadd ((c2 (gpr-32 gpr-64)) ldtadd ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtadd ((zr 64) 0 1)))

(rev64 ((c2 (gpr-64 gpr-64)) rev (0 1)))

(sbfiz ((c4 (gpr-32 gpr-32 immediate immediate)) sbfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) sbfm (0 1 (const 0) (const 0))))

(staddlh ((c2 (gpr-32 gpr-64)) ldaddlh ((zr 64) 0 1)))

(ic ((c4 (immediate immediate immediate immediate)) sys ((const 0) 1 1 (const 0))))

(gcspopm ((c5 (gpr-64 immediate immediate immediate immediate)) sysl ((zr 32) (const 0) 0 0 (const 0))))

(cbblt ((c3 (gpr-32 gpr-32 immediate)) cbbgt ((zr 32) (zr 32) 0)))

(cmpp ((c2 (gpr-64 gpr-64)) subps ((zr 64) 0 0)))

(stsetlb ((c2 (gpr-32 gpr-64)) ldsetlb ((zr 64) 0 1)))

(cbge ((c4 (gpr-32 immediate immediate immediate)) cbgt ((zr 32) (const 0) 2)) ((c4 (gpr-64 immediate immediate immediate)) cbgt ((zr 64) (const 0) 2)))

(cbhle ((c3 (gpr-32 gpr-32 immediate)) cbhge ((zr 32) (zr 32) 0)))

(fcmle ((c4 (sve-p sve-p sve-z sve-z)) fcmge (0 5 3 3)))

(ngc ((c2 (gpr-32 gpr-32)) sbc (0 (zr 32) 1)) ((c2 (gpr-64 gpr-64)) sbc (0 (zr 64) 1)))

(tst ((c3 (gpr-32 immediate immediate)) ands ((zr 32) 0 (const 0))) ((c3 (gpr-64 immediate immediate)) ands ((zr 64) 0 (const 0))) ((c3 (gpr-32 gpr-32 keyword)) ands ((zr 32) 0 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) ands ((zr 64) 0 1 0 (const 0))))

(cble ((c3 (gpr-32 gpr-32 immediate)) cbge ((zr 32) (zr 32) 0)) ((c3 (gpr-64 gpr-64 immediate)) cbge ((zr 64) (zr 64) 0)) ((c4 (gpr-32 immediate immediate immediate)) cblt ((zr 32) (const 0) 2)) ((c4 (gpr-64 immediate immediate immediate)) cblt ((zr 64) (const 0) 2)))

(facle ((c4 (sve-p sve-p sve-z sve-z)) facge (0 5 3 3)))

(stclrl ((c2 (gpr-32 gpr-64)) ldclrl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldclrl ((zr 64) 0 1)))

(stumaxh ((c2 (gpr-32 gpr-64)) ldumaxh ((zr 64) 0 1)))

(stsminlh ((c2 (gpr-32 gpr-64)) ldsminlh ((zr 64) 0 1)))

(stclrlb ((c2 (gpr-32 gpr-64)) ldclrlb ((zr 64) 0 1)))

(stsetb ((c2 (gpr-32 gpr-64)) ldsetb ((zr 64) 0 1)))

(sttclrl ((c2 (gpr-32 gpr-64)) ldtclrl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtclrl ((zr 64) 0 1)))

(cbhls ((c3 (gpr-32 gpr-32 immediate)) cbhhs ((zr 32) (zr 32) 0)))

(staddl ((c2 (gpr-32 gpr-64)) ldaddl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldaddl ((zr 64) 0 1)))

(smnegl ((c3 (gpr-64 gpr-32 gpr-32)) smsubl (0 1 2 (zr 64))))

(sttaddl ((c2 (gpr-32 gpr-64)) ldtaddl ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldtaddl ((zr 64) 0 1)))

(stsmaxh ((c2 (gpr-32 gpr-64)) ldsmaxh ((zr 64) 0 1)))

(ssbb ((c0 ()) dsb ()))

(umnegl ((c3 (gpr-64 gpr-32 gpr-32)) umsubl (0 1 2 (zr 64))))

(neg ((c3 (gpr-32 gpr-32 keyword)) sub (0 (zr 32) 1 0 (const 0))) ((c3 (gpr-64 gpr-64 keyword)) sub (0 (zr 64) 1 0 (const 0))))

(sxtb ((c2 (gpr-32 gpr-32)) sbfm (0 1 (const 0) (const 0))) ((c2 (gpr-64 gpr-32)) sbfm (0 1 (const 0) (const 0))))

(nots ((c3 (sve-p sve-p sve-p)) eors (0 2 2 2)))

(gic ((c4 (immediate immediate immediate immediate)) sys ((const 0) 1 1 (const 0))))

(bfc ((c3 (gpr-32 immediate immediate)) bfm (0 (zr 32) (const 0) (const 0))) ((c3 (gpr-64 immediate immediate)) bfm (0 (zr 64) (const 0) (const 0))))

(cbhlt ((c3 (gpr-32 gpr-32 immediate)) cbhgt ((zr 32) (zr 32) 0)))

(stsminh ((c2 (gpr-32 gpr-64)) ldsminh ((zr 64) 0 1)))

(gcspushx ((c4 (immediate immediate immediate immediate)) sys (0 1 2 3)))

(cneg ((c2 (gpr-32 gpr-64)) csneg (0 0 (zr 32) 2)) ((c2 (gpr-64 gpr-64)) csneg (0 0 (zr 64) 2)))

(smstop ((c1 (immediate)) msr (0 (const 0))))

(cinv ((c2 (gpr-32 gpr-64)) csinv (0 0 (zr 32) 2)) ((c2 (gpr-64 gpr-64)) csinv (0 0 (zr 64) 2)))

(stuminlh ((c2 (gpr-32 gpr-64)) lduminlh ((zr 64) 0 1)))

(brb ((c4 (immediate immediate immediate immediate)) sys ((const 0) 0 0 (const 0))))

(eon ((c4 (sve-z sve-z immediate immediate)) eor (2 1 (const 0))))

(dvp ((c1 (gpr-64)) sys ((const 0) 0 0 (const 0))))

(gsb ((c4 (immediate immediate immediate immediate)) sys ((const 0) 0 0 (const 0))))

(cbblo ((c3 (gpr-32 gpr-32 immediate)) cbbhi ((zr 32) (zr 32) 0)))

(sxtl ((c2 (simd-v simd-v)) sshll (1 3 (const 0))))

(stadd ((c2 (gpr-32 gpr-64)) ldadd ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldadd ((zr 64) 0 1)))

(bfxil ((c4 (gpr-32 gpr-32 immediate immediate)) bfm (0 1 (const 0) (const 0))) ((c4 (gpr-64 gpr-64 immediate immediate)) bfm (0 1 (const 0) (const 0))))

(stumin ((c2 (gpr-32 gpr-64)) ldumin ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ldumin ((zr 64) 0 1)))

