# Git Convention

## Branch Strategy
main      Production-ready, protected. PR only, never direct push.
dev       Active development. All task commits land here.
feature/  Optional, for long-running experimental work only.

## Versioning
MAJOR.MINOR.PATCH — semver
- PATCH: bug fixes
- MINOR: new features, backwards compatible
- MAJOR: breaking changes

## Rules
- All work happens on dev.
- Merge dev → main only at release milestones, with user approval.
- Don't delete dev after merge. Continue on dev.
- No force push to dev or main.
- Tag releases on main: v1.0.0

## PR Rules (dev → main)
- Requires passing CI
- Requires CHANGELOG.md updated
- Requires user approval