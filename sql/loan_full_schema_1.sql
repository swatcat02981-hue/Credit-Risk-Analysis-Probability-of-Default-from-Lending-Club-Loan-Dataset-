SELECT 
	CASE WHEN annual_income <= 0 THEN NULL 
		 ELSE LN(annual_income+1)
	END AS log_annual_income,
	CASE WHEN debt_to_income  BETWEEN 0 AND 100 THEN debt_to_income 
		 ELSE NULL
	END AS debt_to_income,
	CASE WHEN delinq_2y >= 0 THEN delinq_2y
		 ELSE NULL
	END AS delinq_2y,
	CASE WHEN num_collections_last_12m >= 0 THEN num_collections_last_12m
		 ELSE NULL
	END AS num_collections_last_12m,
	CASE WHEN num_historical_failed_to_pay >= 0 THEN num_historical_failed_to_pay
		 ELSE NULL
	END AS num_historical_failed_to_pay,
	CASE WHEN total_collection_amount_ever < 0 THEN NULL 
		 ELSE total_collection_amount_ever
	END AS total_collection_amount_ever,	
	CASE WHEN num_cc_carrying_balance >= 0 THEN num_cc_carrying_balance
		 ELSE NULL
	END AS num_cc_carrying_balance,
	CASE WHEN account_never_delinq_percent  BETWEEN 0 AND 100 THEN account_never_delinq_percent 
		 ELSE NULL
	END AS account_never_delinq_percent,
	CASE WHEN tax_liens >= 0 THEN tax_liens
		 ELSE NULL
	END AS tax_liens,
	CASE WHEN loan_amount <= 0 THEN NULL 
		 ELSE loan_amount
	END AS loan_amount,
	CASE WHEN term = 36 THEN 0
		 WHEN term = 60 THEN 1
		 ELSE NULL
	END AS term,
	CASE WHEN interest_rate BETWEEN 0 AND 100 THEN interest_rate 
		 ELSE NULL
	END AS interest_rate,
	CASE WHEN grade = 'A' THEN 1
		 WHEN grade = 'B' THEN 2
		 WHEN grade = 'C' THEN 3
		 WHEN grade = 'D' THEN 4
		 WHEN grade = 'E' THEN 5
		 WHEN grade = 'F' THEN 6
		 WHEN grade = 'G' THEN 7
		 ELSE NULL 
	END AS grade,
	CASE WHEN total_credit_utilized <= 0 THEN NULL 
		 ELSE LN(total_credit_utilized+1)
	END AS log_total_credit_utilized,
	CASE WHEN loan_status = 'Fully Paid' THEN 0
		 WHEN loan_status IN ('Late (16-30 days)', 'Late (31-120 days)') THEN 1
		 ELSE NULL
	END AS loan_status
FROM loans_full_schema
WHERE loan_status in ('Fully Paid', 'Late (16-30 days)', 'Late (31-120 days)')