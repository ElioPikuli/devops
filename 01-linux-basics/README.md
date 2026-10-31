# 01 – Linux basics

Lectures 1–2. Set up an Ubuntu environment and practised the core shell commands.

## Exercises

1. **Ubuntu VM.** Installed Ubuntu 24.04 LTS on Oracle VirtualBox, opened a terminal and ran `pwd`.
2. **Reading the prompt.** Worked out the username, machine name and current directory from the shell prompt (`user@machine:~$`).
3. **Directory tree.** Built this structure under `~` with `mkdir`, `cd` and `touch`:

   ```
   ~
   ├── tmp/        file1.md  file2.md  file3.md
   ├── tmp456/
   ├── tmp789/
   └── test123/    file3.md  file4.md  file5.md
   ```

4. **Links and docs.** Used `ln -s`, `cat` and `man`, read the manuals for `ln` and `mv`, and created a soft link to the Desktop:

   ```bash
   ln -s ~/Desktop linkToDesktop
   ls -l    # linkToDesktop -> /home/<user>/Desktop
   ```
