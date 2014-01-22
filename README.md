# ShuffleStep

This program is being written for an upcoming [ElixirDose.com](http://elixirdose.com) article.

In it, we will seek to discover if the `shuffle` function mixes up an array better if it's run more than once.

There's a mix dependence in here for Elixir 12.3-dev.  You might want to change that if you're not running the most up-to-date version of Elixir and Erlang.

UPDATE: January 21, 2014  This code is generally complete.  I run it by jumping into `iex` and running ShuffleStep.run(x), where x is the number of shuffles you want to give the deck.

TO DO: My biggest hope is to turn this into a massive computation problem and run it with some parallel processing. Spawn sessions, pass pids, the whole lot.  That's the next step and the next tutorial.  I hope.  Chapter 13 of Dave Thomas' book is still bending my mind into the proper shape for that.
