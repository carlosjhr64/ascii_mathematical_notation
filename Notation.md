# ASCII Mathematical Notation

## Preferences and influences

* [Markdown](http://en.wikipedia.org/wiki/Markdown)
* [Vim Editor](http://www.vim.org)
* [Ruby Programing Language](http://www.ruby-lang.org)
* [First-order logic](http://en.wikipedia.org/wiki/First-order_logic)
* [Second-order logic](http://en.wikipedia.org/wiki/Second-order_logic)

Markdown makes really nice documents from good looking raw text.
I like the Chromium extension
[Markdown Preview Plus](https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl).

Vim is the "grand piano" of text editors.
Its scripting feature presents some very interesting possibilities,
like automatically performing simple logical steps.
I have a ruby gem one can load into vim-ruby,
[ascii_mathematical_notation](https://rubygems.org/gems/ascii_mathematical_notation),
which I document in [Script.md](Script.md).

I may use conventions found in Ruby and CoffeeScript.
I realize there may be languages better suited for this project, but
I'm not familiar with these other languages, such as Haskell.

I will try to match as much as I can the first and second order logic described in Wikipedia.

In any case, my `vim-ruby` [script](Script.md) only acts a line at a time,
treats anything to the right of `#` as a comment, and
spaces from the left margin as indentation.
So treat anything else as suggestions.

## Alphabet

Only ASCII characters allowed, here in order:

-  ! " # $ % & ' ( ) * + , - . /
-  0 1 2 3 4 5 6 7 8 9
-  : ; < = > ? @ 
-  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
-  [ \ ] ^ _ ` 
-  a b c d e f g h i j k l m n o p q r s t u v w x y z
-  { | } ~

This does not mean the raw text can't be transformed to non ASCII characters.
Just that one can legibly write the text in ASCII.

## Words

This list is not yet in order of precedence.
It's just a tentative listing of a possible dictionary.
The words I believe will be in the language I've marked with `Y` -
that is, these are reserved words.
The rest, I believe should be user definable.

| Code   | Symbol | Meaning                    | Binds | Implemented |
|:------:|:------:|:---------------------------|:-----:|:-----------:|
| #      |        | Comment                    | L     | Y           |
| \n     |        | End of completed statement | L     | Y           |
| ;      |        | End of statement           | L     | ?           |
| ::     | ≜      | Definition                 | B     | ?           |
| !      |        | Not                        | R     | ?           |
| =      |        | Equal                      | B     | ?           |
| !=     | ≠      | Not equal                  | B     | ?           |
| =?     |        | Asssumed, find when        | B     | ?           |
| <      |        | Less than                  | B     | ?           |
| <=     | ≤      | Less than or equal         | B     | ?           |
| >      |        | Greater than               | B     | ?           |
| >=     | ≥      | Greater than or equal      | B     | ?           |
| ==>    | ⇒      | Implication                | B     | ?           |
| <=>    | ⇔      | Biconditional              | B     | ?           |
| ?=>    |        | Assumed, find conclusion   | B     | ?           |
| "Word" |        | Ex: Q{a} = "Rational"{a}   | V     | ?           |
| :Word: |        | Ex: Q{a} = :Rational:{a}   | V     | ?           |
| :Word  |        | Ex: Q{a} = :Rational{a}    | V     | ?           |
| ...    | ⋯      | Intuitive continuation     | V     | ?           |
| {⋯}    |        | A set of ...               | L     | ?           |
| [⋯]    |        | Ordered set of ...         | L     | ?           |
| (⋯)    |        | Grouping                   | L     | ?           |
| "      |        | Ditto, previous result     |       | ?           |
| <==    | ⇐      |                            | B     |             |
| -->    | →      |                            | B     |             |
| <--    | ←      |                            | B     |             |
| <->    | ↔      |                            | B     |             |
| .:     | ∵      | Because                    | ?     |             |
| :.     | ∴      | Therefore                  | ?     |             |
| (0/0)  | ∞      | Infinity                   | V     |             |
| !==    | ≢      |                            | B     |             |
| ==     | ≡      |                            | B     |             |
| ~=     | ≈      |                            | B     |             |
| <=<    | ⊆      | Subset                     | B     |             |
| <<<    | ⊂      | Proper Subset              | B     |             |
| >=>    | ⊇      | Superset                   | B     |             |
| >>>    | ⊃      | Proper Superset            | B     |             |
| :=     |        | Assignment (Let...)        | B     |             |
| :      |        | Such that                  | B     |             |
| ,      |        | And (listing)              | B     |             |
| (+)    | ⊕      |                            | B     |             |
| (+-)   | ±      |                            | B     |             |
| "'     | ‴      |                            | ?     |             |
| ""     | ⁗      |                            | ?     |             |

I haven't made up my mind on how to handle `Word`.
I'm already using `:` in several ways, but
using it for `:Word` fits well with how `Ruby` uses `:` for symbols.

## Context

Some meanings are extracted from context.  For example, `a` is in `A`:

    A{a}

Indentation will imply implication:

    A ==> B

    A ==>
      B

    A
      B

    ...
    A # If this block is true,
      B # then this block is true.
      ...

For all `a` in `A`, `a` is also in `B`:

    A{a}(B{a}) # Expressed as second order logic
    A{a} ==> B{a} # Expressed as first order logic

There exists `a` in `A` such that `a` is also in `B`:

    A{a}:(B{a})

I think anything else can be defined as need be.  For example:

    N :: {1,2,3,...}
    Z+ :: {0,1,2,3,...}
    Q+{q} :: N{m,n}:(q=m/n)

Note that a function takes an ordered set of parameters, arguments, variables...
A function of f of x,y is most apropriately written as:

    F[x,y] = Ax^2 + Bxy + c # For example

Note that with an ordered set [a,b,c,d,e], the following makes sense:

    [a,b,c,d,e][2] = b # b is the second element

This may look a bit strange, but for emphasis I may write:

    a := A{a} # Let a be an element in A
    # I see these as being equivalent:
    A{a} :: a:=A{a} :: {a}:(A{a})

Honestly, I'm just conjuring these sequence of characters and telling you how I read them.
But does it make sense?  Yes?  No?  And why?

## Examples

* [The Logic Game](examples/LogicGame.md)
* [Definitions](examples/Definitions.md)
* [Complex Numbers](examples/ComplexNumbers.md)
* [Space Vectors](examples/SpaceVectors.md)
* [Quaternions](examples/Quaternions.md)

Lastly, I want to mention that github supports
[emoji](http://www.emoji-cheat-sheet.com):heavy_exclamation_mark:
