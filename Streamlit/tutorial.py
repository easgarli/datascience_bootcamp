import streamlit as st
import pandas as pd
import numpy as np

st.title("This is a title")
st.title("Hello Streamlit ")

# Text
st.text('We are exciting for learning Streamlit.')

#writing text
st.write("Writing example text with write function")

# Markdown
st.markdown("# This is a BIG markdown")
st.markdown("## This is a MEDIUM markdown")
st.markdown("### This is a SMALL markdown")

# Header
st.header("This is a header")
st.subheader("This is a subheader")

#colorfull tesxt and backgrouns
st.success('Succesfull')
st.info("This is information")

#help   
st.warning('This is a warning')
st.error('Stop...That give a error')

#get help; st.help() function retrieves and displays information from Python's internal documentation system (docstrings and the built-in help system)
st.help(range)
st.help(len)
st.help(dict)
st.help(st.button) # for Streamlit
st.help(st.write)
st.help(st.slider)

# IMPORTING IMAGE AND VIDEO
#importing images 
from PIL import Image
img=Image.open("Diamond.png")
st.image(img, width=200, caption="Streamlit Roadmap")    #It use image function of Streamlit via "st.image" 


#importing video
st.video("myvideo.mp4") 
st.video('https://www.youtube.com/watch?v=xhGwjUKbiC4') # from youtube


#checkbox    
# Title
st.text("Choose a Machine Learning Algorithm")

# Assigning the state of checkboxes to variables
decision_tree_selected = st.checkbox("Decision Tree")
random_forest_selected = st.checkbox("Random Forest")

# If Decision Tree is selected, display the corresponding message
if decision_tree_selected:
    st.text("You chose Decision Tree")

# If Random Forest is selected, display the corresponding message
elif random_forest_selected:
    st.text("You chose Random Forest")
    
# ****************

#radio button 
status=st.radio("Select your status", ("Graduate", "Student"))
if status == "Graduate" :
    st.success("Congrats")    
else:
    st.info("Keep working")

# Exmp;
status=st.radio("Select a ML Model", ("DT", "RF"))
if status == "DT" :
    st.success("DT has a wide usage in different scince, like education, finance etc.")    
else:
    st.success("RF has a bagging algorithm.")
    

# select box (dropdown menu)
selection=st.selectbox("Select a ML Model", ["DT", "RF"])
st.write("Your selected ML model is", selection)

# Slider
experince = st.slider("How many years of experince do you have?", 0,10,2) # min, max, start value

#Exmp;
salary = st.slider("What is the your salary expextation?", 100,150)
st.write("Your salary expectation is", salary)


#button 
st.button("Start")

#Exmp;
if st.button("Predict"):
    st.write("Your result is 100")

    
# Sidebar
st.sidebar.title("Menu")

# Exmp;
st.sidebar.title("Choose an ML Model")
selection=st.sidebar.selectbox("Select a ML Model", ["DT", "RF"])
st.success(f"Your selected ML model is {selection}")


# Editing Background color with HTML
st.markdown(
    """
    <div style = 'background-color:orange; padding: 10px;'>
    <h1 style = 'color: white; text-align: center;'>Everything is possible on Streamlit</h1>
    </div>
    """,
    unsafe_allow_html=True
)



# Editing Background color with CSS
st.markdown(
    """
    <style>
    .stApp {
        background-color: lightblue;
    }
    </style>
    """,
    unsafe_allow_html=True
)

st.write("This is a custom background color, obtained by using CSS!")


# Ballons & Snow
st.balloons()

st.snow()

# *-----------------------------------
#Exmp;
st.write("What is the capital of France?")

if st.button("Berlin"):
    st.snow()  # Wrong
    st.write("Oops! That's not correct.")
elif st.button("Paris"):
    st.balloons()  # Correcnt
    st.write("Congratulations! That's the correct answer.")
    
