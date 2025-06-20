# 🧠 Processing Battle

Processing Battle is a game inspired by [CSS Battle](https://cssbattle.dev/), but built entirely in [Processing](https://processing.org/)!  
Your mission: **recreate the target image using Processing code** as precisely as possible.

---

## 🎮 How to Play

1. **Download or clone this repository**
2. Open `ProcessingBattle.pde` in Processing.
3. Press the ▶️ play button or use the keyboard shortcut to start.
4. A tutorial will appear if you're playing for the first time.
5. The screen is divided into 3 sections:
   - **Right** → Target image you must replicate.
   - **Left** → Your code output.
   - **Bottom** → Tools: color picker, accuracy meter, level selector, view options, and a submit button.

6. Code each level by opening the matching file (e.g., `Challenge01`) and rerun the sketch to see your code on the screen.
   - Use the "Next Tab" shortcut to move between challenges.

7. Press **Submit** to save your score for the current level.

---

## 💡 Tips

- Use the [Processing reference](https://processing.org/reference/)
- There might be many solutions to the same challenge, don't be afraid to experiment
- Ask for help, look things up on the internet, and don't be afraid to search online if you are stuck
- And hey… if you’re *really* stuck, you can take a peek at the `Solutions` folder 😉

---

### 🧩 Contribute Your Own Levels!

Want to make your own challenge for **Processing Battle**? Awesome! You can contribute a new level by submitting your solution through GitHub. If it fits the spirit of the game, it may be added to the official game!

#### 🛠️ How to Create a Custom Level

1. **Go to the `solutions/` folder**  
   Create a new file following this format:  
   `Solution_[your_name]_[level_number].pde`
   Example: `Solution_Alex_05.pde`

2. **Write your solution inside a function** with the same name as the file (without the `.pde` extension)  
   Example:  
   ```java
   void Solution_Alex_05() {  
     // your image-replicating code here  
   }
   ```

3. **Update the main `Solution.pde` file**  
   This file controls which solution is displayed.  
   Add your function call there.  
   Example:  
   ```java
   Solution_Alex_05();
   ```

4. **Test your challenge**  
   Make sure your level:  
   - Runs without errors  
   - Displays cleanly in the interface  
   - Is visually interesting or fun to replicate

#### 🚀 Submit Your Level

Once your level is ready:

1. Fork this repository on GitHub  
2. Add your custom level files and update `Solution.pde`  
3. Commit and push the changes to your fork  
4. Open a Pull Request (PR) to this repository

**In the PR description, include:**
- A short title and description of the challenge  
- Your name or handle (for credit!)  
- (Optional) What inspired your design

If your level fits the game's style, it’ll be merged into the official version!

---

## 🧑‍💻 Made By

Created with ❤️ by **Anog Jani**  
Fork it, break it, play it, and share it!

---
