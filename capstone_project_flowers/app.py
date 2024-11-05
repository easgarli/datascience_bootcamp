import streamlit as st
import tensorflow as tf
import numpy as np
from PIL import Image
import io

# Load the trained models
custom_cnn = tf.keras.models.load_model('models/custom_cnn.h5')
vgg16_model = tf.keras.models.load_model('models/vgg16_model.h5')
resnet_model = tf.keras.models.load_model('models/resnet_model.h5')

# Class names (update according to your flower classes)
class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']

def preprocess_image(image):
    """
    Preprocess the uploaded image
    """
    img = image.resize((224, 224))
    img_array = tf.keras.preprocessing.image.img_to_array(img)
    img_array = tf.expand_dims(img_array, 0)
    img_array = img_array / 255.0
    return img_array

def main():
    st.title("Flower Classification App")
    st.write("Upload an image of a flower to classify it!")

    uploaded_file = st.file_uploader("Choose an image...", type=["jpg", "jpeg", "png"])

    if uploaded_file is not None:
        # Display the uploaded image
        image = Image.open(uploaded_file)
        st.image(image, caption='Uploaded Image', use_column_width=True)

        # Preprocess the image
        processed_image = preprocess_image(image)

        # Model selection
        model_choice = st.selectbox(
            "Choose a model:",
            ["Custom CNN", "VGG16", "ResNet50"]
        )

        if st.button("Classify"):
            # Make prediction based on selected model
            if model_choice == "Custom CNN":
                prediction = custom_cnn.predict(processed_image)
            elif model_choice == "VGG16":
                prediction = vgg16_model.predict(processed_image)
            else:
                prediction = resnet_model.predict(processed_image)

            # Get the predicted class
            predicted_class = class_names[np.argmax(prediction)]
            confidence = float(np.max(prediction))

            # Display results
            st.write(f"Predicted class: {predicted_class}")
            st.write(f"Confidence: {confidence:.2%}")

            # Display prediction probabilities
            st.write("Prediction Probabilities:")
            for i, (class_name, prob) in enumerate(zip(class_names, prediction[0])):
                st.write(f"{class_name}: {prob:.2%}")

if __name__ == "__main__":
    main() 