import streamlit as st
import numpy as np
import tensorflow as tf
from tensorflow import keras
from PIL import Image
import cv2

# Define class names
class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']

# Load models and wrap in TFSMLayer
@st.cache_resource
def load_custom_cnn():
    return keras.Sequential([
        keras.layers.TFSMLayer("/home/elnur/Desktop/DataScience-Bootcamp/capstone_project_flowers/custom_cnn_model_savedmodel", call_endpoint="serving_default")
    ])

@st.cache_resource
def load_vgg16():
    return keras.Sequential([
        keras.layers.TFSMLayer("/home/elnur/Desktop/DataScience-Bootcamp/capstone_project_flowers/VGG16_savedmodel", call_endpoint="serving_default")
    ])

@st.cache_resource
def load_resnet152():
    return keras.Sequential([
        keras.layers.TFSMLayer("/home/elnur/Desktop/DataScience-Bootcamp/capstone_project_flowers/ResNet152_savedmodel", call_endpoint="serving_default")
    ])

# Preprocess image
def preprocess_image(image):
    image = np.array(image)
    image = cv2.resize(image, (224, 224))  # Resize to the model's expected input size
    image = image / 255.0                  # Normalize the image
    image = np.expand_dims(image, axis=0)  # Add batch dimension
    return image

# Streamlit App Interface
st.title("Flower Classification App")
st.write("Upload an image of a flower, and the model will predict its class.")

# Model selection
model_choice = st.selectbox("Choose a model", ("Custom CNN", "VGG16", "ResNet152"))

# Load the selected model
if model_choice == "Custom CNN":
    model = load_custom_cnn()
elif model_choice == "VGG16":
    model = load_vgg16()
else:
    model = load_resnet152()

# File uploader
uploaded_file = st.file_uploader("Choose an image...", type=["jpg", "jpeg", "png"])

if uploaded_file is not None:
    # Display uploaded image
    image = Image.open(uploaded_file)
    st.image(image, caption="Uploaded Image", use_column_width=True)

    # Preprocess and make a prediction
    processed_image = preprocess_image(image)
    # Perform inference and get the prediction dictionary
    prediction = model.predict(processed_image)

    # Extract the prediction tensor (assuming the output is already a numpy array)
    confidence_values = list(prediction.values())[0]  # Directly use the array

    # Get the predicted class and confidence
    predicted_class = class_names[np.argmax(confidence_values)]
    confidence = np.max(confidence_values)

    # Display the prediction and confidence
    st.write(f"**Prediction:** {predicted_class}")
    st.write(f"**Confidence:** {confidence:.2f}")


