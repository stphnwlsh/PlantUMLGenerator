# Contributing

Thanks for stopping by. Bug reports, ideas, typo fixes and pull requests are all welcome, in roughly that order of how quickly they get a reply.

This is looked after in spare time by one person with a day job and a coffee habit, so replies are best effort. The fastest way to get something changed is to make it easy to say yes to.

## Before you start

- Be kind. The [code of conduct](CODE_OF_CONDUCT.md) says how.
- Search the [issues](https://github.com/stphnwlsh/PlantUMLGenerator/issues) first. Someone may have beaten you to it.
- For anything bigger than a small fix, open an issue before you write the code, so we can agree on the approach before you spend an evening on it.
- Found a security problem? Don't open an issue. Follow the [security policy](SECURITY.md).

## Making a change

1. Fork the repository and branch from `main`. Name the branch `feature/`, `fix/` or `chore/` followed by a few words, like `fix/svg-fonts`.
1. Make the change. If you touch `generate.sh`, run [ShellCheck](https://www.shellcheck.net) on it.
1. Run `./generate.sh` and check the sample images still look right. Commit them if they changed.
1. Push to your fork. The **Build** workflow runs there too.
1. Open the pull request against `main`, fill in the template, and link the issue if there is one.

Keep it small and simple. The whole point of this repository is that there's hardly anything in it.

Every pull request is reviewed by the maintainer before it goes in. If a review takes a while, a polite nudge is fine.

## Saying thanks

If it saves you some time, you can [sponsor the work](https://github.com/sponsors/stphnwlsh).
