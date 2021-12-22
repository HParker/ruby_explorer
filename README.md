# [Ruby Explorer](https://www.rubyexplorer.xyz)

<img width="1147" alt="Screen Shot 2021-12-22 at 1 10 39 PM" src="https://user-images.githubusercontent.com/4482399/147156233-d3919865-c14d-4b7c-9076-28870c7e9333.png">


Explore Ruby's VM easily in your browser!

- See what instructions are generated
- Configure the compiler optimizations to see how you instructions change
- See the Lex & S-Expressions that your program is converted to

Updates the instructions when you finish typing!

Contributions welcome!

## How to build

```
bundle install
./bin/rails s
./bin/webpack-dev-server # (in another tab)
```

A database connection is required, but not used. Any old postgres URL will do. Hopefully we will remove the database requirement eventually.
