
class FileSystem():

    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    def __call__(self):
        print('I have been called')

    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
print("checkpoint")
fs()
fs.copy_files('.')
