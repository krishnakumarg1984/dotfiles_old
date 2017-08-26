import subprocess

def mailpasswd():
    path = "/home/gopalakrishnan/dotfiles/email_stuff/offlineimap_password.gpg"
    return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()

remotepasseval = mailpasswd()