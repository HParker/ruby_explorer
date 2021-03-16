# [Ruby Explorer](https://www.rubyexplorer.xyz)

Explore Ruby's VM easily in your browser!

- See what instructions are generated
- Configure the compiler optimizations to see how you instructions change
- See the Lex & S-Expressions that your program is converted to

Contributions welcome!

## How to build

```
bundle install
./bin/rails s
./bin/webpack-dev-server # (in another tab)
```

A database connection is required, but not used. Any old postgres URL will do. Hopefully we will remove the database requirement eventually.
