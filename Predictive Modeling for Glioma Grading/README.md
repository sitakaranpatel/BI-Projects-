# Predictive Modeling for Glioma Grading: Comparative Evaluation of Classification Models

**Author:** Sita Karan Patel

## Introduction
This repository contains an in-depth analysis of the "Glioma Grading" dataset obtained from the UCI Machine Learning Repository, [dataset link](http://www.archive.ics.uci.edu/dataset/759/glioma+grading+clinical+and+mutation+features+dataset) The dataset comprises clinical and mutation features for glioma grading, with the primary objective of predicting the glioma grade. The analysis involves data preprocessing, visualization, and the application of multiple classification algorithms to build predictive models.

## Data Preparation
The dataset was loaded and preprocessed to handle missing values, outliers, and normalization. It consists of both clinical and molecular features, including gender, age at diagnosis, race, and 20 molecular features such as IDH1, TP53, ATRX, and others.

## Data Exploration
Exploratory data analysis was conducted to understand the dimensions, structure, and summary statistics of the datasets. The distribution of glioma grades was visualized, and steps were taken to handle missing values, identify and remove outliers, and perform correlation analysis.

## Model Building and Evaluation
Three classification models were built and evaluated using the preprocessed data:

### Model A: k-Nearest Neighbors (k-NN) Classification
- The k-NN model was trained and tested using an 80/20 split for training and test data.
- Evaluation metrics such as accuracy, precision, recall, F1 score, and ROC AUC were calculated and visualized using a ROC curve.

### Model B: Naïve Bayes Classification
- The Naïve Bayes model was trained and evaluated, and its performance was assessed using the same evaluation metrics as Model A.

### Model C: Decision Tree Classification
- A decision tree classification model was built, and its performance was evaluated using the previously mentioned metrics.

## Conclusion
The analysis provides a comprehensive overview of the application of various classification models for predicting glioma grade based on clinical and molecular features.
I performed comprehensive data preprocessing, explored the dataset, handled missing values,detected and removed outliers, normalized features, transformed continuous features, conducted PCA, andbuilt classification models using k-NN, Naïve Bayes, and decision trees.  The evaluation of each model’sperformance using various metrics provided insights into their strengths and weaknesses.The comparison of the models revealed that while Model C exhibited perfect performance, potential overfit-ting or evaluation issues must be considered. Models A and B displayed strong performance, with Model Aappearing as a well-rounded choice due to its high accuracy, balanced precision and recall, and good ROCAUC. 
The evaluation metrics and visualizations offer insights into the performance of each model, enabling a comparative assessment of their effectiveness.
However, it’s imperative to validate these findings on additional datasets and conduct further analysis beforemaking a final decision.18

