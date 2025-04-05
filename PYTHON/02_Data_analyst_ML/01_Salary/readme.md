Salary Data Analysis  

Overview  
This project focuses on analyzing salary trends based on various job roles, experience levels, and other factors using Python and JupyterLab. The analysis involves data preprocessing, exploratory data analysis (EDA), and visualization to extract meaningful insights from the dataset.  

Key Features  

1. Data Loading & Preprocessing  
- Reads CSV data into a Pandas DataFrame.  
- Displays dataset structure, column names, and data types.  
- Removes unnecessary columns (salary, salary_currency).  
- Handles missing values by removing rows with NaN values.  
- Identifies and removes duplicate records.  

2. Data Exploration & Cleaning  
- Displays unique values for all columns.  
- Renames experience level categories for better readability.  
- Computes summary statistics such as sum, mean, standard deviation, skewness, and kurtosis for salary-related data.  
- Computes correlation between numerical variables.  

3. Data Visualization  
- Bar Graphs:  
- Displays the top 15 highest-paying job titles.  
- Shows salaries based on experience levels.  
- Heatmaps & Pairplots:  
- Shows correlations between numerical variables.  
- Histograms & Box Plots:  
- Visualizes salary distribution and work-year trends.  

4. Insights & Findings  
- Identifies the highest-paying job title.  
- Determines salary variations based on experience level.  
- Analyzes salary distributions across different roles.  
- Provides a visual representation of salary trends.  

Technologies Used  

- Programming Language: Python  
- Development Environment: JupyterLab  
- Python Libraries:  
- numpy – For numerical operations  
- pandas – For data manipulation  
- matplotlib & seaborn – For data visualization  

Conclusion  
This project provides insights into salary trends using Python, Pandas, and Seaborn. It highlights the impact of job roles and experience levels on salaries. Future enhancements could include predictive modeling and machine learning for salary forecasting.