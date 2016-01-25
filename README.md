# Street Fighter VI

## Project Description
Our project is to create a fighting game similar to Street Fighters and Shadow Fight(app store).
The basic concept is that there are two players. The players will be able to choose from a selection
of characters (Cammy, Ryu, Chun-li, and Ken). After choosing characters, the players are sent to the
arena where they will battle it out using different moves and special abilities with the objective
of KOing their opponent in a set amount of time. Players will have a health bar and a rage bar to activate
special moves. The basic moves for a character include: light punch(A), medium punch(S), heavy punch(D),
light kick(Z), medium kick(X), and heavy kick(C).

## Directions to compile/run
Press play button on processing to run the sketch.
Enter main menu.
Choose to enter a battle or train with an AI.
Pick a character and brawl it out using your arsenal of moves.

## Directions to use it.
Same as Part 2.

## Day by Day Changelog
### 1/19/2016
**Anthony Liang** -- Made animation when character getsHit

Bug: The hit animation doesn't trigger when it should all the time.

Goal: Add a few more animations for different attacks. Fix bug.

**Brian Yang** -- Fixed knockback and getHit animation

New Feature: Ported battle system into main app.

Bug: The health bars are not in the right place.

Goal: Add more characters and moves. Fix character select screen.

### 1/20/2016
**Anthony Liang** -- Enlarged characters
-- Removed grid background
-- Tested Ken

Goal: Prevent players from spamming.

### 1/22/2016
**Brian Yang** -- Centered frames
-- Prevented spamming

Bug: Hitbox is not completely accurate.

New Feature: Added knockback to battles.

Goal: Complete character select screen.

### 1/23/2016
**Anthony Liang** -- Tried to fix crouch and make character stay in crouch when down key is pressed.
Also created instruction screen and standardized character controls.

Bug: When first player crouches (Ken), the second character also crouches.

Goal: Fix bug and work on making it smoother.

**Brian Yang** -- Fixed some bugs with knockback
-- Fixed crouch
-- Completed player selection screen

Bug: Fighting is laggy.

New Feature: Added player selection screen.

Goal: Complete jump animation.

### 1/24/2016
**Anthony Liang** -- Created Chun-li character, working on adding the special moves.

Bug: Some of the special animations require the frames to move forward. Also kamekameha for Chun-li
doesn't work fluidly, needs to be fixed.

Goal: Make the animations more realistic, add victory screen

**Anthony Liang** -- Added special moves, ported animation code into the Arena, fixed the graphics for arena 

Bug: Characters are disappearing when implementing victory animations

Goal: Continue to add improvements and get victory animation to work

**Brian Yang** -- Added jump down animation
-- Tried to add parabolic motion to jumping
-- Fixed orientation of pictures
-- Added training screen (one player is frozen)
-- Added versus screen (two players)

Bug: Fighters don't jump very far on the x-plane.
How high fighters can jump depends on the fighter chosen.
Need to press the up key and then the left and right keys
to move in midair.

New Features: Fighters can jump (somewhat).
Players can train without having to fight an actual opponent.
Players can fight each other.

Goal: Fix victory screen. Modify hitboxes to be more accurate.