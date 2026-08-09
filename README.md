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
When we considering a result from correlation heat map found that interest_rate and grade have a high correlation between each of them and also has a high value of variance inflation factor so, we consider to choose one of them out. Interest rate is continuous meanwhile, grade is ordinal catagorical, I prefer to keep an interest rate
## Modeling
### Model1: Logistic Regression
The model was evaluated using a confusion matrix, classification report, ROC-AUC score and logistic regression results table by choosing threshold at 0.486

#### Confusion Matrix

|              | Predicted 0 | Predicted 1 |
| ------------ | ----------: | ----------: |
| **Actual 0** |          32 |          56 |
| **Actual 1** |           3 |          18 |

#### Classification Report

| Class            | Precision | Recall | F1-score | Support |
| ---------------- | --------: | -----: | -------: | ------: |
| **0**            |      0.91 |   0.36 |     0.52 |      88 |
| **1**            |      0.24 |   0.86 |     0.38 |      21 |
| **Macro Avg**    |      0.58 |   0.61 |     0.45 |     109 |
| **Weighted Avg** |      0.79 |   0.46 |     0.49 |     109 |

#### Overall Performance

| Metric       |      Score |
| ------------ | ---------: |
| **Accuracy** |       0.46 |
| **ROC-AUC**  | **0.6851** |

In loan business, we focus on default in payment prevention more than keep a good borrower. So, we choose a threshold that gives us a recall of default at >0.85 it is 0.486.
The model achieves a **ROC-AUC of 0.6851, indicating moderate ability to distinguish between the two classes.

For **Class 1**, the model has a high recall of **0.86**, meaning that it successfully identifies most positive cases. However, its precision is relatively low at **0.24**, indicating a relatively high number of false positives.
For **Class 0**, the model has high precision (**0.91**) but relatively low recall (**0.36**), meaning that although its predictions of Class 0 are usually correct, it misses a considerable number of actual Class 0 cases.
Overall, the model appears to prioritize detecting **Class 1** over minimizing false positives.

#### Logistic Regression Results Table
| Variable | Coef. | Std. Error | z | P-value | 95% CI Lower | 95% CI Upper |
|---|---:|---:|---:|---:|---:|---:|
| const | -1.6238 | 0.140 | -11.572 | 0.000 | -1.899 | -1.349 |
| log_annual_income | -0.1447 | 0.165 | -0.877 | 0.380 | -0.468 | 0.179 |
| debt_to_income | -0.0415 | 0.171 | -0.243 | 0.808 | -0.376 | 0.293 |
| delinq_2y | 0.1048 | 0.134 | 0.782 | 0.434 | -0.158 | 0.367 |
| num_collections_last_12m | -0.0221 | 0.123 | -0.180 | 0.857 | -0.263 | 0.219 |
| num_historical_failed_to_pay | 0.0422 | 0.143 | 0.294 | 0.768 | -0.239 | 0.323 |
| total_collection_amount_ever | -0.3561 | 0.313 | -1.138 | 0.255 | -0.969 | 0.257 |
| num_cc_carrying_balance | -0.1928 | 0.171 | -1.125 | 0.261 | -0.529 | 0.143 |
| account_never_delinq_percent | 0.0312 | 0.143 | 0.218 | 0.827 | -0.249 | 0.312 |
| tax_liens | 0.0211 | 0.150 | 0.141 | 0.888 | -0.272 | 0.315 |
| loan_amount | 0.3183 | 0.156 | 2.045 | 0.041 | 0.013 | 0.623 |
| term | -0.1478 | 0.147 | -1.006 | 0.314 | -0.436 | 0.140 |
| interest_rate | 0.5547 | 0.133 | 4.175 | 0.000 | 0.294 | 0.815 |
| log_total_credit_utilized | -0.2112 | 0.167 | -1.261 | 0.207 | -0.539 | 0.117 |

A significant of coefficient can indicate by a p-value, a less number of p-value indicate a probability of coefficent value will eqauls to zero is very less. Mostly, we use a standard number to decide which feature coefficient is significant or not at 0.05. From a p-value matrix above, only two <0.05 coefficient number is cofficeint of interest rate which is 0.00 that mean mostly of model was determine by this variable. Most second sinificant feature is loan_amount which its coefficient equals to 0.041 that mean this variable can indicate a trend of model roughly.
  * loan_amount Suppose income increase by 1 unit, odd of default will increase by 2.3% or odd ratio equal to 1.023
  * interest_rate Suppose income increase by 1 unit, odd of default will increase by 5.5% or odd ratio equa

### Model2: XG Boost
The model was evaluated using a confusion matrix, classification report, ROC-AUC score SHAP summary and dependence plot by choosing threshold at 0.16

#### Confusion Matrix

|              | Predicted 0 | Predicted 1 |
| ------------ | ----------: | ----------: |
| **Actual 0** |          33 |          55 |
| **Actual 1** |           3 |          18 |

#### Classification Report

| Class            | Precision | Recall | F1-score | Support |
| ---------------- | --------: | -----: | -------: | ------: |
| **0**            |      0.92 |   0.38 |     0.53 |      88 |
| **1**            |      0.25 |   0.86 |     0.38 |      21 |
| **Macro Avg**    |      0.58 |   0.62 |     0.46 |     109 |
| **Weighted Avg** |      0.79 |   0.47 |     0.50 |     109 |

#### Overall Performance

| Metric       |      Score |
| ------------ | ---------: |
| **Accuracy** |       0.47 |
| **ROC-AUC**  | **0.7083** |

We still focus on default in payment prevention more than keep a good borrower. So, we choose a threshold that gives us a recall of default at >0.85 it is 0.16 Compare with a confusion matrix table from logistic regression model above, we see that this model predict closely with the previous model. This model predict better on class0 more than previous model only one person. We conclude that no different between these two models. 

#### Feature Importance

| Feature | Importance |
|---|---:|
| interest_rate | 0.163292 |
| annual_income | 0.127761 |
| term | 0.120058 |
| total_collection_amount_ever | 0.117921 |
| debt_to_income | 0.101324 |
| total_credit_utilized | 0.089595 |
| loan_amount | 0.081519 |
| num_cc_carrying_balance | 0.076371 |
| account_never_delinq_percent | 0.072232 |
| delinq_2y | 0.048223 |
| num_historical_failed_to_pay | 0.001705 |
| num_collections_last_12m | 0.000000 |
| tax_liens | 0.000000 |
| grade | 0.000000 |

A top3 importance feature that most contribute to our model are 1.interest rate, 2.annual income and 3.term .

#### SHAP Summary plot
#### SHAP Dependence plot




