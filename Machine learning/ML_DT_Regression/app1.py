import streamlit as st
import pandas as pd
import joblib

# Load the saved model
loaded_model = joblib.load('Final_DT_Regression_Model.joblib')

# Streamlit title
st.title("Car Price Estimation Model")


# User input
Present_Price = st.slider("Present Price", 0, 24, 12)
Kms_Driven = st.slider("Kms Driven", 500, 500000, 50000)
Fuel_Type = st.selectbox("Fuel Type", options=['Petrol', 'Diesel', 'CNG'])
Seller_Type = st.selectbox("Seller Type", options=['Dealer', 'Individual'])
Transmission = st.selectbox("Transmission", options=['Manual', 'Automatic'])
Owner = st.slider("Owner", 0, 3, 1)
Year = st.slider("Year", 2003, 2018, 2010)
Vehicle_Age = 2024-Year

# Create a DataFrame from the user input
new_data = pd.DataFrame({
    'Present_Price': [Present_Price],
    'Kms_Driven': [Kms_Driven],
    'Fuel_Type': [Fuel_Type],
    'Seller_Type': [Seller_Type],
    'Transmission': [Transmission],
    'Owner': [Owner],
    'Vehicle_Age': [Vehicle_Age]
     })


# Make a prediction
if st.button("Make Prediction"):
    prediction = loaded_model.predict(new_data)
  
    # Display the results
    st.write(f"Predicted Price: {prediction[0]}")
