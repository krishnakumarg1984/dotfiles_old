import subprocess

def mailpasswd():
    path = "/home/kg314/dotfiles/email_stuff/offlineimap_password.gpg"
    return subprocess.check_output(["gpg", "--quiet", "--batch", "-d", path]).strip()

remotepasseval = mailpasswd()