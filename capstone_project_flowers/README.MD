# Flower Classification Streamlit App

This Streamlit app classifies images of flowers into five categories: daisy, dandelion, roses, sunflowers, and tulips. The app allows users to upload a flower image, choose a model (Custom CNN, VGG16, or ResNet152), and view the classification results along with the confidence score.

## Features

- **Model Selection**: Choose between Custom CNN, VGG16, and ResNet152 models.
- **Image Upload**: Upload a flower image (JPEG or PNG formats).
- **Classification**: Classifies the uploaded image into one of the flower categories.
- **Confidence Score**: Displays the model's confidence in the classification.

## Installation

1. **Clone the repository**:
   git clone https://github.com/yourusername/flower-classification-app.git
   cd flower-classification-app

## Create a virtual environment (recommended):

python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate

## Install dependencies:

pip install -r requirements.txt
Run the Streamlit app:

## Run the Streamlit app
streamlit run app.py

## Folder Structure
app.py: Main script for running the Streamlit app.
requirements.txt: List of dependencies for the app.

## Usage
**Launch the App:** Follow the instructions in the Installation section to start the app.
**Select a Model:** Choose a model from the dropdown (Custom CNN, VGG16, or ResNet152).
**Upload an Image:** Use the file uploader to upload an image of a flower.
**View Results:** The app will display the predicted class and confidence score.

## Dependencies
Python 3.8+, 
Streamlit, 
TensorFlow, 
OpenCV, 
NumPy, 

You can find the complete list of dependencies in requirements.txt.

## Troubleshooting
Ensure that the models are in the correct SavedModel format and located in the models/ directory.
If you encounter issues with TensorFlow or model loading, check compatibility between TensorFlow and Keras versions.

## License
This project is licensed under the MIT License.