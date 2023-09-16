# README: Evaluation of Various Predictive Models for ASD Diagnosis

## Project Overview

The goal of the Autism Screening and Assessment Clinic is to provide identification of Autism Spectrum Disorder (ASD) to inform intensive behavioral treatment while addressing specific skill deficits and enhancing community inclusion. The objective of this project is to predict the likelihood of a person having autism using survey and demographic variables, treating it as a classification problem with the target variable 'Class_ASD'.

**Dataset Details:**
- Number of Instances (records in the dataset): 704 (rows)
- Number of Attributes (fields within each record): 21 (columns)

## Data Preprocessing

1. **Loading Required Libraries:** We begin by loading essential libraries for data manipulation, visualization, and machine learning.

2. **Data Import:** The dataset is read from a CSV file.

3. **Exploratory Data Analysis (EDA):** We perform a preliminary exploration of the dataset to understand its structure, including displaying the first few rows, checking dimensions, and summarizing variables.

4. **Handling Missing Values:** We identify and handle missing values in the dataset, specifically addressing the 'age' column.

5. **Data Encoding and Transformation:** We perform label encoding for binary categorical variables and one-hot encoding for the remaining categorical variables.

6. **Correlation Analysis:** We analyze correlations between variables and drop the 'relation_Others' column due to high correlation with 'ethnicity_Others'.

## Feature Engineering

7. **Principal Component Analysis (PCA):** We apply PCA to reduce the dimensionality of the dataset. We compare the performance of PCA on both scaled and unscaled data.

## Model Building and Evaluation

8. **Machine Learning Models:** We implement various machine learning models, including Support Vector Machine (SVM), Decision Tree, Logistic Regression, and Artificial Neural Networks (ANN).

9. **Model Evaluation:** For each model, we evaluate its performance using metrics such as confusion matrices, accuracy, precision, recall, and F1-score. 

## Ensemble Techniques

10. **Bagging and Boosting:** We apply ensemble techniques, including bagging (Random Forest and Treebag) and boosting (C5.0 and Stochastic Gradient Boosting), to improve model performance.

11. **Hyperparameter Tuning:** We perform hyperparameter tuning for the Stochastic Gradient Boosting model to optimize its performance.

## Conclusion

In conclusion, all implemented algorithms successfully classify individuals as either ASD patients or normal individuals based on the provided features. After PCA, the first five principal components were chosen, which accounted for more than 95% of the dataset's variation. Machine learning models and ensemble techniques were applied to achieve high accuracy in ASD diagnosis.

Feel free to explore the code and adapt it to your specific needs. For further details, refer to the code comments and results provided in the README file.
