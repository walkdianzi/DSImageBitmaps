# Copyright 2016 Niek Temme. 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

"""Predict a handwritten integer (MNIST expert).

Script requires
1) saved model (model2.ckpt file) in the same location as the script is run from.
(requried a model created in the MNIST expert tutorial)
2) one argument (png file location of a handwritten integer)

Documentation at:
http://niektemme.com/ @@to do
"""

#import modules
import sys
import tensorflow as tf
from PIL import Image, ImageFilter
import numpy as np

def imageRGB(argv):
    testImage=Image.open(argv).convert('RGB')
    testImage = testImage.resize((28, 28))
    test_input=np.array(testImage)
    print(test_input)
    width = testImage.size[0]
    height = testImage.size[1]
    y = 0
    while y<height:
        x = 0
        while x<width:
            print('y:'+str(y)+' x:'+str(x))
            print(test_input[y,x])
            print('R: ' + str(test_input[y,x,0]))
            x += 1
        y += 1

def imageGray(argv):
    testImage=Image.open(argv).convert('L')
    testImage = testImage.resize((28, 28))
    test_input=np.array(testImage)
    print(test_input)
    width = testImage.size[0]
    height = testImage.size[1]
    y = 0
    while y<height:
        x = 0
        while x<width:
            print('y:'+str(y)+' x:'+str(x))
            print(test_input[y,x])
            x += 1
        y += 1

def main(argv):
    """
    Main function.
    """
    imageRGB(argv)
    imageGray(argv)

if __name__ == "__main__":
    main(sys.argv[1])
