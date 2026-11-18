# jbboynton/tap

Homebrew casks for apps that homebrew/cask has disabled because their
developers do not notarize them. Each cask here is the original with
the disable removed, plus a step that clears the quarantine flag, so
the app installs and opens without a manual approval.

## Use

```sh
brew tap jbboynton/tap
brew trust jbboynton/tap
brew install --cask jbboynton/tap/alacritty
```

In a `Brewfile`:

```ruby
tap "jbboynton/tap"
cask "jbboynton/tap/alacritty"
```

## Updates

A workflow checks each app's upstream releases once a day, bumps the
cask and merges the change. `brew upgrade` then installs the new
version like any other.

## Casks

| Cask        | Source                         |
| ----------- | ------------------------------ |
| `alacritty` | github.com/alacritty/alacritty |
