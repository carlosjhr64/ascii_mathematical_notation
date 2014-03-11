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
I have an example script file, [lib/script.rb](lib/script.rb).
And I document its use in [Script.md](Script.md).

I may use conventions found in Ruby and CoffeeScript.
I realize there may be languages better suited for this project, but
I'm not familiar with these other languages, such as Haskell.

I will try to match as much as possible the first and second order logic described in Wikipedia.

## Valid characters

Only ASCII characters allowed, here in order:

-  ! " # $ % & ' ( ) * + , - . /
-  0 1 2 3 4 5 6 7 8 9
-  : ; < = > ? @ 
-  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
-  [ \ ] ^ _ ` 
-  a b c d e f g h i j k l m n o p q r s t u v w x y z
-  { | } ~

## Meanings

| Code          | Meaning                  | Binds  |
|:-------------:|:-------------------------|:-------|
| #             | Comment                  | Right  |
| ;             | End of statement         |        |
| \n            | End of statement         |        |
| !             | Not                      | Right  |
| ::            | Definition               |        |
| ==>           | Implication              |        |
| ?=>           | Assumed, find conclusion |        |
| <=>           | Biconditional            |        |
| :=            | Assignment (Let...)      | Binary |
| :             | Such that                |        |
| =             | Equal                    | Binary |
| =?            | Asssumed, find when      | Binary |
| !=            | Not Equal                | Binary |
| >             | Greater than             | Binary |
| >=            | Greater than or equal    | Binary |
| <             | Less than                | Binary |
| <=            | Less than or equal       | Binary |
| ,             | And                      |        |
| ...           | Intuitive continuation   |        |
| {...}         | A set of ...             | Left   |
| [...]         | Ordered set of ...       | Left   |
| (...)         | Grouping                 | Left   |

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
    Q{q} :: N{m,n}:(q=m/n)

Note that a function takes an ordered set of parameters, arguments, variables...
A function of f of x is most apropriately written as:

    F[x] = Ax^2 + Bx + c # For example

Note that with an ordered set [a,b,c,d,e], the following makes sense:

    [a,b,c,d,e][2] = b # b is the second element

## Examples

* [Complex Numbers](examples/ComplexNumbers.md)
* [Space Vectors](examples/SpaceVectors.md)
* [Quaternions](examples/Quaternions.md)
