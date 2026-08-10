# kingstonkofc.org — the Council website

This is a complete website for Knights of Columbus Kingston Council #275, rebuilt from the
content recovered from the old site.

It is **plain HTML**. There is no WordPress, no database, no plugins, no logins, and nothing
that expires or needs updating. It cannot be hacked, and it will still work in ten years. The
trade-off is that editing means opening a file and changing words — which this document explains.

---

## What's in this folder

| File | What it is |
|---|---|
| `index.html` | Home page |
| `about.html` | About the Council / who can join / why join |
| `history.html` | The Council's history, 1897 to today |
| `officers.html` | Officer roster and what each office does |
| `mass-times.html` | Mass times for all parishes |
| `meetings.html` | Meeting dates and upcoming activities |
| `resources.html` | Parish bulletins and useful links |
| `photos.html` | Photo gallery |
| `contact.html` | How to reach the Council |
| `styles.css` | All the colors, fonts and layout. **You never need to open this to edit text.** |
| `images/` | Where photographs go |

---

## To look at it right now

Double-click `index.html`. It opens in your web browser and works completely, straight off your
own computer — no internet needed. Click around. This is exactly how it will look online.

---

## What's already done

The site is live at **kingstonkofc.org** and the content is current as of **10 August 2026**:

- Officer roster updated (Chancellor, Recorder and Outside Guard changed in August 2026), with
  phone numbers and e-mail addresses
- Meeting dates for the rest of 2026, first and third Mondays at 7:00 PM
- Mass times checked against every parish's own website
- Programs and upcoming events on the Meetings page
- Four photographs in the gallery

Two things are still open, marked with `FOR THE WEBMASTER` comments inside `contact.html`. They are
HTML comments, so visitors never see them — you will only find them when editing the file:

1. **A council-owned e-mail address** for the contact page. The most important item on this list —
   see *Never lose it again* at the bottom.
2. **Online donations**, if the Council wants them. A decision for the Financial Secretary and
   Trustees, not the webmaster.

---

## Keeping it current

The things most worth updating, in the order they go stale:

| What | Where | How often |
|---|---|---|
| Upcoming events | `meetings.html`, "Coming up" | As they are announced |
| Meeting dates | `meetings.html` table | Once a year, each January |
| Mass times | `mass-times.html` | Check against the parish sites twice a year |
| Officers | `officers.html` | After each election |
| Photos | `photos.html` + `images/` | Whenever there are good ones |

When you change Mass times, update the "checked against each parish's own website on…" line at the
foot of that page so readers know how fresh it is.

---

## How to edit the words

Open any `.html` file in a plain text editor:

- **Mac:** right-click the file → *Open With* → *TextEdit*
- **Windows:** right-click → *Open with* → *Notepad*

You'll see text mixed in with tags in angle brackets, like this:

```html
<p>Council meetings are held on the first and third Mondays of each month.</p>
```

**Change the words. Leave the angle-bracket tags alone.** So this is fine:

```html
<p>Council meetings are held on the second and fourth Tuesdays of each month.</p>
```

Save the file, then refresh your browser to see the change. That's the whole skill.

A few useful tags, if you want them:

| To do this | Write this |
|---|---|
| A new paragraph | `<p>Your text here.</p>` |
| Bold | `<strong>important</strong>` |
| A bullet list | `<ul>` `<li>first item</li>` `<li>second item</li>` `</ul>` |
| A link | `<a href="https://example.com">the words you click</a>` |
| A link to another page here | `<a href="mass-times.html">Mass times</a>` |
| A phone number that dials on a phone | `<a href="tel:+18453098546">(845) 309-8546</a>` |

If you break something: close the file **without saving**, and nothing is lost. It's worth keeping
a copy of this original folder somewhere safe so you can always start over from a clean version.

---

## Adding photos

1. Put the image file into the `images/` folder. Give it a plain, lowercase name with no spaces —
   `summer-picnic-2026.jpg`, not `IMG_5679 copy (1).JPG`.
2. In `photos.html`, find a grey placeholder box that looks like this:

   ```html
   <div class="placeholder">images/dolan-visit.jpg</div>
   ```

3. Replace that whole line with:

   ```html
   <img src="images/summer-picnic-2026.jpg" alt="Knights serving at the summer picnic">
   ```

4. Edit the caption on the line just below it.

**Keep the `alt` text.** It's a short description of the photo, read aloud to blind visitors and
used by Google. One plain sentence is right.

Photographs straight from a phone are often 5–10 MB, which makes pages slow to load. Before adding
them, resize them to about 1600 pixels wide — on a Mac, open the image in Preview → *Tools* →
*Adjust Size*.

**A word on photos of people:** the old site had pictures of members and guests. Standard practice
for parish and council sites is to avoid naming children, and to ask before posting a clear photo
of an identifiable individual.

---

## Adding the council logo

The site currently uses a simple gold-and-red crest drawn in code. The original Knights of
Columbus emblem from the old site can be recovered from the Internet Archive with the
`download-kofc275-media.sh` script that came with this package — look for `KOFC275.png`.

To use it: put the file in `images/`, then in **every** `.html` file find the block that starts
`<svg class="crest"` and ends `</svg>`, and replace the whole block with:

```html
<img class="crest" src="images/KOFC275.png" alt="Knights of Columbus emblem">
```

There are nine files, so it's nine copy-and-pastes. (Your editor's Find and Replace can do it in
one go if you're comfortable with that.)

---

## Where the site lives

The site is published with **GitHub Pages**, which is free permanently — there is no monthly bill
and no renewal to miss.

| Thing | Where it is |
|---|---|
| The files | GitHub repository `kingstonkofc-website` |
| The live site | `https://kingstonkofc.org` |
| The domain | Registered at **GoDaddy** |

The only recurring cost is the domain registration, roughly $20–25 a year at GoDaddy. **Set it to
auto-renew** and make sure the card on file isn't one person's personal card that will expire when
they leave the role.

---

## How to publish a change

Two ways. Both take about a minute.

### The easy way — edit directly on GitHub

1. Go to the repository on github.com and click the file you want to change, e.g. `meetings.html`.
2. Click the **pencil icon** (Edit this file).
3. Change the words, exactly as described above.
4. Scroll down and click **Commit changes**.

That's it. The live site updates itself within a minute or two. GitHub also keeps every previous
version, so a mistake is never permanent — click **History** on any file to see or restore what it
said before.

### Uploading a file from your computer

If you edited a file on your own machine, go to the repository, click **Add file → Upload files**,
drag the changed file in, and click **Commit changes**. Uploading a file with the same name replaces
the old one.

### Adding photos

Open the `images` folder in the repository, click **Add file → Upload files**, and drag your
pictures in. Then edit `photos.html` as described above.

---

## HTTPS

Already handled. GitHub provides the certificate free and renews it automatically, which is why the
address shows as `https://`. Nothing to maintain.

## Two things this site deliberately cannot do

Plain HTML files can display anything, but they can't *receive* anything. That's the reason nothing
here can break. Two features of the old site therefore work differently:

**The contact form.** Right now the contact page lists a phone number and a mailing address, which
for a council this size is honestly the most reliable thing anyway — people call. If you do want a
form, a form-handling service such as Formspree gives you a small snippet of HTML to paste in, and
form submissions arrive by e-mail. Free tiers are usually generous enough for a council website.

**Online donations.** The old site had a donation form. Taking card payments needs a payment
processor, which means a merchant account, fees, and the Council's financial records — the
Financial Secretary and the Trustees should be part of that decision, not the webmaster alone. It's
also worth asking the State Council what other New York councils use, since there may be an
approved route. For now `contact.html` invites cheques to the PO Box, as many councils do.

---

## 🔑 Never lose it again

The old website was lost because the accounts that controlled it belonged to one person. Please
don't rebuild that situation. Three habits prevent it:

1. **Register everything to an address the Council owns**, not to any individual's personal
   e-mail. Either a real mailbox at the domain (`info@kingstonkofc.org`) or a Google group with the
   Grand Knight, the Financial Secretary and the webmaster all on it. Whoever holds the webmaster
   role changes; the mailbox shouldn't.
2. **Write the logins down.** One sheet listing where the domain is registered, where the site is
   hosted, and which e-mail account controls both. It goes in the Council records with the
   Financial Secretary — the same place as any other Council asset. A shared password manager is
   better still, but paper in a safe place beats nothing at all by a very wide margin.
3. **Keep a copy of this folder** on more than one computer. Because the whole site is just these
   files, anyone holding a copy can put it back online in an afternoon. That is the real reason to
   prefer plain files over a system with a database: the site can never be locked away from the
   Council again.

---

*Published to GitHub Pages, August 2026. Built from content recovered from the Internet Archive's
Wayback Machine. A separate document, `kofc275-recovered-content.md`, holds the full record of what
was on the old site &mdash; including officers' personal contact details, which is why it is kept in
the Council's records rather than published in this public repository.*

*Vivat Jesus!*
