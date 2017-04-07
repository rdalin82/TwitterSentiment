# Twitter

Small application that leverages OTP design patterns and twitter streaming api to cache sentiment analysis on twitter search terms.  

# Typical use

```
> Runner.run("apples")
> Runner.stats
{apples: 5}

```
# Installation

```
mix deps.get

```

```elixir
defp deps do
  [{:extwitter, ">= 0.8.1"},
   {:sentient, "~> 0.0.2", git: "https://github.com/rdalin82/sentient.git"},
   {:flow, "~> 0.11"}
 ]
end
```
