import vim
import os


class Finder:

    def find(self) -> None:
        if not self.is_filetype_supported():
            print('filetype not supported')
            return

        file_name = vim.eval("expand('%:t:r')")
        project_directory = vim.eval("finddir('.git/..', expand('%:p:h').';')")


        test_file_path = ''
        for root, dir, files in os.walk(project_directory):
            for name in files:
                if name == file_name+"Test.php":
                    test_file_path = os.path.join(root, name)
                    vim.command(":vs %s" % test_file_path)
                    break

        if test_file_path == '':
            print('No test was found for the current file')

    def is_filetype_supported(self) -> bool:
        if(vim.eval("&filetype") != 'php'):
            return False

        return True

