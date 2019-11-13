# IHaskell notebooks

A cleaned copy of https://github.com/vaibhavsagar/notebooks

## Usage

```
cd scratch
$(nix-build)/bin/ihaskell-notebook
```

## Extending

Copy `scratch`
```
cp -r scratch my-new-universe
cd my-new-universe
```

Update `my-new-universe/default.nix`

```
$(nix-build)/bin/ihaskell-notebook
```
