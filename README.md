# Homebrew Tap for SleekVoice

This is a Homebrew tap for [SleekVoice](https://github.com/bvsbharat/sleekvoice-releases) - Voice-to-text AI that turns speech into clear, polished writing.

## Installation

```bash
brew tap bvsbharat/sleek
brew install --cask sleekvoice
```

## Upgrading

```bash
brew upgrade --cask sleekvoice
```

## Uninstalling

```bash
brew uninstall --cask sleekvoice
```

## Requirements

- macOS 14.0 (Sonoma) or later
- Apple Silicon or Intel Mac

## Features

- Local AI transcription with whisper.cpp
- Cloud transcription providers (Groq, Deepgram, etc.)
- AI enhancement for polished text
- Global hotkey for quick dictation
- Power Mode for app-specific settings

---

## For Developers: Releasing a New Version

### Prerequisites

- [GitHub CLI](https://cli.github.com/) installed and authenticated (`gh auth login`)
- Xcode and build tools installed

### Quick Release (Recommended)

Use the release script in the SleekVoice project:

```bash
cd /path/to/SleekVoice
./scripts/release.sh 2.4
```

This will:
1. Build the release DMG
2. Upload to GitHub releases
3. Update the Homebrew Cask formula
4. Push all changes

### Manual Release Steps

If you prefer to release manually:

#### 1. Build Release DMG

```bash
cd /path/to/SleekVoice
make build-release
make dmg
```

#### 2. Get SHA256 Hash

```bash
shasum -a 256 SleekVoice.dmg
```

#### 3. Create GitHub Release

```bash
gh release create v2.4 SleekVoice.dmg \
  --repo bvsbharat/sleekvoice-releases \
  --title "SleekVoice v2.4" \
  --notes "## SleekVoice v2.4

### What's New
- List your changes here

### Installation
\`\`\`bash
brew tap bvsbharat/sleek
brew install --cask sleekvoice
\`\`\`"
```

#### 4. Update Cask Formula

Edit `Casks/sleekvoice.rb` in this repository:

```ruby
cask "sleekvoice" do
  version "2.4"  # Update version
  sha256 "YOUR_NEW_SHA256_HASH"  # Update hash
  # ... rest stays the same
end
```

#### 5. Commit and Push

```bash
cd /path/to/homebrew-sleek
git add Casks/sleekvoice.rb
git commit -m "Update SleekVoice to v2.4"
git push
```

### Testing the Release

```bash
# Clear cache and reinstall
brew untap bvsbharat/sleek
brew tap bvsbharat/sleek
brew install --cask sleekvoice
```

## Support

For issues and feature requests, please visit the [releases repository](https://github.com/bvsbharat/sleekvoice-releases/issues).
