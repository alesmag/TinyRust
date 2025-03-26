<h1 align="center">TinyRust</h1>

<p align="center">
  <em>University Project</em>
</p>

<p align="center">
  <strong>Built with:</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/OCaml-EC6813?style=for-the-badge&logo=ocaml&logoColor=white" alt="OCaml">
  <img src="https://img.shields.io/badge/Dune-2E2D2D?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHBhdGggZmlsbD0id2hpdGUiIGQ9Ik0xMiAwTDAgMTJ2MTJoMjRWMHoiLz48L3N2Zz4=&logoColor=white" alt="Dune">
</p>

---

## Table of Contents

- [About the Project](#about-the-project)
- [Requirements](#requirements)
- [Usage](#usage)

## About the Project

TinyRust is a group project developed by [Me](https://github.com/alesmag), [Anna Chiara Mameli](https://github.com/Pandanna) and [Alessio Gallo](https://github.com/ale-gll) for the University of Cagliari. 
This project was intended to be a Rust compiler built entirely with OCaml. The scope of this project was essentialy to define an imperative language. 

## Requirements

TinyRust requires:
- OCaml
- Dune

### Installation

#### Ubuntu/Debian
```sh
sudo apt update && sudo apt install -y dune
```

#### Fedora
```sh
sudo dnf install -y dune
```

#### macOS (Homebrew):
```sh
brew install dune
```

After having installed Dune, one can simply use:
```sh
dune install ocaml
```

## Usage

### Building the Project
To compile the project, run the following commands (inside lip24/):
```sh
dune build
```

### Running the project
The project runs Rust files. To run the test files, run:
```sh
dune test
```

But in order to run custom Rust files, one would need to modify the project and manually add the Rust code into lip24/test/test_lip24.ml, adding a new test case.


### Cleaning the Build
To remove compiled files and reset the build directory, run:
```sh
dune clean
```
