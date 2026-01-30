;; ============================================================
;; alias-signatures.rktd - 别名签名定义
;; ============================================================
;;
;; 生成: racket syntax/gen-alias-signatures.rkt
;;

(ngc ((c2 (gpr-64 gpr-64)) (c2 (gpr-32 gpr-32))))

(orr ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(eor ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(cmp ((c2 (gpr-32 gpr-32)) (c2 (gpr-32 immediate)) (c2 (gpr-64 immediate)) (c2 (gpr-64 gpr-64))))

(subs ((c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-32))))

(orn ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(cmn ((c2 (gpr-64 immediate)) (c2 (gpr-32 immediate)) (c2 (gpr-32 gpr-32)) (c2 (gpr-64 gpr-64))))

(tst ((c2 (gpr-32 immediate)) (c2 (gpr-32 gpr-32)) (c2 (gpr-64 immediate)) (c2 (gpr-64 gpr-64))))

(negs ((c2 (gpr-32 gpr-32)) (c2 (gpr-64 gpr-64))))

(add ((c3 (gpr-64 gpr-64 gpr-32)) (c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(adds ((c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-64 gpr-64 gpr-32)) (c3 (gpr-32 gpr-32 gpr-32))))

(and ((c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-32 gpr-32 gpr-32))))

(mvn ((c2 (gpr-64 gpr-64)) (c2 (gpr-32 gpr-32))))

(mul ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(mov ((c2 (gpr-32 negimm)) (c2 (gpr-64 negimm)) (c2 (gpr-64 gpr-64)) (c2 (gpr-32 gpr-32)) (c2 (gpr-64 immediate)) (c2 (gpr-32 immediate))))

(ngcs ((c2 (gpr-64 gpr-64)) (c2 (gpr-32 gpr-32))))

(mneg ((c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-32 gpr-32 gpr-32))))

(eon ((c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-32 gpr-32 gpr-32))))

(sub ((c3 (gpr-64 gpr-64 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64)) (c3 (gpr-32 gpr-32 gpr-32))))

(bics ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(bic ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(ands ((c3 (gpr-32 gpr-32 gpr-32)) (c3 (gpr-64 gpr-64 gpr-64))))

(neg ((c2 (gpr-32 gpr-32)) (c2 (gpr-64 gpr-64))))

