import os
import threading
from typing import List, Tuple
from PIL import Image

from PyQt6.QtCore import QObject, pyqtSlot as Slot, pyqtSignal as Signal


class Backend(QObject):

    def __init__(self, parent=None):
        QObject.__init__(self)
        self.image_extensions = ('.jpg', '.png', '.jpeg', '.gif', '.tiff', '.svg')
        self.images_sizes = tuple()
        self.curr_folder = ""
        self.curr_folder_imgs = tuple()
        self.curr_index = 0

    firstImage = Signal(str, str, int , int, int, int)
    updateImage = Signal(str, str, int, int, int)

    def get_size(self, img_name: str) -> Tuple:

        img = Image.open(img_name)
        w, h = img.size

        return w, h

    @Slot(int)
    def get_image_at_index(self, index: int):
        g_thread = threading.Thread(
            target=self._get_image_at_index,
            args=[index])
        g_thread.daemon = True
        g_thread.start()

    def _get_image_at_index(self, index: int):

        if self.curr_folder_imgs[index]:
            self.curr_index = index
            img_name = self.curr_folder_imgs[index]
            curr_img = "file:///" + img_name
            if '//' in img_name:
                curr_img = img_name
            title = os.path.split(curr_img)[-1]
            w, h = self.images_sizes[index]
            self.updateImage.emit(title, curr_img, self.curr_index, w, h)

    def get_image_sizes(self):
        sizes_thread = threading.Thread(target=self._get_image_sizes)
        sizes_thread.daemon = True
        sizes_thread.start()

    def _get_image_sizes(self):
        sizes = []
        for img in self.curr_folder_imgs:
            sizes.append(self.get_size(img))

        self.images_sizes = tuple(sizes)

    def start_up(self, argv: List):
        if len(argv) > 1:
            self.curr_folder = os.path.abspath(os.path.dirname(argv[1]))
            conts = os.listdir(self.curr_folder)

            imgs = []
            index = -1
            for item in conts:
                ext = os.path.splitext(item)[-1]
                if ext in self.image_extensions:
                    index += 1
                    fullpath = os.path.abspath(os.path.join(self.curr_folder, 
                    item))
                    if fullpath == argv[1]:
                        self.curr_index = index

                    imgs.append(fullpath)

            self.curr_folder_imgs = tuple(imgs)

            self.get_image_sizes()

            w, h = self.get_size(argv[1])
            total = len(self.curr_folder_imgs)
            img_name = os.path.abspath(argv[1])
            title = os.path.split(img_name)[-1]
            name = "file:///" + img_name
            if '//' in img_name:
                name = img_name

            self.firstImage.emit(title, name, self.curr_index, w, h, total)
