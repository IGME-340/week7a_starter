# Week 7A Starter - IGME-340

Forms that feel good to use. We're adding clear buttons to text fields, finding out why that breaks the keyboard's Next button, fixing it with focus nodes, and making the keyboard get out of the way when it should. This is the toolkit for **Lab 03**: its clear buttons are required, and all three bonus items come straight from today.

`lib/main.dart` starts as a `MainPage` StatefulWidget with a sign up form: three `TextFormField`s (Name, Email, Password) and a Submit button that does nothing yet. The `TODO` comments are numbered to match the steps we do in class.

---

## I. Get the Code

**Work in your own repo, not the template.** Accepting the assignment creates a repo just for you, named `igme-340-week-7a-starter-<your-github-username>`. Don't fork `IGME-340/week7a_starter` or click "Use this template" on it. I can't see work pushed anywhere else, so it won't count.

Three ways, all worth the same credit. Use whichever you already know:

- **GitHub Desktop:** clone your repo, then open the folder in VS Code.
- **Command line:** copy the URL from the green **Code** button, then `git clone <your-repo-url>`.
- **Neither one cooperating?** Skip cloning and edit your files directly on GitHub.com. Full credit, no penalty.

Step by step for all three: [Participation Repos](https://github.com/jptweb/IGME-340-Shared/blob/main/documents/participation.md).

Once it's on your machine, open the folder in VS Code. Make sure you open the folder that *contains* `pubspec.yaml`, not the one above it. Opening the parent folder is the most common way this goes wrong, and the error you get looks completely unrelated to the real cause.

**Don't clone into a path with spaces.** `Documents/IGME 340/` will cause failures later that have nothing to do with your code. Use something like `Documents/igme-340/`.

---

## II. Run It

```bash
flutter pub get
flutter run
```

**Use the Android emulator today if you can.** Most of this lesson is about the on-screen keyboard, and Chrome doesn't have one.

---

## III. Follow Along in Class

Everything today happens in `lib/main.dart`. No packages.

| What | What it does |
|---|---|
| `TextEditingController` | A remote for one field. Your code can read it (`.text`), set it, and `.clear()` it. |
| `suffixIcon: IconButton(...)` | A button inside the right edge of the field. Ours calls `controller.clear()`. |
| `textInputAction` | Picks the keyboard's action button: `next`, `done`, and so on. |
| `FocusNode` | A handle on one field's focus, so your code can move the cursor there. |
| `focusNode.requestFocus()` | Puts the cursor in that field and brings up the keyboard. |
| `onEditingComplete` | Runs when the user presses the keyboard's action button. |
| `focusNode.unfocus()` | Takes focus away from one field, which hides the keyboard. |
| `FocusManager.instance.primaryFocus?.unfocus()` | Hides the keyboard no matter which field has focus. |
| `onTapOutside` | Runs when the user taps anywhere outside this one field. |
| `GestureDetector` | Wrapped around the whole `Scaffold`, one `onTap` handles tap-to-dismiss for every field. |
| `SingleChildScrollView` | Lets the page scroll, so the keyboard can't cover the bottom fields. |
| `icon` / `prefixIcon` / `prefix` | Outside the border / inside and always visible / inside and only while focused. |

`dispose()` every controller and focus node you create. We'll do that together.

---

## IV. Commit and Push

### How this one is graded

To get credit, your pushed code has to show today's work:

- a `TextEditingController` on each field, and a clear button (`suffixIcon`) that empties it
- `FocusNode`s with `onEditingComplete`, so Next goes Name → Email → Password
- the keyboard dismissing on Submit, or on a tap outside the fields

It doesn't need to be finished, and it doesn't need to look like mine. An untouched starter or a "Hello World" commit doesn't count.

**Missed class?** You can still earn it. The [Week 7A notes](https://github.com/jptweb/IGME-340-Shared/blob/main/weekly/7A.md) have the code for every piece.

**Push before the start of class on Thursday.** Pushing at the end of class is a good habit, so do that too.

### How to push

**GitHub Desktop:** write a summary, click **Commit to main**, then **Push origin**.

**Command line:**

```bash
git add .
git commit -m "Week 7A in-class work"
git push
```

**If push is fighting you:** open `lib/main.dart` on GitHub.com, click the pencil, paste your code in, and commit there. Same credit.

---

## V. If Something Goes Wrong

| Problem | What to do |
|---|---|
| Pressing Next lands on the X button instead of the next field | That's the bug we fix in class. Give each field a `FocusNode` and use `onEditingComplete` to `requestFocus()` the next one. |
| The clear button does nothing | The field needs `controller: nameController` (or whichever one). A controller that isn't attached to a field can't clear it. |
| `LateInitializationError` on a focus node | Create it in `initState()`, then hot **restart**. Hot reload doesn't re-run `initState()`. |
| "A TextEditingController was used after being disposed" | Each controller should be disposed exactly once, in `dispose()`. Check for a copy-pasted duplicate line. |
| Yellow and black stripes at the bottom when the keyboard opens | The keyboard pushed the form off the screen. Wrap the body in a `SingleChildScrollView`. |
| Tap-to-dismiss doesn't work | The `GestureDetector` has to wrap the `Scaffold`, not sit inside the `Column`. |
| No keyboard shows up in the emulator, just a little circle | Newer Android emulators hide it. Quick fix: tap the circle, then **Show virtual keyboard**. To make it stick, turn on **Settings → System → Keyboard → Physical keyboard → Show virtual keyboard**. |
| Blue squiggle under a widget | That's a lint suggestion, not an error. Your code still runs. |
| `git push` asks for a password | GitHub wants a token, not your account password. Easiest fix is to install [GitHub CLI](https://cli.github.com) and run `gh auth login`. |
| `flutter pub get` complains about SDK versions | Run `flutter --version` and send me the output on Slack. This template is built to accept a wide range, so this one is worth reporting. |
| Something else | Slack me. Don't sit on it quietly, a broken environment compounds fast. |
