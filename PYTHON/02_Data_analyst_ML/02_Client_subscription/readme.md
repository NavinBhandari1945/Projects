FinTech Mobile App Data Analysis & Prediction Model  

Overview  
A FinTech company launched a mobile app providing premium features for free for 24 hours to collect user data. The goal is to analyze user behavior and predict whether they will purchase premium features to enhance productivity.  

Dataset  
- FineTech_appData.csv contains user activity data.  
- top_screens.csv contains screen names viewed by users.  
- Key Features:  
  - used_premium_feature: 1 if a user utilized free premium features, 0 otherwise.  
  - enrolled: 1 if a user purchased premium features, 0 otherwise.  

Data Preprocessing  
- Checked for missing values and cleaned the dataset.  
- Converted time variables into numerical values.  
- Extracted screen interactions from screen_list.  
- Aggregated screen usage into categories (e.g., saving, credit, loans).  
- Standardized numerical features for model training.  

Exploratory Data Analysis (EDA)  
- Generated heatmaps for feature correlations.  
- Created histograms and pairplots to visualize data distribution.  
- Analyzed enrollment trends among users.  

Model Training & Evaluation  
Several classification models were trained and tested to predict enrolled:  

1. Decision Tree  
2. K-Nearest Neighbors (KNN)  
3. Naive Bayes  
4. Random Forest  
5. Logistic Regression  
6. Support Vector Machine (SVM)  
7. XGBoost Classifier (Best Performing Model)  
   - Parameter tuning applied to optimize performance.  
   - Achieved the highest accuracy score.  

Model Performance Comparison  
- Accuracy scores were evaluated for models with and without feature scaling.  
- XGBoost classifier with tuned hyperparameters outperformed other models.  
- Confusion matrix and classification reports were generated to assess precision and recall.  
- 10-fold cross-validation confirmed model reliability.  

Final Model Implementation  
- XGBoost was chosen for final deployment.  
- Predicted enrollment behavior of test users.  
- Evaluated results against actual outcomes for validation.  

Conclusion  
With this model, the company can predict which users are likely to purchase premium features based on their 24-hour free feature usage. This enables targeted marketing and improved revenue strategies.  