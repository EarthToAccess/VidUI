![EBGui Development](https://user-images.githubusercontent.com/38049304/187346757-ffbfb117-5e56-4677-be01-03c120d3d644.png)

# EBGui Development

---

This repository is meant for development of EBGui, and contains its raw source code. It's here to allow for collaboration and remote access to development code without hassle preventing contributors from needing flash drives or access to the host system to modify and push code.

**Any leaks of this source code that trace back to any contributors will be met with the immediate removal of your access to this repository.**

---

## Disclaimer

**Contibutors here take full responsibility for any consequences of improper code pushed or pulled that may have consequences to their host systems and/or accounts.** Contributors are also aware that using any user interface such as EBGui in unintended or malicious manners may get your account banned from Elemental Battlegrounds or Roblox.

## Contributor Rules

1. **_Do not provide access to other users in any way._**  
    This includes leaking source code as mentioned above, as well as allowing users other than yourself to use your GitHub account information to log-in and view the repository. Ensure your account uses [two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication), and do not provide anyone with your Public Access Token.
2. **_Do not intentionally "grief", or intentionally and maliciously modify and/or render unusable, the EBGui code._**  
    To begin, you won't be hurting the users; only the other contributors. This repository is intentionally private and separate from the users to provide a sandboxed location for us to push and pull changes to the code to potentially push it to the EBGui main repository via Earth. What it does do, however, is set back any potential progress on new features for EBGui, and make it really annoying to revert and/or restore a working version for development.
3. **_Do not add yourself to the EBGui Master List without express permission from Earth._**  
    The Master List is a very dangerous tool, as it provides uninterrupted access to EBGui and all its Gold features without the use of a Key. While it's understandable why a contributor would want to add their Roblox account to the Master List, it can be harmful in the wrong hands and cause potential problems. As such, if you wish to be added to the Master List for development purposes, please either contact Earth to allow him to push the change, or comment your user ID into the list, like below;
```lua
local masterlist = {
  32573334,
  --12345678
}
```
If you get approval from Earth without commenting, post the date and time in which you got approval to add yourself, like below;
```lua
local masterlist = {
  32573334,
  12345678 -- approved Sep/4/2022 at 1:23 PM EST
}
```
4. **_Do not disable any access/Gold membership checks._**
    If you need constant access to EBGui without needing to add Keys, please follow the above instructions to get added to the Master List. Do not disable the checks in place to ensure users have proper permissions, as this could prove costly to us if it gets unintentionally pushed to the public.
5. **_If you're unsure if a change would be welcome, either contact other contributors, Earth himself, or leave a comment at the top of the code._**  
    While most features would be accepted, there may be a rare chance that one either wouldn't make sense to add alongside other currently-present ones, or would be too overpowered even with Gold membership as an option. As such, if you're unsure on if a feature would fit in to any category of "potentially unacceptable", please contact someone or leave a comment mentioning it for it to be seen by others for judging.
    - If you're judging a commented feature but still don't want to give a full verdict, simply leave another comment explaining it! Using GitHub's main website can also let you make literal comments on the code without using lines in source.
6. **_Do not change the styling of EBGui without express permission from Earth._**  
    EBGui's colors are an essence of its branding, and it's important to keep them in such a way. A color palette can be made available to contributors if needed.

Contributors that break these rules will have their access revoked immediately.

## Terms and Conditions

Any contributors that add code requiring specific instruction or regulation through the Terms can find its page [at this link.](https://docs.google.com/document/d/15qLJqaVDGmreg5xAgqxvFeVPghS-YcuUUu355M5BJkM/edit?usp=sharing) To prevent the sharing link from being overwritten with the editing link, if you do not already have editing access when you visit the URL, please contact Earth to allow him to add you as an editor.

## Loading

Loading the EBGui version found here is similar to the standard version, with the difference being the repository name (following `EarthToAccess`) and endinf file structure at the suffix of the URL. Whereas you look for `EarthToAccess/EBGui/main/bin/main.lua` in the original, your loadstring should instead load `EarthToAccess/EBGui/main/de.lua`.

You will require the current EBGuiKey and EBGuiGold variables to have been declared and equal to the current Keys available to users, unless you have been approved to be added to the Master List.

## Pushing changes

When pushing changes to this repository, ensure your commit message details precisely what you've added, changed, or started. This is not only for log conservation and understanding what work has been done, but also for the version update changelogs in the public repository. To do so, use the extended description when committing changes.

- If you're uploading directly to GitHub, you can find this in the "Commit changes" box under the editor window.
- If you're using Visual Studio Code's GitHub extension... don't use Visual Studio Code's GitHub extension. Support for the extended description (and GitHub at all, frankly), is unstable at best.
- If you're using Git Bash (or just a Bash terminal itself), there are a variety of ways to do this;
  1. `git config --global core.editor "<path/to/editor> <wait arg>"`. The first command will configure your Git install to open the text editor in at your specified path when it requires multiline input. A potential "wait" argument may be available for your editor, e.g. Atom and Visual Studio Code use `--wait`, and Nano, Sublime Text, and Textmate use `-w`. This "wait" argument will make Git wait for the editor to close and provide input to Git before it continues committing. Then, simply use `git commit` with no arguments to make it open your editor. Create your commit message my making the short message one line, and your extended description to further down.
  2. `git commit -m "title" -m "ext desc."`. This is a little hacky and may not work, so it isn't recommended, but is a potential option for those who are unable to use a specific editor.
  2. `git commit -m $"Commit title\n\nExtended description"`. This approach will follow the newline conventions of Bash and add them into your comment, emulating the exact thing you'd
