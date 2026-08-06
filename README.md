# Credit-Risk-Analysis-Probability-of-Default-from-Lending-Club-Loan-Dataset
## Project Workflow
![ข้อความอธิบายรูปภาพ](images/Project_workflow.png)
## Project Overview
This project aims to predict customer default risk and identify the key drivers behind loan defaults.
## Dataset 
* annual_income(num)(independent variable)
* debt_to_income(num)(independent variable)
* delinq_2y(num)(independent variable)
* num_collections_last_12m(num)(independent variable)
* num_historical_failed_to_pay(num)(independent variable)
* total_collection_amount_ever (num)(independent variable)
* num_cc_carrying_balance(num)(independent variable)
* account_never_delinq_percent(num)(independent variable)
* tax_liens(num)(independent variable)
* loan_amount(num)(independent variable)
* term(ordinal catagorical)(independent variable)
* interest_rate(num)(independent variable)
* grade(ordinal catagorical)(independent variable)
* total_credit_utilized(num)(independent variable)
* loan_status(target variable)
## Exploratory Data Analysis
### Distribution analysis
#### Annual Income
![Distribution of annual income](images/annual_income_dist.png)
#### Total Credit Utilized
![Distribution of total_credit_utilized](images/total_credit_utilized_dist.png)
#### Loan Amount
![Distribution of loan_amount](images/loan_amount_dist.png)
#### Finding from distribution analysis
From the histrogram graph of annual_income, loan_amount and total_creit_utilized we found that we need to take a log transformation to annual_income and total_creit_utilized because of right-skewness of both histrogram graph before we bring a dataset to fit a logistic regression model.( Decreasing an effect feom outlier)
