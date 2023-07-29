# Smaranjeet's MolViewer

This application takes uploaded SDF files of molecules, and creates a corresponding SVG image file to represent them on the website. It outputs the SVG file to the webserver, allowing
the user to rotate it as they want to see the molecule from different angles. The user also has the ability to choose the size and colours of different atom elements.

## **Technologies Used**
Front-End: JavaScript, JQuery, HTML/CSS  
Back-End: Python, C, Swig, SQLite

With the front-end, JQuery was used for the majority of the JavaScript programming, while HTML and CSS was used to design and structure the webpages.  

On the back-end, a C library was programmed to perform molecule-specific computations quickly, which was used by the Python scripts in the project. Python was used to interface with the SQLite database and perform back-end web-server operations.
