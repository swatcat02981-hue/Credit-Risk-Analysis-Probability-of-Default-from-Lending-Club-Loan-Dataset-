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
Most people annual income in range between 50k-100k(49%).From the histrogram graph of annual_income, loan_amount and total_creit_utilized we found that we need to take a log transformation to annual_income and total_creit_utilized because of right-skewness of both histrogram graph before we bring a dataset to fit a logistic regression model.( Decreasing an effect feom outlier)
### Default Rate Analysis
#### Debt to Income
![Default_Rate_Analysis of debt_to_income](images/debt_to_income_def.png)
#### Annual Income
![Default_Rate_Analysis of annual_income](images/annual_income_def.png)
#### Interest Rate
![Default_Rate_Analysis of interest_rate](images/interest_rate_def.png)
#### Grade
![Default_Rate_Analysis of grade](images/grade_def.png)
#### Loan Amount
![Default_Rate_Analysis of loan_amount](images/loan_amount_def.png)
#### Finding from Default Rate Analysis
We found a strong correlation from two variables there are interest rate and grade with loan default.At higher range of interest rate and grade found more rate of default. We also found some relation in loan amount at the first and in the end related with default rate although between thease two point are un predictable. The interesting that we found from default rate analysis come from two variables there are debt to income and annual income which have very similar trend between them.More clarify, at the low range of both variables found high rate of default and slightly decrease at the middle range before slightly increase at the high range of variables(Inverted Bell Curve). However we can't find data evidence to support that both of them are actually bell curve.
### Correlation Analysis
![Correlation of variables](images/correlation.png)
#### Finding from correlation analysis
When we considering a result from correlation heat map found that interest_rate and grade have a high correlation between each of them and also has a high value of variance inflation factor so, we consider to choose one of them out. Interest rate is continuous meanwhile, grade is ordinal catagorical, I prefer to keep an interest rate.
