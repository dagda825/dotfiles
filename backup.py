import os
import shutil
import subprocess

dotfiles_dir = os.path.expanduser("~/dotfiles")
old_dotfiles_dir = os.path.expanduser("~/dotfiles_old")
files = ["bashrc", "zshrc", "bash_aliases", "init.el"]

# Create dotfiles_old directory
print(f"Creating {old_dotfiles_dir} for backup...")
os.makedirs(old_dotfiles_dir, exist_ok=True)
print("...done")

# Change to the dotfiles directory
print(f"Changing to {dotfiles_dir}...")
os.chdir(dotfiles_dir)
print("...done")

# Move existing dotfiles and create symlinks
for file in files:
    home_file = os.path.expanduser(f"~/.{file}")
    old_file = os.path.join(old_dotfiles_dir, file)
    dotfile = os.path.join(dotfiles_dir, file)

    if os.path.exists(home_file):
        print(f"Moving existing dotfile {home_file} to {old_file}...")
        try:
            shutil.move(home_file, old_file)
            print("...done")
        except Exception as e:
            print(f"Error moving {home_file}: {e}")
            continue # go to the next file.

    print(f"Creating symlink {home_file} -> {dotfile}...")
    try:
        os.symlink(dotfile, home_file)
        print("...done")
    except Exception as e:
        print(f"Error creating symlink: {e}")
        continue # go to the next file.

print("Dotfiles setup complete.")
