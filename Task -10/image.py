import cv2
import os
from PIL import Image, ImageDraw

path = '/Users/prarthanadesai/Operation-Pixel-Merge/assets'

def extract_number(filename):
    try:
        return int(os.path.splitext(filename)[0])
    except ValueError:
        return float('inf')

image_files = sorted(
    [f for f in os.listdir(path) if f.endswith('.png') or f.endswith('.jpg')],
    key=extract_number
)

previous_dot = None
final_image = Image.new('RGB', (512, 512), (255, 255, 255))
draw = ImageDraw.Draw(final_image)

for image_file in image_files:
    image_path = os.path.join(path, image_file)
    
    image = cv2.imread(image_path)
    if image.mean() == 255:
        previous_dot = None
        continue

    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    _, thresh = cv2.threshold(gray, 240, 255, cv2.THRESH_BINARY_INV)
    
    contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    if contours:
        c = max(contours, key=cv2.contourArea)
        M = cv2.moments(c)
        if M["m00"] != 0:
            cx = int(M["m10"] / M["m00"])
            cy = int(M["m01"] / M["m00"])
        else:
            cx, cy = 0, 0

        dot_color = image[cy, cx]
        dot_color = tuple(int(c) for c in dot_color[::-1])
        
       
        if previous_dot is not None:
            draw.line([previous_dot, (cx, cy)], fill=dot_color, width=5)
        
        previous_dot = (cx, cy)

final_image.save('stitched_message.png')
final_image.show()

print("Image stitching complete. The final image is saved as 'stitched_message.png'.")