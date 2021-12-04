# Imports PIL module 
from PIL import Image
def openImage(byte_string):
    ascii_string = byte_string.decode('ascii')
    
    # open method used to open different extension image file
    im = Image.open(ascii_string) 

    # This method will show image in any image viewer 
    im.show() 
