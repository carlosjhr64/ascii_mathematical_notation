# ASCII Mathematial Notation

## Preferences and influences

* [Markdown](http://en.wikipedia.org/wiki/Markdown)
* [Ruby Programing Language](http://www.ruby-lang.org)
* [First-order logic](http://en.wikipedia.org/wiki/First-order_logic)
* [Second-order logic](http://en.wikipedia.org/wiki/Second-order_logic)

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

| Code          | Meaning                | Binds  |
|:-------------:|:-----------------------|:-------|
| #             | Comment                | Right  |
| !             | Not                    | Right  |
| ::            | Definition             |        |
| ==>           | Implication            |        |
| <=>           | Biconditional          |        |
| :=            | Assignment (Let...)    | Binary |
| :             | Such that              |        |
| =             | Equal                  | Binary |
| !=            | Not Equal              | Binary |
| >             | Greater than           | Binary |
| >=            | Greater than or equal  | Binary |
| <             | Less than              | Binary |
| <=            | Less than or equal     | Binary |
| ,             | And                    |        |
| ...           | Intuitive continuation |        |
| {...}         | A set of ...           | Left   |
| (...)         | Grouping               | Left   |

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

## Examples
