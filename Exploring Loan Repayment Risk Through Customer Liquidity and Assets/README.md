# Project Overview
    
This project analyzes customer loan characteristics to identify segments with higher financial pressure and potential repayment risk. Using the German Credit dataset, the analysis explores how customer liquidity indicators (savings and checking accounts), job type, housing status, loan purpose, credit amount, and loan duration interact to signal financial strain.
    
The goal is not to build a predictive model, but to demonstrate analytical reasoning,SQL aggregation skills, and business-oriented insights relevant to credit risk assessment.
    
This project simulates how risk monitoring, policy review, and lending strategy decisions using descriptive analytics.

# Key Analytical Questions
  1. Customer share by liquidity profile (savings & checking)
  2. Average loan amount and duration
  3. How does credit amount compare to customer liquidity indicators?
  4. Which combinations of features indicate potential financial strain?
    
The analysis focuses on descriptive risk signals, not credit scoring or prediction.

# Key Metrics & KPIs
  - Average Duration
  - Average Credit Amount
  - High Pressure Segment
  - Potential Risk Segment

# Analytical Approach
  1. Start with saving and checking acount segmenting to find liquidity segentation
  2. find average both duration and credit amount
  3. see if job have afected to pay the loan 
  4. see if purposes and asset ownig have impact to paying the loan

# Key Insights
  - The loan portfolio is dominated by customers with limited liquid assets, increasing baseline credit exposure by 5.2 %.
  - Asset ownership correlates with higher loan capacity but also longer financial commitments.
  - Customers with low liquidity still receive sizable loans, suggesting elevated repayment pressure.
  - Employment alone does not offset liquidity risk; low-liquidity workers form the core risk cluster.
  - Consumption-driven loans dominate long-term exposure, while necessity-based loans remain shorter and lower risk.

# Tools
  - SQL: data aggregation, KPI calculation, trend analysis
  - Excel: Cleaning
  - Data Source: https://www.kaggle.com/datasets/uciml/german-credit

# Limitations
  - This analysis is descriptive, not predictive; no default probability or risk score is calculated.
  - The dataset contains categorical groupings (e.g. “Little”, “Moderate”, “Rich”) instead of exact balances, limiting precision.
  - Missing and “NA” values in savings and checking accounts are treated as valid segments, which may blur distinctions between truly unknown data and zero liquidity.
  - No time-series data is available, so behavioral changes over time cannot be observed.
  - External financial factors (income amount, expenses, interest rate) are not included.
  - Loan performance outcome (default vs non-default) is not directly modeled in this dashboard.

# Future Improvements
  - Create a **composite Loan Pressure Index** combining credit amount, duration, and liquidity indicators.
  - Apply **median-based or percentile-based thresholds** instead of averages for more robust segmentation.
  - Incorporate **default outcome data** (if available) to validate risk signals.
  - Build an interactive dashboard with **filters by job, housing, and loan purpose**.
  - Extend the analysis using **logistic regression or decision trees** for risk prediction.
