# daley_helpers

A personal grab-bag of dev helpers, dotfiles, templates, and reference snippets — the stuff worth
copying into a new machine or a new project instead of rewriting from scratch.

> These are **starter/mock templates**. Read before you run them and swap in your own values
> (account IDs, bucket names, regions, etc.).

## Layout

| Folder        | What's in it                                                        |
|---------------|---------------------------------------------------------------------|
| `dotfiles/`   | Shell + git config: `.zshrc`, `aliases.zsh`, `.gitconfig`           |
| `algos/`      | Reference algorithm implementations (search, sort, graphs)          |
| `terraform/`  | Terraform (`tf`) starter — provider, variables, outputs             |
| `ci/`         | CI pipeline templates (GitHub Actions)                              |
| `aws/`        | AWS helper scripts (CLI + boto3)                                    |
| `scripts/`    | General-purpose shell scripts (backup, mac setup)                   |
| `testing/`    | Test scaffolding and examples (pytest)                             |
| `claude/`     | Claude API example + Claude Code `CLAUDE.md` / `settings.json`       |
| `kubernetes/` | Deployment / Service / Ingress manifests + Kustomize                |
| `docker/`     | `Dockerfile` + `docker-compose.yml` starters                        |
| `python/`     | Reusable Python utilities (logging, config)                         |
| `git/`        | Git hooks and shared config                                         |

## Quick start

```bash
# symlink the dotfiles into your home dir (review first!)
ln -sf "$PWD/dotfiles/.zshrc"    ~/.zshrc
ln -sf "$PWD/dotfiles/.gitconfig" ~/.gitconfig

# run the mac bootstrap
./scripts/setup_mac.sh

# see all make targets
make help
```
