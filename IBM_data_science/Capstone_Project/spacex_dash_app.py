import dash
from dash import dcc, html
from dash.dependencies import Input, Output
import plotly.express as px
import pandas as pd

# Load the SpaceX data
spacex_df = pd.read_csv("spacex_launch_dash.csv")

# Get unique launch sites
launch_sites = spacex_df['Launch Site'].unique()

# Initialize the Dash app
app = dash.Dash(__name__)

# Get minimum and maximum payload values from the dataset
min_payload = spacex_df['Payload Mass (kg)'].min()
max_payload = spacex_df['Payload Mass (kg)'].max()

# Define the app layout
app.layout = html.Div([
    html.H1("SpaceX Launch Records Dashboard", style={'textAlign': 'center'}),
    
    # TASK 1: Add a Launch Site Drop-down Input Component
    dcc.Dropdown(id='site-dropdown',
                 options=[
                     {'label': 'All Sites', 'value': 'ALL'}
                 ] + [{'label': site, 'value': site} for site in launch_sites],
                 value='ALL',
                 placeholder="Select a Launch Site here",
                 searchable=True
                 ),
    
    html.Br(),
    
    # TASK 2: Add a Pie Chart
    html.Div(dcc.Graph(id='success-pie-chart')),
    
    html.Br(),
    
    # TASK 3: Add a Range Slider to Select Payload
    html.P("Payload range (Kg):"),
    dcc.RangeSlider(id='payload-slider',
                    min=0, 
                    max=10000, 
                    step=1000,
                    marks={0: '0', 2500: '2500', 5000: '5000', 7500: '7500', 10000: '10000'},
                    value=[min_payload, max_payload]
                    ),
    
    html.Br(),
    
    # TASK 4: Add a Scatter Plot
    html.Div(dcc.Graph(id='success-payload-scatter-chart')),
])

# TASK 2: Add a callback function to render success-pie-chart based on selected site dropdown
@app.callback(
    Output(component_id='success-pie-chart', component_property='figure'),
    Input(component_id='site-dropdown', component_property='value')
)
def get_pie_chart(entered_site):
    filtered_df = spacex_df
    if entered_site == 'ALL':
        # Create a pie chart for all sites
        fig = px.pie(filtered_df, 
                     values='class', 
                     names='Launch Site', 
                     title='Total Success Launches by Site')
        return fig
    else:
        # Filter the dataframe for the selected site
        filtered_df = spacex_df[spacex_df['Launch Site'] == entered_site]
        # Create a pie chart for the filtered data
        fig = px.pie(filtered_df, 
                     names='class', 
                     title=f'Total Success Launches for site {entered_site}')
        return fig

# TASK 4: Add a callback function to render the success-payload-scatter-chart scatter plot
@app.callback(
    Output(component_id='success-payload-scatter-chart', component_property='figure'),
    [Input(component_id='site-dropdown', component_property='value'),
     Input(component_id='payload-slider', component_property='value')]
)
def update_scatter_chart(selected_site, payload_range):
    # Filter data based on the selected payload range
    filtered_df = spacex_df[(spacex_df['Payload Mass (kg)'] >= payload_range[0]) & 
                            (spacex_df['Payload Mass (kg)'] <= payload_range[1])]

    # Check if ALL sites are selected
    if selected_site == 'ALL':
        # Create a scatter plot for all sites
        fig = px.scatter(filtered_df, x='Payload Mass (kg)', y='class',
                         color='Booster Version Category',
                         title='Correlation between Payload and Success for all Sites')
    else:
        # Filter the data for the selected site
        filtered_df = filtered_df[filtered_df['Launch Site'] == selected_site]
        # Create a scatter plot for the selected site
        fig = px.scatter(filtered_df, x='Payload Mass (kg)', y='class',
                         color='Booster Version Category',
                         title=f'Correlation between Payload and Success for site {selected_site}')
    
    return fig

# Run the app
if __name__ == '__main__':
    app.run_server(debug=True)
