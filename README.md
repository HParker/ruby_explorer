# [Ruby Explorer](https://www.rubyexplorer.xyz)

<img width="1237" alt="Screen Shot 2021-04-21 at 10 05 35 AM" src="https://user-images.githubusercontent.com/4482399/115593290-30549180-a289-11eb-9ef8-677c695aab1d.png">

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
