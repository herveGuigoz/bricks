## Bricks

Set of [Mason](https://github.com/felangel/mason/tree/master/packages/mason_cli) bricks for Dart projects.

### Lists globally installed bricks.

```bash
mason ls -g
```

### Adds a brick.

Use `mason add` command to add brick templates globally on your machine.

```bash
mason add <name> -g --git-url https://github.com/herveGuigoz/bricks --git-path bricks/<name>
```

### Create new brick

Use `mason new` command to create a new brick 

```bash
mason new <brick>
mason add <brick> --path <brick>/
```

### Usage

Use `mason make` to generate your file(s):

```bash
mason make <brick>
```

### Generate a bundle

Use `mason bundle` to generate a bundle for an existing template.

```bash
# Dart Bundle
mason bundle -t dart ./bricks/brick
```
