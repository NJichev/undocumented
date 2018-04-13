# Undocumented

A simple library that checks your project for missing documentation.

## Usage

Undocumented comes with a mix task that you just have to run inside your project:

```bash
mix undocumented
```

## Installation

Add undocumented to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:undocumented, "~> 0.1.0", only: [:dev, :test], runtime: false}
  ]
end
```

