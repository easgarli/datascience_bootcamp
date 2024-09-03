import streamlit as st
import pandas as pd
import numpy as np


st.title("Hello Streamlit")

st.markdown("# This is a BIG markdown")

st.markdown("## This is a MEDIUM markdown")

st.markdown("### This is a SMALL markdown")

st.header("This is a header")
st.subheader("This is a subheader")

st.success('Succesfull')
st.info("This is information")

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