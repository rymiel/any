# Any

A nefarious little library to ""safely"" break the type system and perform type erasure in Crystal

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     any:
       gitlab: rymiel/any
   ```

2. Run `shards install`

## Usage

```crystal
require "any"

erased_string = Any.new "Hello, world!"
puts erased_string.value(String) # => Hello, world!
erased_string.value(Int32) # Throws at runtime!
```

## Contributing

1. Fork it (<https://gitlab.com/rymiel/any/-/forks/new>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Merge Request

## Contributors

- [Emilia Dreamer](https://gitlab.com/rymiel) - creator and maintainer
