import os
from platform import system
import threading
from dataclasses import dataclass, asdict

from PyQt6.QtCore import QObject, pyqtSlot as Slot, pyqtSignal as Signal
from pytube import YouTube


@dataclass
class Info:
    link: str
    title: str
    thumbnail: str
    percent: int = 0
    file_path: str = ""


class Downloader(QObject):

    def __init__(self, parent=None):
        super().__init__()
        os_name = system().lower()
        env_name = 'HOME'
        if os_name == 'windows':
            env_name = 'USERPROFILE'
        self.output_path = os.path.join(os.environ[env_name], 'yt-downloader')
        if not os.path.exists(self.output_path):
            os.makedirs(self.output_path)
            if os_name != 'windows':
                os.system(f'chmod +rw {self.output_path}')

    progressChanged = Signal(int, int, arguments=['progressChanged'])
    returnVideoInfo = Signal(list, arguments=['videoInfo'])
    downloaded = Signal(int, str, arguments=['downloaded'])

    def _download(self, ind, link):
        yt = YouTube(
            link,
            on_progress_callback=self.progress_wrapper(ind),
            on_complete_callback=self.downloaded_wrapper(ind)
            )

        streams = yt.streams.filter(file_extension='mp4')
        video = yt.streams.get_by_resolution('720p')
        video.download(output_path=self.output_path)

    def _open_file(self, ind, fp):
        os.system(f'explorer {fp}')

    def _search_video(self, link):
        vid = YouTube(link)
        maxres_img = vid.thumbnail_url.replace('sddefault', 'maxresdefault')
        info = Info(link, vid.title, maxres_img)
        model = asdict(info)
        print(model)
        self.returnVideoInfo.emit([model])

    def progress_wrapper(self, index):

        def progress_changed(vid, chunk, remaing_bytes):
            total = vid.filesize - remaing_bytes
            percent = int(total / vid.filesize * 100)
            self.progressChanged.emit(index, percent)

        func = progress_changed
        return func

    def downloaded_wrapper(self, index):
        def download_complete(value, filepath):
            self.downloaded.emit(index, filepath)
        
        return download_complete

    @Slot(int, str)
    def download(self, ind, link):
        d_thread = threading.Thread(target=self._download, args=[ind, link])
        d_thread.daemon = True
        d_thread.start()

    @Slot(int, str)
    def open_file(self, ind, file_path):
        d_thread = threading.Thread(target=self._open_file, args=[ind, file_path])
        d_thread.daemon = True
        d_thread.start()

    @Slot(str)
    def search_video(self, link):
        s_thread = threading.Thread(target=self._search_video, args=[link])
        s_thread.daemon = True
        s_thread.start()
