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
Enter main menu and select from the menu options.
Choose to enter a battle or train with an NPC.

## Directions to use it.
The player buttons will be shown when the user navigates to the instructions
screen. Clicking versus or training will bring the user to the character
selection screen, where depending on the number of players, fighters will be
chosen. In the training screen, the lone player will choose both fighters.
In the versus screen, players will take turns selecting fighters. When
both players have been chosen, click the fight button to begin the match.

The match has a 60-second countdown before the match ends. With the player
buttons, players should be able to move and attack with their fighters.
In versus, players will be able to duke it out. In training, players
will be able to fight against an NPC that does not move. Once a player has won,
the player's fighter will do a victory dance before the screen switches
back to the main menu.

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

### 1/25/2016
**Anthony Liang** -- Added victory screens for each character

Bug:  Victory dances are not completely on the platform.

New Feature: Added victory screens.

**Brian Yang** -- Returned player to main menu when match is over

Bug: Timer is not exact.

New Feature: Returned player to main menu after match.

### Final Version Complete! 
Things we were able to accomplish:
Animated four different characters: Ken, Ryu, Chun-li, Cammy
Created a menu, arena, versus, and training screen with properly working buttons
Created a selection menu for characters 
Arena contains a working timer, health bars for the characters, and display character names
Characters are able to walk, punch, kick, jump, crouch, and get hit
Got hitboxes to work so that the characters are able to interact
Created an instructions screen and standardized character keys

Things that we are still lacking, but can add/fix if we had more time:
Mid air moves (we tried to include these, but too many bugs popped up)
More special move animations (we were trying to work on those, but could not get the hitbox to work properly)
Fix special move animations to make them more realistic and move forward
Include sound in the game to make it more engaging
Fix the walking/jumping animation and hitboxes to make the game more smooth in general
Make the timer more accurate
Create more characters!