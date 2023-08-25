import os
import sys
import numpy as np
from PIL import Image

args = sys.argv

exec = os.environ.get('EXEC')

if exec == 'true':
    a = np.array([1, 2, 3, 4, 5, 6])

    b = a.reshape((2, 3))

    print(b)

    image = Image.open('image.png')

    width = int(args[1])
    height = int(args[2])

    new_size = (width, height)
    resized_image = image.resize(new_size)

    resized_image.save('resized_image.png')