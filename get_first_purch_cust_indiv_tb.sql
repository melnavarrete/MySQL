-- LEFT OUTER EXCLUDING JOIN example
-- Sales data report excluding privacy list - customers who opted out of sales/marketing tracking, aka "Do Not Track"

INSERT INTO `{{params.first_purch_cust_indiv_tb}}` (
    indiv_id,
    frst_nm,
    frst_prch_dt,
    loyal_lvl_desc_txt,
    gndr_cd,
    email_addr_txt
)
SELECT 
  a.indiv_id
  ,a.frst_nm 
  ,a.frst_prch_dt 
  ,a.loyal_lvl_desc_txt 
  ,(CASE WHEN b.gndr_cd IS NOT NULL THEN b.gndr_cd ELSE a.gndr_cd END) AS gndr_cd
  ,c.email_addr_txt
FROM 
  `{{params.individual_tbl_full_nm}}` a
LEFT JOIN `{{params.indiv_ib_demographics_view_full_nm}}` b ON a.indiv_id = b.indiv_id
JOIN (
  SELECT email_addr_txt, max(indiv_id) AS indiv_id_max
  FROM `{{params.rto_best_email_for_indiv_tbl_full_nm}}`
  GROUP BY email_addr_txt
  HAVING count(DISTINCT indiv_id) = 1
) c ON a.indiv_id = c.indiv_id_max
LEFT JOIN ( -- LEFT OUTER EXCLUDING JOIN
  SELECT indiv_id
  FROM `{{params.cim_cust_privacy_do_not_sell_view_full_nm}}` d
  JOIN `{{params.acct_perm_id_tbl_full_nm}}` ap ON d.acct_id = coalesce(ap.cim_perm_id, ap.daas_perm_id)
  WHERE d.retail_div_cd IN ('00', '72')
    AND ap.daas_acct_typ_cd <> 'PSP' 
    AND ap.cim_acct_type_cd <>'PSP' 
    AND (coalesce(ap.daas_fin_divn_nbr, ap.cim_fin_divn_nbr) = 72)
  GROUP BY d.indiv_id
) dns ON a.indiv_id = dns.indiv_id -- LEFT OUTER EXCLUDING JOIN
WHERE
  a.fin_divn_nbr = 72
  AND b.fin_div_nbr = 72
  AND a.frst_prch_dt >= DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY)
  AND dns.indiv_id IS NULL -- LEFT OUTER EXCLUDING JOIN
;
