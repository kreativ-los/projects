Projects
========

A project manager for the popular zsh.

## Setup
1. Place __projects.sh__ and __projects__-Folder in a new folder `project-manager` in your home directory.

2. In your terminal navigate run the following commands:
 	 ```
	 $ cd ~/project-manager/
	 $ chmod +x projects.sh
	 $ ln -s ~/project-manager/projects.sh /usr/local/bin/projs
	 ```
3. Open your `.zshrc` and add the following line:
	 `alias projects='. proj ${1}'`
	 After saving this file reload (`$ source ~/.zshrc`) it in your terminal or restart the terminal.

4. Your done! Happy coding :)

## Usage
1. Navigate to your project folder and run: `$ projects add`
2. Now you're asked some questions:
	1. How to name the project
	2. If you want to open it in atom if you switch to it
	3. Add additional commands like `nvm use && npm start`
3. Type `$ projects foo` to switch to project __foo__

List projects using `$ projects list`
