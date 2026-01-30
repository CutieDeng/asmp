;; ============================================================
;; alias-transforms.rktd - 别名转换规则
;; ============================================================
;;
;; 生成: racket syntax/gen-alias-signatures.rkt
;;

(ngc ((c2 (gpr-64 gpr-64)) sbc (0 (zr 64) 1)) ((c2 (gpr-32 gpr-32)) sbc (0 (zr 32) 1)))

(orr ((c3 (gpr-32 gpr-32 gpr-32)) orr (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) orr (0 1 2 (const lsl) (const 0))))

(eor ((c3 (gpr-32 gpr-32 gpr-32)) eor (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) eor (0 1 2 (const lsl) (const 0))))

(cmp ((c2 (gpr-32 gpr-32)) subs ((zr 32) 0 1 (const lsl) (const 0))) ((c2 (gpr-32 immediate)) subs ((zr 32) 0 1)) ((c2 (gpr-64 immediate)) subs ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) subs ((zr 64) 0 1 (const lsl) (const 0))))

(subs ((c3 (gpr-64 gpr-64 gpr-64)) subs (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) subs (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-32)) subs (0 1 2 (const lsl) (const 0))))

(orn ((c3 (gpr-32 gpr-32 gpr-32)) orn (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) orn (0 1 2 (const lsl) (const 0))))

(cmn ((c2 (gpr-64 immediate)) adds ((zr 64) 0 1)) ((c2 (gpr-32 immediate)) adds ((zr 32) 0 1)) ((c2 (gpr-32 gpr-32)) adds ((zr 32) 0 1 (const lsl) (const 0))) ((c2 (gpr-64 gpr-64)) adds ((zr 64) 0 1 (const lsl) (const 0))))

(tst ((c2 (gpr-32 immediate)) ands ((zr 32) 0 1)) ((c2 (gpr-32 gpr-32)) ands ((zr 32) 0 1 (const lsl) (const 0))) ((c2 (gpr-64 immediate)) ands ((zr 64) 0 1)) ((c2 (gpr-64 gpr-64)) ands ((zr 64) 0 1 (const lsl) (const 0))))

(negs ((c2 (gpr-32 gpr-32)) subs (0 (zr 32) 1 (const lsl) (const 0))) ((c2 (gpr-64 gpr-64)) subs (0 (zr 64) 1 (const lsl) (const 0))))

(add ((c3 (gpr-64 gpr-64 gpr-32)) add (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) add (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) add (0 1 2 (const lsl) (const 0))))

(adds ((c3 (gpr-64 gpr-64 gpr-64)) adds (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-32)) adds (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) adds (0 1 2 (const lsl) (const 0))))

(and ((c3 (gpr-64 gpr-64 gpr-64)) and (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) and (0 1 2 (const lsl) (const 0))))

(mvn ((c2 (gpr-64 gpr-64)) orn (0 (zr 64) 1 (const lsl) (const 0))) ((c2 (gpr-32 gpr-32)) orn (0 (zr 32) 1 (const lsl) (const 0))))

(mul ((c3 (gpr-32 gpr-32 gpr-32)) madd (0 1 2 (zr 32))) ((c3 (gpr-64 gpr-64 gpr-64)) madd (0 1 2 (zr 64))))

(mov ((c2 (gpr-64 gpr-64)) orr (0 (zr 64) 1 (const lsl) (const 0))) ((c2 (gpr-32 gpr-32)) orr (0 (zr 32) 1 (const lsl) (const 0))) ((c2 (gpr-64 immediate)) movz (0 1)) ((c2 (gpr-32 immediate)) movz (0 1)))

(ngcs ((c2 (gpr-64 gpr-64)) sbcs (0 (zr 64) 1)) ((c2 (gpr-32 gpr-32)) sbcs (0 (zr 32) 1)))

(mneg ((c3 (gpr-64 gpr-64 gpr-64)) msub (0 1 2 (zr 64))) ((c3 (gpr-32 gpr-32 gpr-32)) msub (0 1 2 (zr 32))))

(eon ((c3 (gpr-64 gpr-64 gpr-64)) eon (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) eon (0 1 2 (const lsl) (const 0))))

(sub ((c3 (gpr-64 gpr-64 gpr-32)) sub (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) sub (0 1 2 (const lsl) (const 0))) ((c3 (gpr-32 gpr-32 gpr-32)) sub (0 1 2 (const lsl) (const 0))))

(bics ((c3 (gpr-32 gpr-32 gpr-32)) bics (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) bics (0 1 2 (const lsl) (const 0))))

(bic ((c3 (gpr-32 gpr-32 gpr-32)) bic (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) bic (0 1 2 (const lsl) (const 0))))

(ands ((c3 (gpr-32 gpr-32 gpr-32)) ands (0 1 2 (const lsl) (const 0))) ((c3 (gpr-64 gpr-64 gpr-64)) ands (0 1 2 (const lsl) (const 0))))

(neg ((c2 (gpr-32 gpr-32)) sub (0 (zr 32) 1 (const lsl) (const 0))) ((c2 (gpr-64 gpr-64)) sub (0 (zr 64) 1 (const lsl) (const 0))))

