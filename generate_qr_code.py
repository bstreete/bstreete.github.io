
import argparse
import qrcode
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers.pil import RoundedModuleDrawer
from qrcode.image.styles.colormasks import RadialGradiantColorMask

#
# If unable to find qrcode, pip install qrcode 
#

def parse_args():

    parser = argparse.ArgumentParser()

    parser.add_argument('-d', '--data', required=True, help="String to encode")
    parser.add_argument('-o', '--out', required=True, help="Output filename")
    parser.add_argument('-i', '--image', default="images/favicon_full.png", help="Image to include")
    args = parser.parse_args()

    return args

def generate(args):
    
    qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_H)
    qr.add_data(args.data)

    if args.image:
        image = qr.make_image(image_factory=StyledPilImage, embedded_image_path=args.image)
    else: 
        image = qr.make_image()

    image.save(args.out)


if __name__ == '__main__': 
    args = parse_args()
    generate(args)
